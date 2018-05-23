//copyright iadix 2016
#define TRACER_API C_EXPORT
#include <base/std_def.h>
#include <base/std_mem.h>
#include <base/mem_base.h>
#include <base/std_str.h>
#include <strs.h>
#include <fsio.h>

#include <tree.h>

#include <mem_stream.h>

#include <crypto.h>

#include <libc_math.h>
#include <vec_types.h>
#include <ray_float.h>

#include "libpng-1.2.18/png.h"

#include "tracer.h"

#include "../block_adx/block_api.h"

typedef struct{
	unsigned int img_id;
	unsigned int x_pos;
	unsigned int y_pos;

}image_bind_t;
typedef struct{
	int texid;
	unsigned int w;
	unsigned int h;
	unsigned int x_pos;
	unsigned int y_pos;
	unsigned int n_images;
	image_bind_t images[16];
}render_texture_t;

unsigned int cubemap_right = 0xFF;
unsigned int cubemap_left = 0xFF;
unsigned int cubemap_up = 0xFF;
unsigned int cubemap_down = 0xFF;
unsigned int cubemap_forward = 0xFF;
unsigned int cubemap_backward = 0xFF;

unsigned int NODE_HASH_size = 0xFFFFFFFF, NODE_HASH_radius = 0xFFFFFFFF, NODE_HASH_sqradius = 0xFFFFFFFF, NODE_HASH_center = 0xFFFFFFFF, NODE_HASH_refract_density = 0xFFFFFFFF, NODE_HASH_refract = 0xFFFFFFFF, NODE_HASH_reflect = 0xFFFFFFFF, NODE_HASH_planes = 0xFFFFFFFF, NODE_HASH_mat = 0xFFFFFFFF, NODE_HASH_norm = 0xFFFFFFFF,
			 NODE_HASH_nmat = 0xFFFFFFFF, NODE_HASH_imat = 0xFFFFFFFF, NODE_HASH_inmat = 0xFFFFFFFF, NODE_HASH_material = 0xFFFFFFFF, NODE_HASH_texture_id = 0xFFFFFFFF, NODE_HASH_color = 0xFFFFFFFF, NODE_HASH_bmin = 0xFFFFFFFF, NODE_HASH_bmax = 0xFFFFFFFF, NODE_HASH_id = 0xFFFFFFFF, NODE_HASH_plane=0xFFFFFFFF;

typedef struct
{
	hash_t				sceneId;
	unsigned int		cubemap_ids[6];

	planef_t			*planes ;
	size_t				n_planes;

	materialf_t			*materials ;
	size_t				n_materials;

	spheref_t			*spheres;
	size_t				n_spheres;

	cubef_t				*cubes;
	size_t				n_cubes;

	cylf_t				*cyls;
	size_t				n_cyls;

	box_testf_t			*box_testf;
	unsigned int		n_boxf;

	render_texture_t	render_texture1;
	render_texture_t	render_texture2;
		

	image_t				textures[32];
	unsigned int		n_textures;

	int					idMat;

	mem_zone_ref_ptr	scene_ptr;
}scene_t;



scene_t				*scene_list[256]	= { PTR_INVALID };
mem_zone_ref		scenes[256]			= { PTR_INVALID };
unsigned int		n_scenes			= 0xFFFFFFFF;
hash_t				null_hash			= { 0xFF };
unsigned int		scenes_lck = 0xFF;


#ifdef HAS_RENDER
int			shaderId = 0xFFFFF;
int			cubeMapId = 0xFFFFF;
int			boxDataId = 0xFFFFF;
int			texure1Id = 0xFFFFF;


C_IMPORT int C_API_FUNC  createCubeMap(unsigned int w, unsigned int h, image_t *images[6]);
C_IMPORT void C_API_FUNC set_pixel(unsigned int X, unsigned int Y, unsigned long *pix);
C_IMPORT unsigned long * C_API_FUNC get_pixel_addr(unsigned int x, unsigned int y);
C_IMPORT int C_API_FUNC  loadFullShader(const char *vertSource, const char *fragSource);
C_IMPORT int C_API_FUNC  loadUniforms(unsigned int prog_id, mem_zone_ref_ptr shader_vars);
C_IMPORT int C_API_FUNC  load_tex1D_f(unsigned int TexId, float *data, size_t len);
C_IMPORT int C_API_FUNC  createRGBTexturef(unsigned int w, unsigned int h);
C_IMPORT int C_API_FUNC  createRGBTexture(unsigned int w, unsigned int h);
C_IMPORT int C_API_FUNC  loadRGBTexture(unsigned int texId, unsigned int x, unsigned int y, unsigned int w, unsigned int h, unsigned char *data);

C_IMPORT void C_API_FUNC  use_textureCubeMap(unsigned int Unit, unsigned int texId);
C_IMPORT void C_API_FUNC  use_texture2D(unsigned int Unit, unsigned int texId);
C_IMPORT void C_API_FUNC  draw_mesh(vec3f_t v[], vec2f_t uv[], unsigned int *indexes, unsigned int ntris);
C_IMPORT void C_API_FUNC  draw_mesh2D(vec2f_t v[], vec2f_t uv[], unsigned int *indexes, unsigned int ntris);
C_IMPORT void C_API_FUNC  clear_screen();
vec3f_t quad[4] = { { -1.0f, -1.0f, 10.0f, 1.0f }, { 1.0f, -1.0f, 10.0f, 1.0f }, { 1.0f, 1.0f, 10.0f, 1.0f }, { -1.0f, 1.0f, 10.0f, 1.0f } };
vec2f_t uv[4] = { { 0.0f, 0.0f }, { 0.0f, 1.0f }, { 1.0f, 1.0f }, { 1.0f, 0.0f } };
unsigned int indexes[6] = { 0, 1, 2, 2, 3, 0};

size_t		target_w = 0xFFFFF, target_h = 0xFFFFF;
rayf_t		*raysf = PTR_INVALID;
#endif



void C_API_FUNC user_read_data(png_structp png_ptr, png_bytep data, png_size_t length)
{
	mem_stream  *file = (mem_stream  *)png_get_io_ptr(png_ptr);

	mem_stream_read(file, data, length);
}


png_voidp png_malloc_c(png_structp png_ptr, png_size_t size)
{
	if (png_ptr == NULL || size == 0)
		return (NULL);
	return calloc_c(size, 1);
}

void png_free_c(png_structp png_ptr, png_voidp ptr)
{
	if (png_ptr == NULL || ptr == NULL)
		return;

	free_c(ptr);
	return;
}
int load_png_image(image_t	*img, const char *fileName)
{
	unsigned int	is_alpha;
	int				iy, ix;
	int				width, height;
	png_byte		color_type;
	png_byte		bit_depth;
	png_structp		 png_ptr;
	png_infop		info_ptr;
	int				number_of_passes;
	png_color		*palette = NULL;
	int				num = 255;
	png_color_16    *color = NULL;
	unsigned char   *trnsp = NULL;
	int				ntr;
	png_bytep		*row_pointers;
	unsigned char	*file_data;
	mem_stream		file;
	
	file.data.zone = PTR_NULL;
	if (get_file_to_memstream(fileName, &file) <= 0)
		return 0;

	file_data = get_zone_ptr(&file.data, file.buf_ofs);

	if (png_sig_cmp((unsigned char *)file_data, 0, 8))return 0;

	/* initialize stuff */
	png_ptr = png_create_read_struct_2(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL, NULL, png_malloc_c, png_free_c);
	if (!png_ptr){ return 0; }


	info_ptr = png_create_info_struct(png_ptr);
	if (!info_ptr){ return 0; }
	/*if (setjmp(png_jmpbuf(png_ptr))){return false;}*/

	png_set_read_fn(png_ptr, &file, user_read_data);
	png_read_info(png_ptr, info_ptr);

	width = info_ptr->width;
	height = info_ptr->height;
	color_type = info_ptr->color_type;
	bit_depth = info_ptr->bit_depth;

	strcpy_cs(img->name, 32, fileName);
	img->w = width;
	img->h = height;
	img->size = img->w*img->h * 3;
	img->pixels = malloc_c(img->size);
	
	//gfx_allocate_image(img, width, height, GFX_PIX_FORMAT_RGBA);

	number_of_passes = png_set_interlace_handling(png_ptr);

	png_read_update_info(png_ptr, info_ptr);


	/* read file */
	/*if (setjmp(png_jmpbuf(png_ptr))){return false;}*/

	row_pointers = (png_bytep*)calloc_c(sizeof(png_bytep) * height, 1);

	for (iy = 0; iy<height; iy++)
		row_pointers[iy] = (png_byte*)calloc_c(info_ptr->rowbytes, 1);

	png_read_image(png_ptr, row_pointers);
	ntr = 0;

	/*
	kernel_log	(kernel_log_id,"png num channels ");
	writeint	(info_ptr->channels,10);
	writestr	("\n");
	*/


	switch (info_ptr->channels)
	{
	case 1:

		png_get_PLTE(png_ptr, info_ptr, &palette, &num);
		png_get_tRNS(png_ptr, info_ptr, &trnsp, &ntr, &color);

		if (ntr>0)
		{
			is_alpha = 1;
		}

		for (iy = 0; iy<height; iy++)
		{
			unsigned char *cptr = &img->pixels[width*3*iy];
			for (ix = 0; ix<width; ix++)
			{
				int		istran = 0;
				unsigned char c = row_pointers[iy][ix];
				cptr[ix * 3 + 0] = palette[c].blue;
				cptr[ix * 3 + 1] = palette[c].green;
				cptr[ix * 3 + 2] = palette[c].red;
				/*
				for (n = 0; n<ntr; n++)
				{
					if (trnsp[n] == c)istran = 1;
				}
				if (istran)
					cptr[ix * 4 + 3] = 0;
				else
					cptr[ix * 4 + 3] = 255;
					*/
			}
		}
		break;
	case 3:
		for (iy = 0; iy<height; iy++)
		{
			unsigned char *cptr = &img->pixels[width * 3 * iy];
			for (ix = 0; ix<width; ix++)
			{
				int		istran = 0;

				cptr[ix * 3 + 0] = row_pointers[iy][ix * 3 + 2];
				cptr[ix * 3 + 1] = row_pointers[iy][ix * 3 + 1];
				cptr[ix * 3 + 2] = row_pointers[iy][ix * 3 + 0];

				/*
				for (n = 0; n<ntr; n++)
				{
					if ((color[n].red == row_pointers[iy][ix * 3 + 0]) &&
						(color[n].green == row_pointers[iy][ix * 3 + 1]) &&
						(color[n].blue == row_pointers[iy][ix * 3 + 2]))
						istran = 1;
				}

				if (istran)
					cptr[ix * 4 + 3] = 0;
				else
					cptr[ix * 4 + 3] = 255;
					*/
			}
		}
		break;
	case 4:
		for (iy = 0; iy<height; iy++)
		{
			unsigned char *cptr = &img->pixels[width * 3 * iy];
			for (ix = 0; ix<width; ix++)
			{
				cptr[ix * 3 + 0] = row_pointers[iy][ix * 4 + 2];
				cptr[ix * 3 + 1] = row_pointers[iy][ix * 4 + 1];
				cptr[ix * 3 + 2] = row_pointers[iy][ix * 4 + 0];
				//cptr[ix * 4 + 3] = row_pointers[iy][ix * 4 + 3];
			}
		}
		is_alpha = 1;
		break;
	}

	mem_stream_close(&file);
	return 1;
}




void getTexPix(image_t *texture, float *uv_coord, unsigned char *pix)
{
	unsigned int texX, texY;

	if (texture->pixels == NULL)return;

	libc_ftol(uv_coord[0] * texture->w, &texX);
	libc_ftol(uv_coord[1] * texture->h, &texY);

	if (texX >=texture->w)texX = texture->w-1;
	if (texX < 0)texX = 0;

	if (texY >= texture->h)texY = texture->h - 1;
	if (texY < 0)texY = 0;

	
	
	pix[0] = texture->pixels[(texY * 512 + texX) * 3 + 2];
	pix[1] = texture->pixels[(texY * 512 + texX) * 3 + 1];
	pix[2] = texture->pixels[(texY * 512 + texX) * 3 + 0];
}

void getTexPix_32(const image_t *texture, float *uv_coord, int *pix,int mode)
{
	int texX,texY,tex;
	if (texture->pixels == NULL)return;

	libc_ftol(uv_coord[0] * texture->w, &texX);
	libc_ftol(uv_coord[1] * texture->h, &texY);

	texX = (texX % texture->w);
	if (texX < 0)texX += texture->w;
	texY = (texY % texture->h);
	if (texY < 0)texY += texture->h;
	tex = (texY*texture->w + texX) * 3;

	pix[0] = texture->pixels[tex + 2];
	pix[1] = texture->pixels[tex + 1];
	pix[2] = texture->pixels[tex + 0];
}

void getTexPix_32uc(const image_t *texture, float *uv_coord, unsigned char *pix)
{
	int texX;
	if (texture->pixels == NULL)return;

	texX = ((unsigned int)(uv_coord[1] * texture->h))*(texture->w * 3) + ((unsigned int)(uv_coord[0] * texture->w))*(3);
	pix[0] = texture->pixels[texX + 2];
	pix[1] = texture->pixels[texX + 1];
	pix[2] = texture->pixels[texX + 0];
}

void init_scene(scene_t *scene)
{
	memset_c(scene->cubemap_ids, 0, sizeof(unsigned int)*6);
	memset_c(scene->sceneId, 0, sizeof(hash_t));

	scene->planes		= PTR_NULL;
	scene->n_planes		= 0;

	scene->materials	= PTR_NULL;
	scene->n_materials	= 0;;

	scene->spheres		= PTR_NULL;
	scene->n_spheres	= 0;

	scene->cubes		= PTR_NULL;
	scene->n_cubes		= 0;

	scene->cyls			= PTR_NULL;
	scene->n_cyls		= 0;

	scene->box_testf	= PTR_NULL;
	scene->n_boxf		= 0;


	scene->scene_ptr		= PTR_NULL;

	scene->render_texture1.w = 2048;
	scene->render_texture1.h = 2048;
	scene->render_texture1.x_pos = 0;
	scene->render_texture1.y_pos = 0;
	scene->render_texture1.n_images = 0;
	scene->render_texture1.texid = -1;

	scene->render_texture2.w = 2048;
	scene->render_texture2.h = 2048;
	scene->render_texture2.x_pos = 0;
	scene->render_texture2.y_pos = 0;
	scene->render_texture2.n_images = 0;
	scene->render_texture2.texid = -1;

	memset_c			(&scene->render_texture1, 0,sizeof(render_texture_t));
	memset_c			(&scene->render_texture2, 0, sizeof(render_texture_t));

//	scene->id_var		=1;
	scene->idMat		=1;

	memset_c			(scene->textures,0,sizeof(image_t)*32);
	scene->n_textures	=0;


}

OS_API_C_FUNC(int) find_scene(hash_t h)
{
	unsigned int n;

	while (scenes_lck != 0)
	{
		snooze_c(1000);
	}
	for (n = 0; n < n_scenes; n++)
	{
		if (!memcmp_c(scene_list[n]->sceneId, h, sizeof(hash_t)))
			return 1;
	}
	return 0;
}

scene_t * get_scene_ptr(hash_t h)
{
	unsigned int n;
	for (n = 0; n < n_scenes; n++)
	{
		if (!memcmp_c(scene_list[n]->sceneId, h, sizeof(hash_t)))
			return scene_list[n];
	}
	return PTR_NULL;
}


OS_API_C_FUNC(int) read_texture(scene_t *scene,const char *file)
{
	unsigned char	*file_data;
	unsigned int	cur_id;
	size_t			file_len,h,flen;


	flen = strlen_c(file);
	cur_id = scene->n_textures++;

	if (!stricmp_c(&file[flen - 3], "bmp"))
	{
		if (get_file(file, &file_data, &file_len) <= 0)
			return -1;

		strcpy_cs(scene->textures[cur_id].name, 64, file);
		scene->textures[cur_id].w = 512;
		scene->textures[cur_id].h = 512;
		scene->textures[cur_id].size = 512 * 512 * 3;
		scene->textures[cur_id].pixels = (unsigned char *)malloc_c(scene->textures[cur_id].size);

		h = 0;
		while (h < 512)
		{
			memcpy_c(scene->textures[cur_id].pixels + ((511 - h) * 512 * 3), &file_data[54 + (h * 512 * 3)], 512 * 3);
			h++;
		}

		free_c(file_data);
	}
	else if (!stricmp_c(&file[flen - 3], "png"))
	{
		load_png_image(&scene->textures[cur_id], file);
	}

	return cur_id;
}

OS_API_C_FUNC(int) add_texture(scene_t *scene,hash_t binH)
{
	char			mime[64];
	hash_t			bh;
	struct string	app_name = { 0 };
	mem_zone_ref	tx = { 0 }, file = { 0 };
	unsigned int	cur_id;
	int				ret;

	if (!load_tx(&tx, bh, binH))return -1;

	tree_manager_create_node("file", NODE_GFX_OBJECT, &file);

	ret=get_app_file(&tx, &app_name, &file);
	release_zone_ref(&tx);
	if (!ret)return -1;

	ret = (!strcmp_c(app_name.str, "raytrace")) ? 1 : 0;
	free_string(&app_name);

	if (ret)ret = tree_manager_get_child_value_str(&file, NODE_HASH("mime"), mime, 64, 0);
	if (ret)ret = (!strcmp_c(mime, "image/png")) ? 1 : 0;


	if (!ret)
	{
		release_zone_ref(&file);
		return -1;
	}
	cur_id = scene->n_textures++;
	tree_manager_get_child_value_i32	(&file, NODE_HASH("size"), &scene->textures[cur_id].filesize);
	tree_manager_get_child_value_str	(&file, NODE_HASH("filename"), scene->textures[cur_id].name, 64, 0);
	tree_manager_get_child_value_hash	(&file, NODE_HASH("dataHash"), scene->textures[cur_id].fileH);

	scene->textures[cur_id].w = 512;
	scene->textures[cur_id].h = 512;

	release_zone_ref(&file);

	return cur_id;

}

OS_API_C_FUNC(int) get_image_list(hash_t id, mem_zone_ref_ptr out)
{
	unsigned int	n;
	scene_t			*scene;

	scene = get_scene_ptr(id);
	if (scene == PTR_NULL)return 0;

	for (n = 0; n < scene->n_textures; n++)
	{
		mem_zone_ref image = { PTR_NULL };
		if (tree_manager_add_child_node(out, scene->textures[n].name, NODE_GFX_IMAGE, &image))
		{
			char img_url[256];
			int  nn=0;
			int cur;

			strcpy_cs(img_url, 256,"/app/raytrace/file/");
			cur = strlen_c(img_url);
			nn = 0;
			while (nn < 32)
			{
				img_url[cur + (nn * 2 + 0)] = hex_chars[scene->textures[n].fileH[31-nn] >> 0x04];
				img_url[cur + (nn * 2 + 1)] = hex_chars[scene->textures[n].fileH[31 - nn] & 0x0F];
				nn++;
			}
			img_url[cur+64] = 0;

			tree_manager_set_child_value_str(&image, "name", scene->textures[n].name);
			tree_manager_set_child_value_i32(&image, "filesize", scene->textures[n].filesize);
			tree_manager_set_child_value_str(&image, "url", img_url);
			tree_manager_set_child_value_i32(&image, "width", scene->textures[n].w);
			tree_manager_set_child_value_i32(&image, "height", scene->textures[n].h);
			release_zone_ref(&image);
		}
	}
	return scene->n_textures;

}

OS_API_C_FUNC(int) get_scene_ref(hash_t id,  mem_zone_ref_ptr out)
{
	mem_zone_ref		my_list = { PTR_NULL }, ol = { PTR_NULL }, objs = { PTR_NULL };
	mem_zone_ref_ptr	object = PTR_NULL,my_list_ptr;
	scene_t				*scene_ptr;

	scene_ptr = get_scene_ptr(id);
	if (scene_ptr == PTR_NULL)return 0;

	tree_manager_add_child_node(out, "sphere_list", NODE_JSON_ARRAY, PTR_NULL);
	tree_manager_add_child_node(out, "cube_list", NODE_JSON_ARRAY, PTR_NULL);
	tree_manager_add_child_node(out, "cylinder_list", NODE_JSON_ARRAY, PTR_NULL);
	tree_manager_add_child_node(out, "plane_list", NODE_JSON_ARRAY, PTR_NULL);


	if ((get_zone_area_type(scene_ptr->scene_ptr) & 0x10) == 0)
		my_list_ptr = &my_list;


	tree_manager_find_child_node(scene_ptr->scene_ptr, NODE_HASH("objects"), NODE_JSON_ARRAY, &objs);

	for (tree_manager_get_first_child_shared(&objs, &my_list_ptr, &object); ((object != NULL) && (object->zone != NULL)); tree_manager_get_next_child_shared(&my_list_ptr, &object))
	{
		switch (tree_mamanger_get_node_type(object))
		{
			case NODE_RT_SPHERE:
				if (tree_manager_find_child_node(out, NODE_HASH("sphere_list"), NODE_JSON_ARRAY, &ol))
				{
					tree_manager_node_add_child(&ol, object);
					release_zone_ref(&ol);
				}
			break;
			case NODE_RT_CUBE:
				if (tree_manager_find_child_node(out, NODE_HASH("cube_list"), NODE_JSON_ARRAY, &ol))
				{
					tree_manager_node_add_child(&ol, object);
					release_zone_ref(&ol);
				}
			break;
			case NODE_RT_CYLINDER:
				if (tree_manager_find_child_node(out, NODE_HASH("cylinder_list"), NODE_JSON_ARRAY, &ol))
				{
					tree_manager_node_add_child(&ol, object);
					release_zone_ref(&ol);
				}
			break;
			case NODE_RT_PLANE:
				if (tree_manager_find_child_node(out, NODE_HASH("plane_list"), NODE_JSON_ARRAY, &ol))
				{
					tree_manager_node_add_child(&ol, object);
					release_zone_ref(&ol);
				}
			break;
			/*default:tree_manager_node_add_child(out, object); break;*/
		}
	}	
	release_zone_ref(&objs);

	for (tree_manager_get_first_child_shared(scene_ptr->scene_ptr, &my_list_ptr, &object); ((object != NULL) && (object->zone != NULL)); tree_manager_get_next_child_shared(&my_list_ptr, &object))
	{
		switch (tree_mamanger_get_node_type(object))
		{
			case NODE_JSON_ARRAY:
				continue;
			break;
			default:tree_manager_node_add_child(out, object); break;
		}
	}

	return 1;
}
OS_API_C_FUNC(int) read_cubemap_texture(scene_t *scene_ptr, const char *maps[6])
{
	mem_zone_ref	cubemap_node = { PTR_NULL };
	size_t			i;
	for (i = 0; i < 6; i++)
	{
		scene_ptr->cubemap_ids[i] = read_texture(scene_ptr,maps[i]);
	}

	if (!tree_manager_find_child_node(scene_ptr->scene_ptr, NODE_HASH("cubemap"), NODE_RT_CUBEMAP, &cubemap_node))
		tree_manager_add_child_node(scene_ptr->scene_ptr, "cubemap", NODE_RT_CUBEMAP, &cubemap_node);
	
	tree_manager_write_node_data(&cubemap_node, scene_ptr->cubemap_ids, 0, 6 * sizeof(unsigned int));

	release_zone_ref(&cubemap_node);

	return 1;
}

#ifdef HAS_RENDER
void load_images(render_texture_t *texture)
{
	int n;
	if (texture->texid < 0)return;
	for (n = 0; n < texture->n_images; n++)
	{
		image_t *image = &textures[texture->images[n].img_id];
		loadRGBTexture(texture->texid, texture->images[n].x_pos, texture->images[n].y_pos, image->w, image->h, image->pixels);
	}
}
#endif

void add_image(scene_t *scene_ptr, render_texture_t *texture, unsigned int image_id)
{
	image_t *image = &scene_ptr->textures[image_id];
	if ((texture->x_pos + image->w)>texture->w)
	{
		texture->x_pos = 0;
		texture->y_pos += image->h;
	}
	texture->images[texture->n_images].img_id = image_id;
	texture->images[texture->n_images].x_pos  = texture->x_pos;
	texture->images[texture->n_images].y_pos  = texture->y_pos;
	
	#ifdef HAS_RENDER
		if (texture->texid>0)
			loadRGBTexture(texture->texid, texture->images[texture->n_images].x_pos, texture->images[texture->n_images].y_pos, image->w, image->h, image->pixels);
	#endif

	texture->x_pos += image->w;

	texture->n_images++;
	
}

int get_image_uv(scene_t *scene_ptr, render_texture_t *texture, unsigned int image_id, vec2f_t pos, vec2f_t scale)
{
	unsigned int n = 0;

	while (n < texture->n_images)
	{
		if (texture->images[n].img_id == image_id)
		{
			pos[0] = (float)(texture->images[n].x_pos) / (float)(texture->w);
			pos[1] = (float)(texture->images[n].y_pos) / (float)(texture->h);
			scale[0] = (float)(scene_ptr->textures[image_id].w) / (float)(texture->w);
			scale[1] = (float)(scene_ptr->textures[image_id].h) / (float)(texture->h);
			return 1;
		}
		n++;
	}

	add_image(scene_ptr,texture, image_id);

	pos[0] = (float)(texture->images[texture->n_images - 1].x_pos) / (float)(texture->w);
	pos[1] = (float)(texture->images[texture->n_images - 1].y_pos) / (float)(texture->h);
	scale[0] = (float)(scene_ptr->textures[image_id].w) / (float)(texture->w);
	scale[1] = (float)(scene_ptr->textures[image_id].h) / (float)(texture->h);

	return 1;

}

int readEnvCubemapPixf(const rayf_t *myRay, float *uv)
{
	if ((libc_fabsf(myRay->direction[0]) >= libc_fabsf(myRay->direction[1])) && (libc_fabsf(myRay->direction[0]) >= libc_fabsf(myRay->direction[2])))
	{
		if (myRay->direction[0] > 0.0f)
		{
			//currentColor = cm->texture + cubemap_right * cm->sizeX * cm->sizeY;
			uv[0] = 1.0f - (myRay->direction[2] / myRay->direction[0] + 1.0f) * 0.5f;
			uv[1] = (myRay->direction[1] / myRay->direction[0] + 1.0f) * 0.5f;
			return cubemap_right;
			// cm->sizeX, cm->sizeY
		}
		else if (myRay->direction[0] <= 0.0f)
		{
			//currentColor = cm->texture + cubemap_left * cm->sizeX * cm->sizeY;
			uv[0] = 1.0f - (myRay->direction[2] / myRay->direction[0] + 1.0f) * 0.5f;
			uv[1] = 1.0f - (myRay->direction[1] / myRay->direction[0] + 1.0f) * 0.5f;
			return cubemap_left;
			//cm->sizeX, cm->sizeY);
		}
	}
	else if ((libc_fabsf(myRay->direction[1]) >= libc_fabsf(myRay->direction[0])) && (libc_fabsf(myRay->direction[1]) >= libc_fabsf(myRay->direction[2])))
	{
		if (myRay->direction[1] > 0.0f)
		{
			//currentColor = cm->texture + cubemap_up * cm->sizeX * cm->sizeY;
			uv[0] = (myRay->direction[0] / myRay->direction[1] + 1.0f) * 0.5f;
			uv[1] = 1.0f - (myRay->direction[2] / myRay->direction[1] + 1.0f) * 0.5f;
			return cubemap_up;
		}
		else if (myRay->direction[1] <= 0.0f)
		{
			//currentColor = cm->texture + cubemap_down * cm->sizeX * cm->sizeY;
			uv[0] = 1.0f - (myRay->direction[0] / myRay->direction[1] + 1.0f) * 0.5f;
			uv[1] = (myRay->direction[2] / myRay->direction[1] + 1.0f) * 0.5f;
			return cubemap_down;
		}
	}
	else if ((libc_fabsf(myRay->direction[2]) >= libc_fabsf(myRay->direction[0])) && (libc_fabsf(myRay->direction[2]) >= libc_fabsf(myRay->direction[1])))
	{
		if (myRay->direction[2] > 0.0f)
		{
			//currentColor = cm->texture + cubemap_forward * cm->sizeX * cm->sizeY;
			uv[0] = (myRay->direction[0] / myRay->direction[2] + 1.0f) * 0.5f;
			uv[1] = (myRay->direction[1] / myRay->direction[2] + 1.0f) * 0.5f;
			return cubemap_forward;

		}
		else if (myRay->direction[2] <= 0.0f)
		{
			//currentColor = cm->texture + cubemap_backward * cm->sizeX * cm->sizeY;
			uv[0] = (myRay->direction[0] / myRay->direction[2] + 1.0f) * 0.5f;
			uv[1] = 1.0f - (myRay->direction[1] / myRay->direction[2] + 1) * 0.5f;
			return cubemap_backward;
		}
	}

	return -1;
}

int init_bboxf(mem_zone_ref_ptr object)
{
	float params[64];
	mem_zone_ref params_node = { PTR_NULL };

	float *min;
	float *max;

	if (!tree_manager_get_child_data_ptr(object, NODE_HASH_bmin, &min))return 0;
	if (!tree_manager_get_child_data_ptr(object, NODE_HASH_bmax, &max))return 0;
	
	//sign0 = 0,sign1 = 0,sign2 = 0
	params[0 + 0] =min[0];
	params[0 + 1] =min[1];
	params[0 + 2] =max[0];
	params[0 + 3] =max[1];

	params[4 + 0] =min[2];
	params[4 + 1] =max[2];
	params[4 + 2] =min[2];
	params[4 + 3] =max[2];

	//sign0 = 1,sign1 = 0,sign2 = 0
	params[8 + 0] =max[0];
	params[8 + 1] =min[1];
	params[8 + 2] =min[0];
	params[8 + 3] =max[1];

	params[12 + 0] =min[2];
	params[12 + 1] =max[2];
	params[12 + 2] =min[2];
	params[12 + 3] =max[2];

	//sign0 = 0,sign1 = 1,sign2 = 0
	params[16 + 0] =min[0];
	params[16 + 1] =max[1];
	params[16 + 2] =max[0];
	params[16 + 3] =min[1];

	params[20 + 0] =min[2];
	params[20 + 1] =max[2];
	params[20 + 2] =min[2];
	params[20 + 3] =max[2];

	//sign0 = 1,sign1 = 1,sign2 = 0
	params[24 + 0] =max[0];
	params[24 + 1] =max[1];
	params[24 + 2] =min[0];
	params[24 + 3] =min[1];

	params[28 + 0] =min[2];
	params[28 + 1] =max[2];
	params[28 + 2] =min[2];
	params[28 + 3] =max[2];


	//sign0 = 0,sign1 = 0,sign2 = 1
	params[32 + 0] =min[0];
	params[32 + 1] =min[1];
	params[32 + 2] =max[0];
	params[32 + 3] =max[1];

	params[36 + 0] =max[2];
	params[36 + 1] =min[2];
	params[36 + 2] =max[2];
	params[36 + 3] =min[2];


	//sign0 = 1,sign1 = 0,sign2 = 1
	params[40 + 0] =max[0];
	params[40 + 1] =min[1];
	params[40 + 2] =min[0];
	params[40 + 3] =max[1];

	params[44 + 0] =max[2];
	params[44 + 1] =min[2];
	params[44 + 2] =max[2];
	params[44 + 3] =min[2];

	//sign0 = 0,sign1 = 1,sign2 = 1
	params[48 + 0] =min[0];
	params[48 + 1] =max[1];
	params[48 + 2] =max[0];
	params[48 + 3] =min[1];

	params[52 + 0] =max[2];
	params[52 + 1] =min[2];
	params[52 + 2] =max[2];
	params[52 + 3] =min[2];

	//sign0 = 1,sign1 = 1,sign2 = 1
	params[56 + 0] =max[0];
	params[56 + 1] =max[1];
	params[56 + 2] =min[0];
	params[56 + 3] =min[1];

	params[60 + 0] =max[2];
	params[60 + 1] =min[2];
	params[60 + 2] =max[2];
	params[60 + 3] =min[2];

	if (!tree_manager_find_child_node(object, NODE_HASH("bdata"), NODE_RT_BBOX, &params_node))
		tree_manager_add_child_node(object, "bdata", NODE_RT_BBOX, &params_node);
	
	tree_manager_write_node_data(&params_node, params, 0, 64 * sizeof(float));
	release_zone_ref(&params_node);
	
	return 1;
}

unsigned int get_new_idvar(mem_zone_ref_ptr scene)
{
	unsigned int id_var;

	tree_manager_get_child_value_i32(scene, NODE_HASH("id_var"), &id_var);
	tree_manager_set_child_value_i32(scene, "id_var", id_var+1);
	return id_var;
}

OS_API_C_FUNC(int) newMaterial(mem_zone_ref_ptr scene,vec_4uc_t color, float reflect, float refract, float refract_density, unsigned int tex_id, unsigned int n_id)
{
	mem_zone_ref material = { PTR_NULL }, matList = { PTR_NULL };
	unsigned int cur_id;

	if(!tree_manager_find_child_node(scene, NODE_HASH("material_list"), NODE_RT_MATERIAL_LIST, &matList))
		tree_manager_add_child_node(scene, "material_list", NODE_RT_MATERIAL_LIST, &matList);
	

	if (tree_manager_add_child_node(&matList, "material", NODE_RT_MATERIAL, &material))
	{
		cur_id = get_new_idvar(scene);

		tree_manager_set_child_value_i32(&material, "id", cur_id);
		tree_manager_set_child_value_4uc(&material, "color", color);
		tree_manager_set_child_value_float(&material, "reflect", reflect);
		tree_manager_set_child_value_float(&material, "refract", refract);
		tree_manager_set_child_value_float(&material, "refract_density", refract_density);

		if (tex_id > 0)
			tree_manager_set_child_value_i32(&material, "texture_id", tex_id);

		if (n_id > 0)
			tree_manager_set_child_value_i32(&material, "normalmap_id", n_id);

		release_zone_ref(&material);
		return cur_id;
	}
	release_zone_ref(&matList);

	return -1;
}


OS_API_C_FUNC(void) setMaterial(mem_zone_ref_ptr scene, unsigned int obj_id, unsigned int mat_id)
{
	mem_zone_ref object = { PTR_NULL };

	if (!tree_node_find_child_by_id(scene, obj_id, &object))return;
	tree_manager_set_child_value_i32(&object, "material_id", mat_id);
	release_zone_ref(&object);
}

void getMaterial(mem_zone_ref_ptr material, materialf_t *mat)
{
	tree_manager_get_child_value_4uc(material, NODE_HASH("color"), mat->color);
	
	if (!tree_manager_get_child_value_float(material, NODE_HASH("reflect"), &mat->reflect))
		mat->reflect = 0;

	if (!tree_manager_get_child_value_float(material, NODE_HASH("refract"), &mat->refract))
		mat->refract = 0;

	if (!tree_manager_get_child_value_float(material, NODE_HASH("refract_density"), &mat->refract_density))
		mat->refract_density = 0;

	if (!tree_manager_get_child_value_i32(material, NODE_HASH("texture_id"), &mat->tid))
		mat->tid = 0;

	if (!tree_manager_get_child_value_i32(material, NODE_HASH("normalmap_id"), &mat->nid))
		mat->nid = 0;
	
}

void setAngles(mem_zone_ref_ptr object, float x, float y, float z)
{
	DECLARE_ALIGNED_MAT3(tmpMat);
	double hpb[4];
	double axis[4];
	double angle;
	float *matrix, *nmatrix;
	
	hpb[0] = x;
	hpb[1] = y;
	hpb[2] = z;

	angle=GetAngleAxis	(hpb, axis, 0);
	
	tree_manager_get_child_data_ptr		(object, NODE_HASH_mat, &matrix);
	tree_manager_get_child_data_ptr		(object, NODE_HASH_nmat, &nmatrix);
	create_rotation_mat					(matrix, angle, axis[0], axis[1], axis[2]);

	inverse_mat3x3_c					(matrix,tmpMat);
	transpose_mat3x3					(tmpMat,nmatrix);
}


void compute_sphere(mem_zone_ref_ptr sphere)
{
	float *center;
	float radius;

	tree_manager_get_child_data_ptr(sphere, NODE_HASH_center, &center);
	tree_manager_get_child_value_float(sphere, NODE_HASH_radius, &radius);
	tree_manager_set_child_value_float(sphere, "sq_radius", radius*radius);
	tree_manager_set_child_value_vec3(sphere, "bmin", center[0] - radius, center[1] - radius, center[2] - radius);
	tree_manager_set_child_value_vec3(sphere, "bmax", center[0] + radius, center[1] + radius, center[2] + radius);
	init_bboxf(sphere);

}
void compute_plan(mem_zone_ref_ptr plan)
{
	DECLARE_ALIGNED_VEC3(plane);
	mem_zone_ref	planes_node = { PTR_NULL };
	float			*center, *norm;

	tree_manager_get_child_data_ptr	(plan, NODE_HASH_center , &center);
	tree_manager_get_child_data_ptr	(plan, NODE_HASH_norm	, &norm);
	copy_vec3						(plane, norm);
	plane[3]	=	-dot_vec3		(plane, center);


	if (!tree_manager_find_child_node(plan, NODE_HASH_plane, NODE_RT_VEC3, &planes_node))
		tree_manager_add_child_node(plan, "plane", NODE_RT_VEC3, &planes_node);

	tree_manager_write_node_data(&planes_node, plane, 0, sizeof(vec3f_t));
	release_zone_ref			(&planes_node);
}

void compute_cube(mem_zone_ref_ptr cube)
{
	DECLARE_ALIGNED_VEC3_ARRAY(Point, 8);
	DECLARE_ALIGNED_VEC3_ARRAY(c_Point, 8);
	DECLARE_ALIGNED_VEC3(minv);
	DECLARE_ALIGNED_VEC3(maxv);
	mem_zone_ref planes_node = { PTR_NULL };
	float *size, *center, *matrix;
	int			box_ids[24];
	int			n;


	tree_manager_get_child_data_ptr(cube, NODE_HASH_size, &size);
	tree_manager_get_child_data_ptr(cube, NODE_HASH_center, &center);
	tree_manager_get_child_data_ptr(cube, NODE_HASH_mat, &matrix);


	set_vec4i(&box_ids[0 * 4], 0, 1, 2, 3);
	set_vec4i(&box_ids[1 * 4], 1, 5, 6, 2);
	set_vec4i(&box_ids[2 * 4], 5, 4, 7, 6);
	set_vec4i(&box_ids[3 * 4], 4, 0, 3, 7);
	set_vec4i(&box_ids[4 * 4], 3, 2, 6, 7);
	set_vec4i(&box_ids[5 * 4], 1, 0, 4, 5);


	Point[0][0] = -size[0];
	Point[0][1] = -size[1];
	Point[0][2] = size[2];

	Point[1][0] = size[0];
	Point[1][1] = -size[1];
	Point[1][2] = size[2];

	Point[2][0] = size[0];
	Point[2][1] = size[1];
	Point[2][2] = size[2];

	Point[3][0] = -size[0];
	Point[3][1] = size[1];
	Point[3][2] = size[2];

	Point[4][0] = -size[0];
	Point[4][1] = -size[1];
	Point[4][2] = -size[2];

	Point[5][0] = size[0];
	Point[5][1] = -size[1];
	Point[5][2] = -size[2];

	Point[6][0] = size[0];
	Point[6][1] = size[1];
	Point[6][2] = -size[2];

	Point[7][0] = -size[0];
	Point[7][1] = size[1];
	Point[7][2] = -size[2];


	minv[0] = 10000;
	minv[1] = 10000;
	minv[2] = 10000;

	maxv[0] = -10000;
	maxv[1] = -10000;
	maxv[2] = -10000;

	n = 0;
	while (n<8)
	{
		mul_vec3x3_o(Point[n], matrix, c_Point[n]);

		c_Point[n][0] += center[0];
		c_Point[n][1] += center[1];
		c_Point[n][2] += center[2];

		if (c_Point[n][0]<minv[0])
			minv[0] = c_Point[n][0];

		if (c_Point[n][0]>maxv[0])
			maxv[0] = c_Point[n][0];

		if (c_Point[n][1]<minv[1])
			minv[1] = c_Point[n][1];

		if (c_Point[n][1]>maxv[1])
			maxv[1] = c_Point[n][1];

		if (c_Point[n][2]<minv[2])
			minv[2] = c_Point[n][2];

		if (c_Point[n][2]>maxv[2])
			maxv[2] = c_Point[n][2];
		n++;
	}

	tree_manager_set_child_value_vec3(cube, "bmin", minv[0], minv[1], minv[2]);
	tree_manager_set_child_value_vec3(cube, "bmax", maxv[0], maxv[1], maxv[2]);
	init_bboxf						 (cube);

	tree_manager_set_child_value_vec3(cube, "cubeMin", -size[0], -size[1], -size[2]);
	tree_manager_set_child_value_vec3(cube, "cubeMax", +size[0], +size[1], +size[2]);

	if (!tree_manager_find_child_node(cube, NODE_HASH_planes, NODE_RT_VEC3, &planes_node))
		tree_manager_add_child_node(cube, "planes", NODE_RT_VEC3, &planes_node);

	n = 0;
	while (n<6)
	{
		DECLARE_ALIGNED_VEC3(d1);
		DECLARE_ALIGNED_VEC3(d2);
		DECLARE_ALIGNED_VEC3(plane);

		sub_vec3(c_Point[box_ids[n * 4 + 1]], c_Point[box_ids[n * 4 + 0]], d1);
		sub_vec3(c_Point[box_ids[n * 4 + 2]], c_Point[box_ids[n * 4 + 0]], d2);
		cross_vec3(d1, d2, plane);
		normalize_vec3(plane);
		plane[3] = -dot_vec3(plane, c_Point[box_ids[n * 4 + 0]]);

		tree_manager_write_node_data(&planes_node, plane, n * sizeof(vec3f_t), sizeof(vec3f_t));
		n++;
	}
	release_zone_ref(&planes_node);
	
}

void compute_cyl(mem_zone_ref_ptr cyl)
{
	DECLARE_ALIGNED_VEC3(minf);
	DECLARE_ALIGNED_VEC3(maxf);
	DECLARE_ALIGNED_VEC3(dvec);
	DECLARE_ALIGNED_VEC3(pt1);
	DECLARE_ALIGNED_VEC3(pt2);
	DECLARE_ALIGNED_VEC3(k);
	float *center, *matrix;
	float half_height,radius;
	tree_manager_get_child_data_ptr		(cyl, NODE_HASH_center, &center);
	tree_manager_get_child_data_ptr		(cyl, NODE_HASH_mat, &matrix);
	tree_manager_get_child_value_float	(cyl, NODE_HASH("half_height"), &half_height);
	tree_manager_get_child_value_float	(cyl, NODE_HASH_radius, &radius);

	set_vec3(pt1, 0, -half_height, 0);
	set_vec3(pt2, 0, half_height, 0);

	mul_vec3x3(pt1, matrix);
	mul_vec3x3(pt2, matrix);

	sub_vec3(pt2, pt1, dvec);

	dvec[0] = dvec[0] * dvec[0];
	dvec[1] = dvec[1] * dvec[1];
	dvec[2] = dvec[2] * dvec[2];

	k[0] = libc_sqrtf((dvec[1] + dvec[2]) / (dvec[0] + dvec[1] + dvec[2]));
	k[1] = libc_sqrtf((dvec[0] + dvec[2]) / (dvec[0] + dvec[1] + dvec[2]));
	k[2] = libc_sqrtf((dvec[0] + dvec[1]) / (dvec[0] + dvec[1] + dvec[2]));

	scale_vec3(k, radius);

	minf[0] = min(pt1[0], pt2[0]);
	minf[1] = min(pt1[1], pt2[1]);
	minf[2] = min(pt1[2], pt2[2]);

	maxf[0] = max(pt1[0], pt2[0]);
	maxf[1] = max(pt1[1], pt2[1]);
	maxf[2] = max(pt1[2], pt2[2]);

	sub_vec3(minf, k, minf);
	add_vec3(maxf, k, maxf);

	add_vec3(maxf, center, maxf);
	add_vec3(minf, center, minf);

	tree_manager_set_child_value_vec3(cyl, "bmin", minf[0], minf[1], minf[2]);
	tree_manager_set_child_value_vec3(cyl, "bmax", maxf[0], maxf[1], maxf[2]);
	init_bboxf(cyl);
}


OS_API_C_FUNC(int) newSpheref(mem_zone_ref_ptr scene,float centerX, float centerY, float centerZ, float radius)
{
	mat3x3f_t			Mat, normMat;
	mem_zone_ref		spherenode = { PTR_NULL };
	unsigned int		new_id;

	identity_mat3x3_c(Mat);
	identity_mat3x3_c(normMat);
	new_id = get_new_idvar(scene);
	tree_manager_add_child_node			(scene, "sphere", NODE_RT_SPHERE, &spherenode);
	tree_manager_set_child_value_i32	(&spherenode, "id", new_id);
	tree_manager_set_child_value_vec3	(&spherenode, "center", centerX, centerY, centerZ);
	tree_manager_set_child_value_float	(&spherenode, "radius", radius);
	tree_manager_set_child_value_float  (&spherenode, "sq_radius", radius*radius);
	tree_manager_set_child_value_mat3x3	(&spherenode, "mat", Mat);
	tree_manager_set_child_value_mat3x3	(&spherenode, "nmat", normMat);
	tree_manager_set_child_value_mat3x3 (&spherenode, "imat", Mat);
	tree_manager_set_child_value_mat3x3 (&spherenode, "inmat", normMat);
	compute_sphere						(&spherenode);
	release_zone_ref					(&spherenode);


	return new_id;
}

OS_API_C_FUNC(int) newCylinderf(mem_zone_ref_ptr scene, float centerX, float centerY, float centerZ, float half_height, float radius)
{
	mat3x3f_t			Mat, normMat;
	mem_zone_ref		cylnode = { PTR_NULL };
	unsigned int		new_id;

	identity_mat3x3_c(Mat);
	identity_mat3x3_c(normMat);
	new_id = get_new_idvar(scene);
	tree_manager_add_child_node(scene, "cylinder", NODE_RT_CYLINDER, &cylnode);
	tree_manager_set_child_value_i32(&cylnode, "id", new_id);
	tree_manager_set_child_value_vec3(&cylnode, "center", centerX, centerY, centerZ);
	tree_manager_set_child_value_float(&cylnode, "radius", radius);
	tree_manager_set_child_value_float(&cylnode, "half_height", half_height);
	tree_manager_set_child_value_mat3x3(&cylnode, "mat", Mat);
	tree_manager_set_child_value_mat3x3(&cylnode, "nmat", normMat);
	tree_manager_set_child_value_mat3x3(&cylnode, "imat", Mat);
	tree_manager_set_child_value_mat3x3(&cylnode, "inmat", normMat);
	compute_cyl(&cylnode);
	release_zone_ref(&cylnode);
	return new_id;
}
OS_API_C_FUNC(int) newCubef(mem_zone_ref_ptr scene, float centerX, float centerY, float centerZ, float sizeX, float sizeY, float sizeZ)
{
	DECLARE_ALIGNED_MAT3		(Mat);
	DECLARE_ALIGNED_MAT3		(normMat);
	mem_zone_ref				newCube = { PTR_NULL };
	unsigned int				new_id;


	new_id = get_new_idvar(scene);
	

	tree_manager_add_child_node			(scene, "cube", NODE_RT_CUBE, &newCube);
	tree_manager_set_child_value_i32	(&newCube, "id",new_id );
	tree_manager_set_child_value_vec3	(&newCube, "center", centerX, centerY, centerZ);
	tree_manager_set_child_value_vec3	(&newCube, "size", sizeX, sizeY, sizeZ);

	identity_mat3x3_c					(Mat);
	identity_mat3x3_c					(normMat);
	tree_manager_set_child_value_mat3x3	(&newCube, "mat", Mat);
	tree_manager_set_child_value_mat3x3	(&newCube, "nmat", normMat);
	tree_manager_set_child_value_mat3x3(&newCube, "imat", Mat);
	tree_manager_set_child_value_mat3x3(&newCube, "inmat", normMat);
	compute_cube	(&newCube);
	release_zone_ref(&newCube);

	return new_id;
}


OS_API_C_FUNC(int) newPlanf(mem_zone_ref_ptr scene, float posX, float posY, float posZ, float normX, float normY, float normZ)
{
	mem_zone_ref				newPlan = { PTR_NULL };
	unsigned int				new_id;

	new_id = get_new_idvar(scene);

	tree_manager_add_child_node			(scene, "plan", NODE_RT_PLANE, &newPlan);
	tree_manager_set_child_value_i32	(&newPlan, "id", new_id);
	tree_manager_set_child_value_vec3	(&newPlan, "center"	, posX , posY , posZ);
	tree_manager_set_child_value_vec3	(&newPlan, "norm"	, normX, normY, normZ);
	compute_plan						(&newPlan);
	release_zone_ref					(&newPlan);


	

	return new_id;
}
OS_API_C_FUNC(void) setLightPosf(mem_zone_ref_ptr scene, float x, float y, float z)
{
	tree_manager_set_child_value_vec3(scene, "lightPos", x, y, z);
}

OS_API_C_FUNC(void) setCameraf(mem_zone_ref_ptr scene, vec3f_t pos, mat3x3f_t mat, mat3x3f_t nmat)
{
	tree_manager_set_child_value_vec3	(scene, "camPos", pos[0], pos[1], pos[2] );
	tree_manager_set_child_value_mat3x3	(scene, "camMat", mat);
	tree_manager_set_child_value_mat3x3	(scene, "camNMat", nmat);

}

OS_API_C_FUNC(void) set_cube_angles(mem_zone_ref_ptr scene, unsigned int obj_id, double x, double y, double z)
{
	mem_zone_ref object = { PTR_NULL };
	if (!tree_node_find_child_by_id(scene, obj_id, &object))return;
	
	setAngles(&object, x, y, z);
	
	
	compute_cube(&object);
	release_zone_ref(&object);
}

OS_API_C_FUNC(void) set_cube_anglesf(mem_zone_ref_ptr scene, unsigned int obj_id, float x, float y, float z)
{
	mem_zone_ref object = { PTR_NULL };
	if (!tree_node_find_child_by_id(scene, obj_id, &object))return;

	setAngles		(&object, x, y, z);
	compute_cube	(&object);
	release_zone_ref(&object);
}

OS_API_C_FUNC(void) set_cyl_anglesf(mem_zone_ref_ptr scene, unsigned int obj_id, float x, float y, float z)
{
	mem_zone_ref object = { PTR_NULL };
	if (!tree_node_find_child_by_id(scene, obj_id, &object))return;

	setAngles		(&object, x, y, z);
	compute_cyl		(&object);
	release_zone_ref(&object);
}

OS_API_C_FUNC(void) set_sphere_anglesf(mem_zone_ref_ptr scene, unsigned int obj_id, float x, float y, float z)
{
	mem_zone_ref object = { PTR_NULL };
	if (!tree_node_find_child_by_id(scene, obj_id, &object))return;

	setAngles		(&object, x, y, z);
	compute_sphere	(&object);
	release_zone_ref(&object);
}
int get_bbox(mem_zone_ref_ptr object, box_testf_t *box)
{
	tree_manager_get_child_value_i32(object, NODE_HASH_id, &box->id);
	tree_manager_get_child_data_ptr(object, NODE_HASH("bdata"), &box->_parameters);
	return 1;
}
int get_sphere(mem_zone_ref_ptr object, spheref_t *sp)
{
	tree_manager_get_child_value_i32(object, NODE_HASH_id, &sp->AABOX.cast_id);
	tree_manager_get_child_data_ptr(object, NODE_HASH_mat, &sp->matrix);
	tree_manager_get_child_data_ptr(object, NODE_HASH_nmat, &sp->norm_mat);
	tree_manager_get_child_data_ptr(object, NODE_HASH_imat, &sp->inv_matrix);
	tree_manager_get_child_data_ptr(object, NODE_HASH_inmat, &sp->inv_norm_mat);
	tree_manager_get_child_data_ptr(object, NODE_HASH_center, &sp->center);
	tree_manager_get_child_value_float(object, NODE_HASH_radius, &sp->radius);
	tree_manager_get_child_value_float(object, NODE_HASH_sqradius, &sp->sq_radius);
	

	return 1;
}
int get_cube(mem_zone_ref_ptr object, cubef_t *cube)
{
	tree_manager_get_child_value_i32(object, NODE_HASH_id, &cube->AABOX.cast_id);
	tree_manager_get_child_data_ptr(object, NODE_HASH_mat, &cube->matrix);
	tree_manager_get_child_data_ptr(object, NODE_HASH_nmat, &cube->norm_mat);
	tree_manager_get_child_data_ptr(object, NODE_HASH_imat, &cube->inv_matrix);
	tree_manager_get_child_data_ptr(object, NODE_HASH_inmat, &cube->inv_norm_mat);
	tree_manager_get_child_data_ptr(object, NODE_HASH_center, &cube->center);
	tree_manager_get_child_data_ptr(object, NODE_HASH_size, &cube->size);
	tree_manager_get_child_data_ptr(object, NODE_HASH("cubeMin"), &cube->cubeMin);
	tree_manager_get_child_data_ptr(object, NODE_HASH("cubeMax"), &cube->cubeMax);
	tree_manager_get_child_data_ptr(object, NODE_HASH_planes, &cube->planes);
	

	return 1;
}
int get_plane(mem_zone_ref_ptr object, planef_t *plane)
{
	tree_manager_get_child_value_i32(object, NODE_HASH_id, &plane->cast_id);
	tree_manager_get_child_data_ptr(object, NODE_HASH_center, &plane->center);
	tree_manager_get_child_data_ptr(object, NODE_HASH_norm, &plane->norm);

	
	

	return 1;
}

int get_cylinder(mem_zone_ref_ptr object, cylf_t *cyl)
{
	tree_manager_get_child_value_i32(object, NODE_HASH_id, &cyl->AABOX.cast_id);
	tree_manager_get_child_data_ptr(object, NODE_HASH_mat, &cyl->matrix);
	tree_manager_get_child_data_ptr(object, NODE_HASH_nmat, &cyl->norm_mat);
	tree_manager_get_child_data_ptr(object, NODE_HASH_imat, &cyl->inv_matrix);
	tree_manager_get_child_data_ptr(object, NODE_HASH_inmat, &cyl->inv_norm_mat);
	tree_manager_get_child_data_ptr(object, NODE_HASH_center, &cyl->center);
	tree_manager_get_child_value_float(object, NODE_HASH_radius, &cyl->radius);
	tree_manager_get_child_value_float(object, NODE_HASH("half_height"), &cyl->half_height);
	cyl->radiussq = cyl->radius*cyl->radius;
	

	return 1;
}

 OS_API_C_FUNC(int) getGeomData(scene_t *scene_ptr,float *boxData, size_t *boxDataLen)
{
	mem_zone_ref		objs = { PTR_NULL };
	size_t				dataStart;
	unsigned int		n;
	
	dataStart = 0;

	tree_manager_find_child_node(scene_ptr->scene_ptr, NODE_HASH("objects"), NODE_JSON_ARRAY, &objs);

	n = 0;
	while (n<scene_ptr->n_materials)
	{
		mem_zone_ref node = { PTR_NULL };
		vec2f_t	pos, scale;

		boxData[dataStart + 0] = scene_ptr->materials[n].tid;
		boxData[dataStart + 1] = scene_ptr->materials[n].nid;


		boxData[dataStart + 3] = scene_ptr->materials[n].color[0] / 255.0f;
		boxData[dataStart + 4] = scene_ptr->materials[n].color[1] / 255.0f;
		boxData[dataStart + 5] = scene_ptr->materials[n].color[2] / 255.0f;

		boxData[dataStart + 6] = scene_ptr->materials[n].reflect;
		boxData[dataStart + 7] = scene_ptr->materials[n].refract;
		boxData[dataStart + 8] = scene_ptr->materials[n].refract_density;
		
		dataStart	+= 9;

		if (scene_ptr->materials[n].tid>0)
		{

			get_image_uv(scene_ptr,&scene_ptr->render_texture1, scene_ptr->materials[n].tid, pos, scale);
		}
		else
		{
			pos[0] = 0.0f;
			pos[1] = 0.0f;
			scale[0] = 0.0f;
			scale[1] = 0.0f;
		}

		boxData[dataStart + 0] = pos[0];
		boxData[dataStart + 1] = pos[1];

		boxData[dataStart + 3] = scale[0];
		boxData[dataStart + 4] = scale[1];
		
		dataStart += 6;

		if (scene_ptr->materials[n].nid>0)
		{
			get_image_uv(scene_ptr, &scene_ptr->render_texture2, scene_ptr->materials[n].nid, pos, scale);
		}
		else
		{
			pos[0] = 0.0f;
			pos[1] = 0.0f;
			scale[0] = 0.0f;
			scale[1] = 0.0f;
		}

		boxData[dataStart + 0] = pos[0];
		boxData[dataStart + 1] = pos[1];

		boxData[dataStart + 3] = scale[0];
		boxData[dataStart + 4] = scale[1];

		dataStart += 6;

		n++;
	}
	n = 0;
	while (n<scene_ptr->n_boxf)
	{
		mem_zone_ref node = { PTR_NULL };
		unsigned int item_type, idx;

		if (tree_node_find_child_by_id(&objs, scene_ptr->box_testf[n].id, &node))
		{
			switch (tree_mamanger_get_node_type(&node))
			{
				case NODE_RT_SPHERE:item_type = 1; break;
				case NODE_RT_CUBE:item_type = 2; break;
				case NODE_RT_CYLINDER:item_type = 3; break;
				case NODE_RT_PLANE:item_type = 4; break;
				default:item_type = 0; break;
			}
			tree_manager_get_child_value_i32(&node, NODE_HASH("idx"), &idx);
			release_zone_ref(&node);

			boxData[dataStart + 0] = scene_ptr->box_testf[n]._parameters[0];
			boxData[dataStart + 1] = scene_ptr->box_testf[n]._parameters[1];
			boxData[dataStart + 2] = scene_ptr->box_testf[n]._parameters[4];

			boxData[dataStart + 3] = scene_ptr->box_testf[n]._parameters[2];
			boxData[dataStart + 4] = scene_ptr->box_testf[n]._parameters[3];
			boxData[dataStart + 5] = scene_ptr->box_testf[n]._parameters[5];

			dataStart += 6;

			boxData[dataStart + 0] = item_type;
			boxData[dataStart + 1] = idx;

			dataStart += 3;
		}

		n++;
	}

	n = 0;
	while (n<scene_ptr->n_cubes)
	{
		cubef_t	*cube;

		cube = &scene_ptr->cubes[n];

		boxData[dataStart + 0] = cube->center[0];
		boxData[dataStart + 1] = cube->center[1];
		boxData[dataStart + 2] = cube->center[2];

		boxData[dataStart + 3] = cube->size[0];
		boxData[dataStart + 4] = cube->size[1];
		boxData[dataStart + 5] = cube->size[2];

		dataStart += 6;

		boxData[dataStart + 0] = cube->AABOX.cast_id;
		boxData[dataStart + 1] = cube->mat_idx;
		boxData[dataStart + 2] = 0;

		dataStart += 3;

		toOpenGL3x3(cube->matrix, &boxData[dataStart + 0]);
		dataStart += 9;

		n++;
	}

	n = 0;
	while (n<scene_ptr->n_spheres)
	{
		spheref_t	*sphere;

		sphere = &scene_ptr->spheres[n];

		boxData[dataStart + 0] = sphere->center[0];
		boxData[dataStart + 1] = sphere->center[1];
		boxData[dataStart + 2] = sphere->center[2];
		dataStart += 3;

		boxData[dataStart + 0] = sphere->sq_radius;
		dataStart += 3;

		boxData[dataStart + 0] = sphere->AABOX.cast_id;
		boxData[dataStart + 1] = sphere->mat_idx;
		boxData[dataStart + 2] = 0;

		dataStart += 3;

		toOpenGL3x3(sphere->inv_matrix, &boxData[dataStart]);
		dataStart += 9;

		toOpenGL3x3(sphere->matrix, &boxData[dataStart]);
		dataStart += 9;
		n++;
	}

	n = 0;
	while (n<scene_ptr->n_cyls)
	{
		cylf_t	*cyl;

		cyl = &scene_ptr->cyls[n];

		boxData[dataStart + 0] = cyl->center[0];
		boxData[dataStart + 1] = cyl->center[1];
		boxData[dataStart + 2] = cyl->center[2];

		dataStart += 3;

		boxData[dataStart + 0] = cyl->radiussq;
		boxData[dataStart + 1] = cyl->half_height;
		boxData[dataStart + 2] = cyl->radius;
		dataStart += 3;

		boxData[dataStart + 0] = cyl->AABOX.cast_id;
		boxData[dataStart + 1] = cyl->mat_idx;
		boxData[dataStart + 2] = 0;
		dataStart += 3;

		toOpenGL3x3(cyl->inv_matrix, &boxData[dataStart + 0]);
		dataStart += 9;

		toOpenGL3x3(cyl->inv_norm_mat, &boxData[dataStart + 0]);
		dataStart += 9;

		toOpenGL3x3(cyl->norm_mat, &boxData[dataStart + 0]);
		dataStart += 9;

		n++;
	}

	n = 0;
	while (n<scene_ptr->n_planes)
	{
		planef_t	*plane;

		plane = &scene_ptr->planes[n];

		boxData[dataStart + 0] = plane->center[0];
		boxData[dataStart + 1] = plane->center[1];
		boxData[dataStart + 2] = plane->center[2];

		dataStart += 3;

		boxData[dataStart + 0] = plane->norm[0];
		boxData[dataStart + 1] = plane->norm[1];
		boxData[dataStart + 2] = plane->norm[2];

		dataStart += 3;

		boxData[dataStart + 0] = plane->cast_id;
		boxData[dataStart + 1] = plane->mat_idx;
		boxData[dataStart + 2] = 0;
		dataStart += 3;
		n++;
	}

	release_zone_ref(&objs);

	/*
	n = 0;
	while (n<HalofList->num_item)
	{
	spheref_t	*sphere;

	sphere = HalofList->getItemAt(n);

	boxData[dataStart + 0] = sphere->center[0];
	boxData[dataStart + 1] = sphere->center[1];
	boxData[dataStart + 2] = sphere->center[2];
	dataStart += 3;

	boxData[dataStart + 0] = sphere->sq_radius;
	dataStart += 3;
	dataStart += 6;//skip material
	toOpenGL3x3(sphere->inv_matrix, &boxData[dataStart]);
	dataStart += 9;


	n++;
	}
	*/

	(*boxDataLen) = dataStart;
	return (*boxDataLen);
}

OS_API_C_FUNC(int) get_scene_texData(hash_t id,float *scene_data, size_t *data_len)
{
	scene_t *scene_ptr;

	scene_ptr = get_scene_ptr(id);
	if (scene_ptr == PTR_NULL)return 0;
	
	getGeomData(scene_ptr,scene_data, data_len);
	/*
	(*data_len) = boxDataLen;
	(*scene_data) = boxData;
	*/
	return (*data_len);
}


OS_API_C_FUNC(void) compute_scene(scene_t *scene_ptr)
{
	DECLARE_ALIGNED_MAT3(camIMat);
	DECLARE_ALIGNED_MAT3(camINMat);

	mem_zone_ref		 my_list = { PTR_NULL }, matList = { PTR_NULL }, shader_vars = { PTR_NULL }, objs = { PTR_NULL };
	mem_zone_ref_ptr	object = PTR_NULL, material = PTR_NULL;
	
	float				*lightPos = PTR_INVALID;
	float				*camPos = PTR_INVALID;
	float				*camMat = PTR_INVALID;
	float				*camNMat = PTR_INVALID;
	
	scene_ptr->n_spheres = 0;
	scene_ptr->n_boxf = 0;
	scene_ptr->n_planes = 0;
	scene_ptr->n_cubes = 0;
	scene_ptr->n_cyls = 0;

	tree_manager_get_child_data_ptr(scene_ptr->scene_ptr, NODE_HASH("camPos"), &camPos);
	tree_manager_get_child_data_ptr(scene_ptr->scene_ptr, NODE_HASH("camMat"), &camMat);
	tree_manager_get_child_data_ptr(scene_ptr->scene_ptr, NODE_HASH("camNMat"), &camNMat);
	tree_manager_get_child_data_ptr(scene_ptr->scene_ptr, NODE_HASH("lightPos"), &lightPos);

	


	inverse_mat3x3_c(camMat, camIMat);
	copy_mat3x3		(camNMat, camMat);
	inverse_mat3x3_c(camNMat, camINMat);
	//copy_mat3x3(camINMat, camNMat);
	
	tree_manager_find_child_node(scene_ptr->scene_ptr, NODE_HASH("material_list"), NODE_RT_MATERIAL_LIST, &matList);
	tree_manager_find_child_node(scene_ptr->scene_ptr, NODE_HASH("objects"), NODE_JSON_ARRAY, &objs);

	scene_ptr->n_materials = 0;
	for (tree_manager_get_first_child(&matList, &my_list, &material); ((material != NULL) && (material->zone != NULL)); tree_manager_get_next_child(&my_list, &material))
	{
		mem_zone_ref obj = { PTR_NULL };
		unsigned int mat_id;
		tree_manager_set_child_value_i32(material, "idx", scene_ptr->n_materials);
		tree_manager_get_child_value_i32	(material, NODE_HASH("id"), &mat_id);
		getMaterial							(material, &scene_ptr->materials[scene_ptr->n_materials]);

		if (tree_find_child_node_by_id_name(&objs, NODE_RT_PLANE, "material_id", mat_id, &obj))
		{
			tree_manager_set_child_value_i32(&obj, "material_idx", scene_ptr->n_materials);
			release_zone_ref(&obj);
		}
		if (tree_find_child_node_by_id_name(&objs, NODE_RT_CUBE, "material_id", mat_id, &obj))
		{
			tree_manager_set_child_value_i32(&obj, "material_idx", scene_ptr->n_materials);
			release_zone_ref(&obj);
		}
		if (tree_find_child_node_by_id_name(&objs, NODE_RT_CYLINDER, "material_id", mat_id, &obj))
		{
			tree_manager_set_child_value_i32(&obj, "material_idx", scene_ptr->n_materials);
			release_zone_ref(&obj);
		}

		if (tree_find_child_node_by_id_name(&objs, NODE_RT_SPHERE, "material_id", mat_id, &obj))
		{
			tree_manager_set_child_value_i32(&obj, "material_idx", scene_ptr->n_materials);
			release_zone_ref(&obj);
		}
		scene_ptr->n_materials++;
	}

	
	
	for (tree_manager_get_first_child(&objs, &my_list, &object); ((object != NULL) && (object->zone != NULL)); tree_manager_get_next_child(&my_list, &object))
	{
		mem_zone_ref objMat = { PTR_NULL };
		unsigned int Matidx=0xFFFF;
		

		if (tree_mamanger_get_node_type(object) == NODE_RT_SPHERE)
		{
			spheref_t *sp = &scene_ptr->spheres[scene_ptr->n_spheres];
			get_sphere		(object, sp);
			get_bbox(object, &scene_ptr->box_testf[scene_ptr->n_boxf]);
			tree_manager_set_child_value_i32(object, "idx", scene_ptr->n_spheres);

			tree_manager_get_child_value_i32(object, NODE_HASH("material_idx"), &sp->mat_idx);

			scene_ptr->n_boxf++;
			scene_ptr->n_spheres++;

			inverse_mat3x3_c(sp->matrix, sp->inv_matrix);
			inverse_mat3x3_c(sp->norm_mat, sp->inv_norm_mat);
			
		}
		else if (tree_mamanger_get_node_type(object) == NODE_RT_CUBE)
		{
			cubef_t *cube = &scene_ptr->cubes[scene_ptr->n_cubes];

			get_cube		(object, cube);
			get_bbox(object, &scene_ptr->box_testf[scene_ptr->n_boxf]);
			tree_manager_set_child_value_i32(object, "idx", scene_ptr->n_cubes);
			tree_manager_get_child_value_i32(object, NODE_HASH("material_idx"), &cube->mat_idx);
			scene_ptr->n_boxf++;
			scene_ptr->n_cubes++;
			inverse_mat3x3_c(cube->matrix	, cube->inv_matrix);
			inverse_mat3x3_c(cube->norm_mat	, cube->inv_norm_mat);
			
		}
		else if (tree_mamanger_get_node_type(object) == NODE_RT_CYLINDER)
		{
			cylf_t *cyl = &scene_ptr->cyls[scene_ptr->n_cyls];

			get_cylinder		(object, cyl);
			get_bbox(object, &scene_ptr->box_testf[scene_ptr->n_boxf]);
			tree_manager_set_child_value_i32(object, "idx", scene_ptr->n_cyls);
			tree_manager_get_child_value_i32(object, NODE_HASH("material_idx"), &cyl->mat_idx);
			scene_ptr->n_boxf++;
			scene_ptr->n_cyls++;

			inverse_mat3x3_c	(cyl->matrix, cyl->inv_matrix);
			inverse_mat3x3_c	(cyl->norm_mat, cyl->inv_norm_mat);
		}
		else if (tree_mamanger_get_node_type(object) == NODE_RT_PLANE)
		{
			get_plane(object, &scene_ptr->planes[scene_ptr->n_planes]);
			
			tree_manager_set_child_value_i32(object, "idx", scene_ptr->n_planes);
			tree_manager_get_child_value_i32(object, NODE_HASH("material_idx"), &scene_ptr->planes[scene_ptr->n_planes].mat_idx);
			scene_ptr->n_planes++;
		}
		
	}
	release_zone_ref(&matList);
	release_zone_ref(&objs);
	

	if (tree_manager_find_child_node(scene_ptr->scene_ptr, NODE_HASH("shader_vars"), NODE_RT_SHADER_UNIFORM_LIST, &shader_vars))
	{
	
		tree_manager_set_child_value_vec3(&shader_vars, "lightPos", lightPos[0], lightPos[1], lightPos[2]);
		tree_manager_set_child_value_vec3(&shader_vars, "cameraPos", camPos[0], camPos[1], camPos[2]);
		tree_manager_set_child_value_mat3x3(&shader_vars, "cameraInvMat", camIMat);
		tree_manager_set_child_value_mat3x3(&shader_vars, "cameraInvNormal", camINMat);

		tree_manager_set_child_value_i32(&shader_vars, "num_materials", scene_ptr->n_materials);
		tree_manager_set_child_value_i32(&shader_vars, "numboxes", scene_ptr->n_boxf);
		tree_manager_set_child_value_i32(&shader_vars, "num_spheres", scene_ptr->n_spheres);
		tree_manager_set_child_value_i32(&shader_vars, "num_cubes", scene_ptr->n_cubes);
		tree_manager_set_child_value_i32(&shader_vars, "num_cyls", scene_ptr->n_cyls);
		tree_manager_set_child_value_i32(&shader_vars, "num_planes", scene_ptr->n_planes);

#ifdef HAS_RENDER
		tree_manager_set_child_value_float(&shader_vars, "winW", target_w);
		tree_manager_set_child_value_float(&shader_vars, "winH", target_h);
		tree_manager_set_child_value_float(&shader_vars, "invRes", 1.0f / 2048.0f);
		tree_manager_set_child_value_i32(&shader_vars, "boxDataTex", 0);
		tree_manager_set_child_value_i32(&shader_vars, "cubemap", 1);
		tree_manager_set_child_value_i32(&shader_vars, "texture1", 2);
		tree_manager_set_child_value_i32(&shader_vars, "texture2", 3);

		n = 0;
		while (n < 6)
		{
			DECLARE_ALIGNED_VEC3(cnorm);
			get_cube_norm(n, cnorm);
			tree_manager_set_child_value_vec3_arr(&shader_vars, "cube_normz[0]", n, cnorm[0], cnorm[1], cnorm[2]);
			n++;
		}
#endif
		tree_manager_set_child_value_float(&shader_vars, "PI", PIf);
		tree_manager_set_child_value_float(&shader_vars, "D3_EPSILON", 0.0000001);
		

		release_zone_ref(&shader_vars);
	}
	//getGeomData();
}

int castRayToLightf(scene_t *scene_ptr,const rayf_t *ray, unsigned int cast)
{
	unsigned int	bound_ids[128];
	float			min_max[2];
	unsigned int	intersect;
	mem_zone_ref	object = { PTR_NULL };
	int				n;
	if (scene_ptr->n_boxf == 0)return 0;


	intersect = intersect_ray_boxesf(ray->f_origin, ray->f_inv_direction, ray->o_sign01, scene_ptr->box_testf, scene_ptr->n_boxf, cast, bound_ids, min_max);
	if (!intersect)return 1;

	n = 0;
	while (bound_ids[n] != 0)
	{
		float			sphere_dist;
		float			cube_dist;
		unsigned int nn;
		for (nn = 0; nn < scene_ptr->n_spheres; nn++)
		{
			if (scene_ptr->spheres[nn].AABOX.cast_id == bound_ids[n])
			{
				intersect = Sphere_intersect(ray, &scene_ptr->spheres[nn], &sphere_dist, NULL, NULL);
			}
		}

		for (nn = 0; nn < scene_ptr->n_cubes; nn++)
		{
			if (scene_ptr->cubes[nn].AABOX.cast_id == bound_ids[n])
			{
				intersect = rayIntersectCube(&scene_ptr->cubes[nn], ray, &cube_dist, NULL);
			}

		}
		for (nn = 0; nn < scene_ptr->n_cyls; nn++)
		{
			if (scene_ptr->cyls[nn].AABOX.cast_id == bound_ids[n])
			{
				float cyldist[2];
				intersect = intersectRayCyl(ray, &scene_ptr->cyls[nn], cyldist, NULL);
			}

		}

		/*
		if (!tree_node_find_child_by_id(&scene, bound_ids[n], &object))continue;
		item_type = tree_mamanger_get_node_type(&object);
		switch (item_type)
		{
			case NODE_RT_SPHERE:
				intersect = Sphere_intersect(ray, &object, &sphere_dist, NULL, NULL);
			break;
			case NODE_RT_CUBE:
				intersect = rayIntersectCube(&object, ray, &cube_dist, NULL);
			break;
		}
		*/
		/*
		unsigned int	item_idx;
		item_type = get_id_var_type(bound_ids[n]);
		item_idx = get_id_var_idx(bound_ids[n]);
		intersect = 0;
		switch (item_type)
		{
			case 1:
			intersect = Sphere_intersect(ray, &SpherefList->listPtr[item_idx], &sphere_dist, NULL, NULL);
			break;
			case 2:
			intersect = rayIntersectCube(&CubefList->listPtr[item_idx], ray, &cube_dist, NULL);
			break;
			case 3:
			float cyldist[2];
			intersect = intersectRayCyl(ray, &CylfList->listPtr[item_idx], cyldist, NULL);
			break;
		}
		*/
		if (intersect)
			return 0;
		n++;
	}
	return 1;
}



OS_API_C_FUNC(void) castRayf(scene_t *scene_ptr, float *lightPos, const rayf_t *new_ray, unsigned char *pix, int cast, thread_info_t *thread)
{
	DECLARE_ALIGNED_VEC3(lp0);
	DECLARE_ALIGNED_VEC3(lightVec);
	DECLARE_ALIGNED_VEC3(rayPos);
	DECLARE_ALIGNED_VEC3(outPos);
	DECLARE_ALIGNED_VEC3(normVec);

	unsigned int	bound_ids[128];
	int				pixNew[4];
	int				pixTex[4];
	float			min_max[2];
	float			uv_coord[2];
	float			env_uv[2];
	unsigned char	newPix[4];
	unsigned char	pixNorm[4];
	unsigned char	env_pix[4];
	float			dist;
	float			dot;
	float			shadow;
	unsigned int	intersect;
	int				n;
	int				env_map;
	int				bbox_id;
	unsigned int	col;
	spheref_t		*sphere;
	cubef_t			*cube;
	cylf_t			*cyl;
	unsigned int	cobj_type;
	materialf_t		*material = PTR_NULL;
	float			ddlight;
	float			mat_reflect;
	float			mat_refract, refract_density;
	float			distPlane;
	float			denom;
	float			*center;
	float			*norm;

	if (lightPos == PTR_NULL)return;
	if (lightPos == PTR_INVALID)return;

	min_max[0] = 100000000000000000000.0f;
	min_max[1] = -100000000000000000000.0f;

	dist = 1000000000000000.0f;
	bbox_id = 0;;
	col = 0;
	
	
	
	pix[0] = 0;
	pix[1] = 0;
	pix[2] = 0;

	if (scene_ptr->n_boxf > 0)
		intersect = intersect_ray_boxesf(new_ray->f_origin, new_ray->f_inv_direction, new_ray->o_sign01, scene_ptr->box_testf, scene_ptr->n_boxf, cast, bound_ids, min_max);
	else
	{
		bound_ids[0] = 0;
		intersect = 0;
	}
	
	if ((cast != scene_ptr->planes[0].cast_id) && (scene_ptr->n_planes>0))
	{
		center = scene_ptr->planes[0].center;
		norm = scene_ptr->planes[0].norm;

		if ((center != PTR_NULL) && (norm != PTR_NULL))
		{
			// assuming vectors are all normalized
			denom = dot_vec3(norm, new_ray->direction);
			if (libc_fabsf(denom) > EPSILON) {

				sub_vec3(center, new_ray->origin, lp0);
				distPlane = dot_vec3(lp0, norm) / denom;
				if (distPlane > EPSILON)
				{
					cobj_type = NODE_RT_PLANE;
					copy_vec3(thread->tmpNorm, norm);
					dist = distPlane;

					if (scene_ptr->planes[0].mat_id < 0xFFFF)
						material = &scene_ptr->materials[scene_ptr->planes[0].mat_id];
					else
						material = PTR_NULL;
					bbox_id = scene_ptr->planes[0].cast_id;
					col = 1;
				}
			}
		}
		
	}
	
	if ((!intersect) && (col==0))
		goto no_inter;

	n = 0;

	while (bound_ids[n] != 0)
	{
		//mem_zone_ref	object = { PTR_NULL };

		float			sphere_dist, sphere_dist2;
		float			cube_dist;
		float			cyl_dist;
		unsigned int	nn;
		for (nn = 0; nn < scene_ptr->n_spheres; nn++)
		{
			if ((scene_ptr->spheres[nn].AABOX.cast_id == bound_ids[n]) && (bound_ids[n] != cast))
			{
				if (Sphere_intersect(new_ray, &scene_ptr->spheres[nn], &sphere_dist, &sphere_dist2, thread->tmpNorm))
				{
					if (sphere_dist<dist)
					{
						cobj_type = NODE_RT_SPHERE;
						sphere   = &scene_ptr->spheres[nn];

						if (scene_ptr->spheres[nn].mat_id < 0xFFFF)
							material = &scene_ptr->materials[scene_ptr->spheres[nn].mat_id];
						else
							material = PTR_NULL;

						dist = sphere_dist;
						bbox_id = bound_ids[n];
						copy_vec3(outPos, thread->tmpNorm);
						col = 1;
					}
				}
			}
		}
		
		for (nn = 0; nn < scene_ptr->n_cubes; nn++)
		{
			if ((scene_ptr->cubes[nn].AABOX.cast_id == bound_ids[n]) && (bound_ids[n] != cast))
			{
				if (rayIntersectCube(&scene_ptr->cubes[nn], new_ray, &cube_dist, thread->tmpNorm))
				{
					if (cube_dist<dist)
					{
						cobj_type = NODE_RT_CUBE;
						dist = cube_dist;
						bbox_id = bound_ids[n];
						cube = &scene_ptr->cubes[nn];

						if (cube->mat_id < 0xFFFF)
							material = &scene_ptr->materials[cube->mat_id];
						else
							material = PTR_NULL;

						copy_vec3(outPos, thread->tmpNorm);
						col = 1;
					}
				}
			}
			
		}
		
		for (nn = 0; nn < scene_ptr->n_cyls; nn++)
		{
			if ((scene_ptr->cyls[nn].AABOX.cast_id == bound_ids[n]) && (bound_ids[n] != cast))
			{
				float cyldist[2];
				if (intersectRayCyl(new_ray, &scene_ptr->cyls[nn], cyldist, thread->tmpNorm))
				{
					if (cyldist[0]>0)
					{
						cyl_dist = cyldist[0];
						if (cyl_dist<dist)
						{
							cobj_type = NODE_RT_CYLINDER;
							cyl = &scene_ptr->cyls[nn];
							dist = cyl_dist;
							bbox_id = bound_ids[n];
							if (cyl->mat_id < 0xFFFF)
								material = &scene_ptr->materials[cyl->mat_id];
							else
								material = PTR_NULL;
							col = 1;
							copy_vec3(outPos, thread->tmpNorm);
						}
					}
				}
			}
			
		}
		n++;
	}

	if (col == 0)goto no_inter;
	add_scale_vec3_o(new_ray->origin, new_ray->direction, dist, rayPos);
	
	if(cobj_type == NODE_RT_SPHERE)
	{
		//sub_vec3		(outPos.v,sphere_ptr->center,normVec.v);
		copy_vec3		(normVec, outPos);
		normalize_vec3	(normVec);

		uv_coord[0] = libc_asinf(normVec[0]) / PIf + 0.5f;
		uv_coord[1] = libc_asinf(normVec[1]) / PIf + 0.5f;

		mul_vec3x3(normVec, sphere->norm_mat);
	}
	else if (cobj_type == NODE_RT_PLANE)
	{
		copy_vec3	(normVec, thread->tmpNorm);
		uv_coord[0] = rayPos[0] * 0.002f;
		uv_coord[1] = rayPos[2] * 0.002f;
	}	
	else if(cobj_type == NODE_RT_CUBE)
	{
		float distPlane=0.0f;
		n = 0;
		while (n<6)
		{
			float *cplane = &cube->planes[n*4];
			distPlane = dot_vec3(cplane, rayPos) + cplane[3];
			if (libc_fabsf(distPlane)<1.0)
			{
				copy_vec3(normVec, cplane);
				switch (n)
				{
				case 2:
				case 0:
					//	cube_normz[4]=vec3(0.0,0.0,1.0);
					uv_coord[0] = (outPos[0] + (cube->size[0])) / (cube->size[0] * 2.0f);
					uv_coord[1] = (outPos[1] + (cube->size[1])) / (cube->size[1] * 2.0f);
					break;
				case 3:
				case 1:
					//	cube_normz[4]=vec3(1.0,0.0,0.0);
					uv_coord[0] = (outPos[1] + (cube->size[1])) / (cube->size[1] * 2.0f);
					uv_coord[1] = (outPos[2] + (cube->size[2])) / (cube->size[2] * 2.0f);

					break;
				case 4:
				case 5://	cube_normz[4]=vec3(0.0,1.0,0.0);
					uv_coord[0] = (outPos[0] + (cube->size[0])) / (cube->size[0] * 2.0f);
					uv_coord[1] = (outPos[2] + (cube->size[2])) / (cube->size[2] * 2.0f);
					break;
				}
				break;
			}
			n++;
		}
	}
	else if(cobj_type == NODE_RT_CYLINDER)
	{
		DECLARE_ALIGNED_VEC3(A);
		DECLARE_ALIGNED_VEC3(C);
		DECLARE_ALIGNED_VEC3(V);
		DECLARE_ALIGNED_VEC3(P);

		C[0] = 0.0f;
		C[1] = 0.0f;
		C[2] = 0.0f;

		A[0] = 0.0f;
		A[1] = 1.0f;
		A[2] = 0.0f;

		//V = X - C
		sub_vec3(outPos, C, V);
		project_vec3(V, A, P);
		if ((outPos[1]+0.1)>=cyl->half_height)
		{
			normVec[0] = 0.0f;
			normVec[1] = 1.0f;
			normVec[2] = 0.0f;
			uv_coord[0] = ((outPos[0] / cyl->radius) + 1.0f)/2.0f;
			uv_coord[1] = ((outPos[2] / cyl->radius) + 1.0f) / 2.0f;
		}
		else if ((outPos[1] - 0.1) <= -cyl->half_height)
		{
			normVec[0] = 0.0f;
			normVec[1] = -1.0f;
			normVec[2] = 0.0f;
			uv_coord[0] = ((outPos[0] / cyl->radius) + 1.0f) / 2.0f;
			uv_coord[1] = ((outPos[2] / cyl->radius) + 1.0f) / 2.0f;
		}
		else
		{
			sub_vec3(V, P, normVec); // Project V onto A
			normalize_vec3(normVec);

			uv_coord[0] = libc_asinf(normVec[0]) / PIf + 0.5f;
			uv_coord[1] = length_vec3(P) / (cyl->half_height);
			if (uv_coord[1] > 1.0)
				uv_coord[1] = 1.0;
		}
		uv_coord[0] = uv_coord[0] / 4.0f;
		uv_coord[1] = uv_coord[1] / 4.0f;

		mul_vec3x3(normVec ,cyl->norm_mat);
	}


	sub_vec3		(lightPos, rayPos, lightVec);
	normalize_vec3	(lightVec);
	shadow = 1.0f;


	if (cast == 0)
	{
		init_rayf(thread->reflectRayf, rayPos, lightVec);
		if (!castRayToLightf(scene_ptr, thread->reflectRayf, bbox_id))
		{
			shadow = 0.4f;
		}
	}

	if (material != PTR_NULL)
	{
		if (material->tid > 0)
		{
			getTexPix_32(&scene_ptr->textures[material->tid], uv_coord, pixTex, 1);
		}
		else
		{
			pixTex[0] = material->color[0];
			pixTex[1] = material->color[1];
			pixTex[2] = material->color[2];
		}
		mat_reflect = material->reflect;
		mat_refract = material->refract;
		refract_density = material->refract_density;
	}
	else
	{
		pixTex[0] = 255;
		pixTex[1] = 255;
		pixTex[2] = 255;
		mat_reflect = 0.0f;
		mat_refract = 0.0f;
		refract_density = 0.0f;
	}

	
	if (material->nid>0)
	{
		DECLARE_ALIGNED_VEC3(tNorm);
		DECLARE_ALIGNED_VEC3(tangent);
		DECLARE_ALIGNED_VEC3(nt);
		DECLARE_ALIGNED_VEC3(binormal);
		DECLARE_ALIGNED_VEC3(test_norm);
		DECLARE_ALIGNED_MAT3(mat);
		float					dist, plane_det;

		getTexPix_32uc(&scene_ptr->textures[material->nid], uv_coord, pixNorm);
		tNorm[0] = (pixNorm[0] - 128.0);
		tNorm[1] = (pixNorm[1] - 128.0);
		tNorm[2] = (pixNorm[2] - 128.0);

		scale_vec3(tNorm, 0.1f);
		
		plane_det = -dot_vec3(normVec,rayPos);				//dot
		copy_vec3(test_norm ,rayPos);

		test_norm[0] = test_norm[0] + 1.0;
		dist = (dot_vec3(test_norm,normVec)) + plane_det;
		scale_vec3_o(normVec, dist, nt);
		sub_vec3	(test_norm, nt, tangent);

		normalize_vec3(tangent);
		cross_vec3(normVec, tangent, binormal);				//normalize + cross
		normalize_vec3(binormal);

		copy_vec3(&mat[0], tangent);
		copy_vec3(&mat[4], binormal);
		copy_vec3(&mat[8], normVec);

		mul_vec3x3(tNorm, mat);
		normalize_vec3_o(tNorm, normVec);
	}
	



	dot = dot_vec3(normVec, lightVec);
	if (dot<0.1)dot = 0.1;

	pixNew[0] = 0;
	pixNew[1] = 0;
	pixNew[2] = 0;
	if (cast == 0)
	{
		DECLARE_ALIGNED_VEC3(Reflect);

		long fac;

		if (mat_reflect>0.0f)
		{
			reflect_vec3			(new_ray->direction, normVec, Reflect);
			init_rayf				(thread->reflectRayf, rayPos, Reflect);
			castRayf				(scene_ptr, lightPos, thread->reflectRayf, newPix, bbox_id, thread);
			libc_ftol				(mat_reflect * 256.0f, &fac);
			interpolate_pilxels		(pixNew, newPix, fac);
		}

		if (mat_refract>0.0f)
		{
			refract_vec3			(normVec, new_ray->direction, 1.0, refract_density, Reflect);
			init_rayf				(thread->reflectRayf, rayPos, Reflect);
			castRayf				(scene_ptr, lightPos, thread->reflectRayf, newPix, bbox_id, thread);

			libc_ftol				(mat_refract * 255.0f, &fac);
			interpolate_pilxels		(pixNew, newPix, fac);
		}
	}


	ddlight = 0.0;
	/*
	n = 0;
	while (n<HalofList->num_item)
	{
		spheref_t		*spheref;
		spheref = HalofList->getItemAt(n);
		if (Sphere_intersect(new_ray, spheref, &sphere_dist, &sphere_dist2, NULL))
		{
			float volume;
			if (sphere_dist<dist)
			{
				volume = libc_fabsf(sphere_dist2 - sphere_dist);
				ddlight = volume / 150.0f;//powf(volume/100.0,100.0);

				if (ddlight<0.0)
					ddlight = 0.0;

				if (ddlight>1.0)
					ddlight = 1.0;
			}
		}
		n++;
	}
	*/
	libc_ftol(pixTex[0] * shadow*dot + pixNew[0], &pixNew[0]);
	libc_ftol(pixTex[1] * shadow*dot + pixNew[1], &pixNew[1]);
	libc_ftol(pixTex[2] * shadow*dot + pixNew[2], &pixNew[2]);



	pix[0] = max(min(pixNew[0], 255), 0);
	pix[1] = max(min(pixNew[1], 255), 0);
	pix[2] = max(min(pixNew[2], 255), 0);
	
	

	return;

no_inter:




	ddlight = 0.0;
	/*
	n = 0;
	while (n<HalofList->num_item)
	{
		spheref_t		*spheref;
		spheref = HalofList->getItemAt(n);
		if (Sphere_intersect(new_ray, spheref, &sphere_dist, &sphere_dist2, NULL))
		{
			float volume;

			volume = libc_fabsf(sphere_dist2 - sphere_dist);
			ddlight = volume / 150.0f;//powf(volume/100.0,100.0);

			if (ddlight<0.0)
				ddlight = 0.0;

			if (ddlight>1.0)
				ddlight = 1.0;
		}
		n++;
	}
	*/
#if 1
	env_map = readEnvCubemapPixf(new_ray, env_uv);
	if (env_map >= 0)
	{
		getTexPix(&scene_ptr->textures[scene_ptr->cubemap_ids[env_map]], env_uv, env_pix);

		pixNew[0] = (pix[0] + env_pix[0]) >> 1;
		pixNew[1] = (pix[1] + env_pix[1]) >> 1;
		pixNew[2] = (pix[2] + env_pix[2]) >> 1;

		pix[0] = max(min(pixNew[0],255),0);
		pix[1] = max(min(pixNew[1],255),0);
		pix[2] = max(min(pixNew[2],255),0);

	}
#endif

}

#ifdef HAS_RENDER
	OS_API_C_FUNC(void) doCasts(rayf_t *new_ray_ptr, thread_info_t *thread)
	{
		unsigned int	pX, pY, n;
		unsigned char   *pData;
		float			*cp;

		if (camPos == PTR_NULL)return;
		cp = camPos;

		if (shaderId >= 0)
		{
			mem_zone_ref cubemap_node = { PTR_NULL }, shader_vars = { PTR_NULL };
			if (tree_manager_find_child_node(&scene, NODE_HASH("shader_vars"), NODE_RT_SHADER_UNIFORM_LIST, &shader_vars))
			{
				loadUniforms		(shaderId, &shader_vars);
				release_zone_ref	(&shader_vars);
			}
			

			if (tree_manager_find_child_node(&scene, NODE_HASH("cubemap"), NODE_RT_CUBEMAP, &cubemap_node))
			{
				if (cubeMapId <= 0)
				{
					image_t			*cubemap_images[6];
					int				n = 6;
					while (n--)
					{
						unsigned int img_id;
						if (tree_mamanger_get_node_dword(&cubemap_node, n*sizeof(unsigned int), &img_id))
							cubemap_images[n] = &textures[img_id];
						else
							cubemap_images[n] = PTR_NULL;
					}
					cubeMapId = createCubeMap(512, 512, cubemap_images);
				}
				release_zone_ref(&cubemap_node);
			}
			if (shaderId >= 0)
			{
				if (boxDataId<0)
					boxDataId = createRGBTexturef(2048, 1);

				load_tex1D_f(boxDataId, boxData, boxDataLen);
			}

			if (render_texture1.texid < 0)
			{
				render_texture1.texid = createRGBTexture(render_texture1.w, render_texture1.h);
				load_images(&render_texture1);
			}

			if (render_texture2.texid < 0)
			{
				render_texture2.texid = createRGBTexture(render_texture2.w, render_texture2.h);
				load_images(&render_texture2);
			}

			use_texture2D		(0, boxDataId);
			use_textureCubeMap	(1, cubeMapId);
			use_texture2D		(2, render_texture1.texid);
			use_texture2D		(3, render_texture2.texid);
			clear_screen		();
			draw_mesh			(quad, uv, indexes, 2);

		}
		else
		{
			pY = thread->sY;
			while (pY < thread->eY)
			{
				pX = thread->sX;
				n = pY*target_w + pX;
				while (pX < thread->eX)
				{
					mul_vec3x3_o(raysf[n].origin, camIMat, thread->trans_ray_origin);
					add_vec3(thread->trans_ray_origin, cp, thread->trans_ray_origin);
					mul_vec3x3_o(raysf[n].direction, camINMat, thread->trans_ray_direction);
					init_rayf(new_ray_ptr, thread->trans_ray_origin, thread->trans_ray_direction);
					pData = get_pixel_addr(pX, pY);
					castRayf(new_ray_ptr, pData, 0, thread);
					n++;
					pX++;
				}
				pY++;
			}
		}
	}
#endif

OS_API_C_FUNC(int) get_scene_list(mem_zone_ref_ptr scenes, mem_zone_ref_ptr nFirst)
{
	mem_zone_ref list = { PTR_NULL }, my_list = { PTR_NULL };
	mem_zone_ref_ptr sh=PTR_NULL;
	unsigned int first;

	if (!tree_mamanger_get_node_dword(nFirst, 0, &first))
		first = 0;
	tree_remove_children(scenes);

	tree_manager_create_node		("hashes", NODE_BITCORE_HASH_LIST, &list);

	get_app_type_obj_hashes			("raytrace",NODE_RT_SCENE,first,10,&list);

	for (tree_manager_get_first_child(&list, &my_list, &sh); ((sh != NULL) && (sh->zone != NULL)); tree_manager_get_next_child(&my_list, &sh))
	{
		hash_t		 h;
		char		 hash[65];
		mem_zone_ref scene = { PTR_NULL };
		int i;
		tree_manager_get_node_hash(sh, 0, h);

		i = 0;
		while (i < 32)
		{
			hash[i * 2 + 0] = hex_chars[h[i] >> 0x04];
			hash[i * 2 + 1] = hex_chars[h[i] & 0x0F];
			i++;
		}
		hash[64] = 0;

		if (load_obj("raytrace", hash, "scene", 0, &scene, PTR_NULL))
		{
			tree_manager_set_child_value_hash(&scene, "hash", h);
			tree_manager_node_add_child(scenes, &scene);
			release_zone_ref(&scene);
		}
	}

	release_zone_ref(&list);

	return 1;
}

OS_API_C_FUNC(int) get_nscene(mem_zone_ref_ptr nscenes)
{
	unsigned int num;

	num=get_app_type_nobjs("raytrace", NODE_RT_SCENE);

	tree_manager_write_node_dword(nscenes,0, num);

	return 1;
	
}

OS_API_C_FUNC(int) tracer_load_scene(const char *robjHash)
{
	char				objHash[65];
	mem_zone_ref_ptr	new_scene;
	mat3x3f_t			mat,nmat;
	mem_zone_ref		cm = { PTR_NULL }, objs = { PTR_NULL }, my_list = { PTR_NULL }, matList = { PTR_NULL };
	mem_zone_ref_ptr	object = PTR_NULL;
	unsigned int		Matidx = 0, n = 0;
	int					ret;
	scene_t				*scene_ptr;

	while (!compare_z_exchange_c(&scenes_lck, 1))
	{
		snooze_c(1000);
	}

	n = 0;
	while (n < 32)
	{
		objHash[n * 2 + 0] = robjHash[(31 - n) * 2 + 0];
		objHash[n * 2 + 1] = robjHash[(31 - n) * 2 + 1];

		n++;
	}

	objHash[64] = 0;

	new_scene = &scenes[n_scenes];


	//tree_manager_create_node("scene", NODE_RT_SCENE, &scene_ptr->scene);

	if (!load_obj("raytrace", objHash, "scene", 2, new_scene, PTR_NULL)){ scenes_lck = 0; return 0; }
	ret = (tree_mamanger_get_node_type(new_scene) == NODE_RT_SCENE) ? 1 : 0;
	if (ret)ret = tree_manager_find_child_node(new_scene, NODE_HASH("objects"), NODE_JSON_ARRAY, &objs);

	if (!ret)
	{
		release_zone_ref(new_scene);
		return 0;
	}

	scene_ptr = (scene_t *)malloc_c(sizeof(scene_t));

	init_scene(scene_ptr);


	tree_manager_set_child_value_vec3	(new_scene, "lightPos", 0, 100, 0);
	tree_manager_set_child_value_i32	(new_scene, "id_var", 1);



	identity_mat3x3_c(mat);
	identity_mat3x3_c(nmat);

	if (tree_manager_find_child_node(new_scene, NODE_HASH("cubemap"), NODE_RT_CUBEMAP, &cm))
	{
		char objhash[65];
		unsigned char *cmh;
		hash_t  maps[6];
		mem_zone_ref cubemap = { PTR_NULL };
		int		i;

		cmh=tree_mamanger_get_node_data_ptr(&cm, 0);


		i = 0;
		while (i < 32)
		{
			objhash[i * 2 + 0] = hex_chars[cmh[i] >> 0x04];
			objhash[i * 2 + 1] = hex_chars[cmh[i] & 0x0F];
			i++;
		}
		objhash[64] = 0;

		if (load_obj("raytrace", objhash, "cubemap", 2, &cubemap, PTR_NULL))
		{
			tree_manager_get_child_value_hash(&cubemap, NODE_HASH("right"), maps[cubemap_right]);
			tree_manager_get_child_value_hash(&cubemap, NODE_HASH("left"), maps[cubemap_left]);
			tree_manager_get_child_value_hash(&cubemap, NODE_HASH("top"), maps[cubemap_up]);
			tree_manager_get_child_value_hash(&cubemap, NODE_HASH("bottom"), maps[cubemap_down]);
			tree_manager_get_child_value_hash(&cubemap, NODE_HASH("front"), maps[cubemap_forward]);
			tree_manager_get_child_value_hash(&cubemap, NODE_HASH("back"), maps[cubemap_backward]);

			for (i = 0; i < 6; i++)
			{
				int id;

				id = add_texture(scene_ptr,maps[i]);

				if (id>=0)
					scene_ptr->cubemap_ids[i] = id;
				else
					scene_ptr->cubemap_ids[i] = 0;
					
			}
			release_zone_ref(&cubemap);

			tree_manager_add_child_node	(new_scene, "cubemap", NODE_GFX_CUBEMAP, &cubemap);
			tree_manager_write_node_data(&cubemap, scene_ptr->cubemap_ids, 0, 6 * sizeof(unsigned int));
			release_zone_ref			(&cubemap);
		}
		release_zone_ref(&cm);
	}
	

	tree_manager_set_child_value_mat3x3 (new_scene, "camMat", mat);
	tree_manager_set_child_value_mat3x3 (new_scene, "camNMat", nmat);

	tree_manager_add_child_node			(new_scene, "shader_vars", NODE_RT_SHADER_UNIFORM_LIST, PTR_NULL);
	tree_manager_add_child_node			(new_scene, "material_list", NODE_RT_MATERIAL_LIST, &matList);

	Matidx = 0;

	for (tree_manager_get_first_child(&objs, &my_list, &object); ((object != NULL) && (object->zone != NULL)); tree_manager_get_next_child(&my_list, &object))
	{
		mem_zone_ref matH = { PTR_NULL },mat = { PTR_NULL };
		if (tree_mamanger_get_node_type(object) == NODE_RT_PLANE)
		{
			scene_ptr->n_planes++;
		}


		if (tree_mamanger_get_node_type(object)==NODE_RT_SPHERE)
		{
			float radius;
			unsigned int new_id;
			float		 *angles;

			new_id = get_new_idvar(new_scene);

			tree_manager_get_child_value_float		(object, NODE_HASH("radius"), &radius);
			tree_manager_set_child_value_float		(object, "sq_radius", radius*radius);
			tree_manager_set_child_value_mat3x3		(object, "mat", nmat);
			tree_manager_set_child_value_mat3x3		(object, "nmat", nmat);
			tree_manager_set_child_value_mat3x3		(object, "imat", nmat);
			tree_manager_set_child_value_mat3x3		(object, "inmat", nmat);
			tree_manager_set_child_value_i32		(object, "id", new_id);
			tree_manager_get_child_data_ptr			(object, NODE_HASH("angles"), &angles);

			scene_ptr->n_spheres++;
			scene_ptr->n_boxf++;

			compute_sphere		(object);
			set_sphere_anglesf	(new_scene, new_id, (angles[0] * PIf) / 180.0f, (angles[1] * PIf) / 180.0f, (angles[2] * PIf) / 180.0f);
		}

		if (tree_mamanger_get_node_type(object) == NODE_RT_CYLINDER)
		{
			unsigned int  new_id;
			float		 *angles;

			new_id = get_new_idvar(new_scene);

			tree_manager_set_child_value_mat3x3	(object, "mat", nmat);
			tree_manager_set_child_value_mat3x3	(object, "nmat", nmat);
			tree_manager_set_child_value_mat3x3	(object, "imat", nmat);
			tree_manager_set_child_value_mat3x3	(object, "inmat", nmat);
			tree_manager_set_child_value_i32	(object, "id", new_id);

			tree_manager_get_child_data_ptr		(object, NODE_HASH("angles"), &angles);

			compute_cyl							(object);
			set_cyl_anglesf						(new_scene,new_id, (angles[0] * PIf) / 180.0f, (angles[1] * PIf) / 180.0f, (angles[2] * PIf) / 180.0f);

			scene_ptr->n_cyls++;
			scene_ptr->n_boxf++;
		}

		if (tree_mamanger_get_node_type(object) == NODE_RT_CUBE)
		{
			unsigned int new_id;
			float		 *angles;
			new_id = get_new_idvar(new_scene);

			tree_manager_set_child_value_mat3x3	(object, "mat", nmat);
			tree_manager_set_child_value_mat3x3	(object, "nmat", nmat);
			tree_manager_set_child_value_mat3x3	(object, "imat", nmat);
			tree_manager_set_child_value_mat3x3	(object, "inmat", nmat);
			tree_manager_set_child_value_i32	(object, "id", new_id);

			tree_manager_get_child_data_ptr		(object, NODE_HASH("angles"), &angles);

			scene_ptr->n_cubes++;
			scene_ptr->n_boxf++;
			compute_cube(object);

			set_cube_anglesf					(new_scene, new_id, (angles[0] * PIf) / 180.0f, (angles[1] * PIf) / 180.0f, (angles[2] * PIf) / 180.0f);
		}

		if (tree_manager_find_child_node(object, NODE_HASH("material"), NODE_RT_MATERIAL, &matH))
		{
			unsigned char		*data;
			unsigned int		mat_found = 0;
			size_t				sz,n;

			sz		= tree_mamanger_get_node_data_size(&matH);
			if (sz < 32)continue;
			
			data	= tree_mamanger_get_node_data_ptr(&matH,0);
			release_zone_ref(&matH);


			if (tree_find_child_node_by_member_name_hash(&matList, NODE_RT_MATERIAL, "hash", data, &mat))
			{
				unsigned int mat_id;
				tree_manager_get_child_value_i32(&mat, NODE_HASH("id"), &mat_id);
				tree_manager_set_child_value_i32(new_scene, "material_id", mat_id);
				mat_found = 1;
				release_zone_ref(&mat);
			}


			if (!mat_found)
			{
				char matHash[65];
				n = 0;
				while (n < 32)
				{
					matHash[n * 2 + 0] = hex_chars[data[n] >> 0x04];
					matHash[n * 2 + 1] = hex_chars[data[n] & 0x0F];
					n++;
				}
				matHash[64] = 0;

				if (load_obj("raytrace", matHash, "mat", 2, &mat, PTR_NULL))
				{
					hash_t th;
					unsigned int mat_id,tid;
					mat_id = get_new_idvar(new_scene);

					if (tree_manager_get_child_value_hash(&mat, NODE_HASH("texture"), th))
					{
						if (memcmp_c(th, null_hash, sizeof(hash_t)))
						{
							tid = add_texture(scene_ptr,th);
							if (tid >= 0)
							{
								tree_manager_set_child_value_i32(&mat, "texture_id", tid);
							}
						}
					}

					if (tree_manager_get_child_value_hash(&mat, NODE_HASH("normalmap"), th))
					{
						if (memcmp_c(th, null_hash, sizeof(hash_t)))
						{
							tid = add_texture(scene_ptr, th);
							if (tid >= 0)
							{
								tree_manager_set_child_value_i32(&mat, "normalmap_id", tid);
							}
						}
					}

					tree_manager_set_child_value_hash	(&mat, "hash", data);
					tree_manager_set_child_value_i32	(&mat, "id", mat_id);
					tree_manager_set_child_value_i32	(&mat, "idx", Matidx);
					tree_manager_set_child_value_i32	(object, "material_id", mat_id);
					tree_manager_node_add_child			(&matList, &mat);
					release_zone_ref					(&mat);

					scene_ptr->n_materials++;
					Matidx++;
				}
			}
		}
	}
	release_zone_ref(&objs);
	release_zone_ref(&matList);
	

	if (ret)
	{
		unsigned int cur_scene;
		int n = 0;
		while (n<32)
		{
			char    hex[3];
			hex[0] = objHash[n * 2 + 0];
			hex[1] = objHash[n * 2 + 1];
			hex[2] = 0;
			scene_ptr->sceneId[n] = strtoul_c(hex, PTR_NULL, 16);
			n++;
		}

		
		scene_ptr->box_testf	= (box_testf_t	*)malloc_c(scene_ptr->n_boxf * sizeof(box_testf_t));
		scene_ptr->planes		= (planef_t	*)malloc_c(scene_ptr->n_planes * sizeof(planef_t));
		scene_ptr->spheres		= (spheref_t	*)malloc_c(scene_ptr->n_spheres * sizeof(spheref_t));
		scene_ptr->cubes		= (cubef_t	*)malloc_c(scene_ptr->n_cubes * sizeof(cubef_t));
		scene_ptr->cyls			= (cylf_t	*)malloc_c(scene_ptr->n_cyls * sizeof(cylf_t));
		scene_ptr->materials	= (materialf_t	*)malloc_c(scene_ptr->n_materials * sizeof(materialf_t));


		cur_scene				=	fetch_add_c(&n_scenes, 1);
		scene_list[cur_scene]	=	scene_ptr;
		scene_ptr->scene_ptr	=   new_scene;

		compute_scene			(scene_list[cur_scene]);
	}
	else
	{
		free_c					(scene_ptr);
		release_zone_ref		(new_scene);
	}

	scenes_lck = 0;

	return ret;
}

OS_API_C_FUNC(int) tracer_init()
{
	
	init_mat3_fncs_c();
	
	memset_c		(null_hash, 0, sizeof(hash_t));
	memset_c		(scene_list, 0, sizeof(scene_list));
	memset_c		(scenes, 0, sizeof(scenes));
	


	n_scenes		 = 0;
	scenes_lck		 = 0;

	cubemap_right	 = 0;
	cubemap_left	 = 1;
	cubemap_up		 = 2;
	cubemap_down	 = 3;
	cubemap_forward  = 4;
	cubemap_backward = 5;


	NODE_HASH_id = NODE_HASH("id");
	NODE_HASH_size = NODE_HASH("size");
	NODE_HASH_radius = NODE_HASH("radius");
	NODE_HASH_sqradius = NODE_HASH("sq_radius");
	NODE_HASH_center = NODE_HASH("center");
	NODE_HASH_norm = NODE_HASH("norm");
	NODE_HASH_refract_density = NODE_HASH("refract_density");
	NODE_HASH_refract = NODE_HASH("refract");
	NODE_HASH_reflect = NODE_HASH("reflect");
	NODE_HASH_size = NODE_HASH("size");
	NODE_HASH_plane = NODE_HASH("plane");
	NODE_HASH_planes = NODE_HASH("planes");
	NODE_HASH_mat = NODE_HASH("mat");
	NODE_HASH_nmat = NODE_HASH("nmat");
	NODE_HASH_imat = NODE_HASH("imat");
	NODE_HASH_inmat = NODE_HASH("inmat");
	NODE_HASH_material = NODE_HASH("material");
	NODE_HASH_texture_id = NODE_HASH("texture_id");
	NODE_HASH_color = NODE_HASH("color");
	NODE_HASH_bmin = NODE_HASH("bmin");
	NODE_HASH_bmax = NODE_HASH("bmax");
#ifdef HAS_RENDER

	cubeMapId = -1;
	boxDataId = -1;
	shaderId = -1;


	target_w = 0;
	target_h = 0;
	raysf = PTR_NULL;
	shaderId = loadFullShader("web/shaders/GLSL_Vert.c", "web/shaders/GLSL_Frag.c");
#endif

	return 1;
}

#ifdef HAS_RENDER
OS_API_C_FUNC(int) tracer_resize(unsigned int w, unsigned int h)
{
	DECLARE_ALIGNED_VEC3(of);
	DECLARE_ALIGNED_VEC3(d);
	int						n;
	unsigned int			pX, pY;
	float					ox, oy;

	target_w = w;
	target_h = h;

	ox = w / 2.0f;
	oy = h / 2.0f;

	of[0] = 0;
	of[1] = 0;
	of[2] = -10;
	if (raysf)free_c(raysf);
	raysf = (rayf_t *)malloc_c(w*h*sizeof(rayf_t));
	n = 0;
	pY = 0;

	while (pY<h)
	{
		pX = 0;
		while (pX<w)
		{
			d[0] = (pX - ox) / w;
			d[1] = (pY - oy) / h;
			d[2] = 1.0;
			normalize_vec3(d);
			init_rayf(&raysf[n], of, d);
			pX++;
			n++;
		}
		pY++;
	}

	
	return 1;
}
#endif
C_EXPORT mod_name_decoration_t	 mod_name_deco_type = MOD_NAME_DECO;
C_EXPORT int _fltused = 1;

unsigned int C_API_FUNC _DllMainCRTStartup(unsigned int *prev, unsigned int *cur, unsigned int *xx)
{

	return 1;
}
