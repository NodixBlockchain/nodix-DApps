#include <base/std_def.h>
#include <base/std_mem.h>
#include <base/mem_base.h>
#include <base/std_str.h>
#include <strs.h>
#include <mem_stream.h>
#include <tpo_mod.h>
#include <libc_math.h>
#include <tree.h>
#include <vec_types.h>
#include <ray_float.h>
#include "tracer.h"

OS_API_C_FUNC(int) set_node_tracer_rpc(mem_zone_ref_ptr node, tpo_mod_file *pos_mod)
{
	tracer_init			();
	return 1;
}

OS_API_C_FUNC(int) get_img_list(const char *params, const struct http_req *req, mem_zone_ref_ptr result)
{
	hash_t			sceneid;
	mem_zone_ref	img_list = { PTR_NULL };
	int ret;
	if (strlen_c(params) != 64)return 0;

	int n = 0;
	while (n<32)
	{
		char    hex[3];
		hex[0] = params[(31 - n) * 2 + 0];
		hex[1] = params[(31 - n) * 2 + 1];
		hex[2] = 0;
		sceneid[n] = strtoul_c(hex, PTR_NULL, 16);
		n++;
	}


	ret = find_scene(sceneid);
	if (!ret)ret = tracer_load_scene(params);

	if (!ret)return 0;

	if (tree_manager_add_child_node(result, "images", NODE_GFX_IMAGE_LIST, &img_list))
	{
		get_image_list(sceneid,&img_list);
		release_zone_ref(&img_list);
	}
	return 1;
}

OS_API_C_FUNC(int) get_scene_tex(const char *params, const struct http_req *req, mem_zone_ref_ptr result)
{
	hash_t			sceneid;
	mem_zone_ref	scene = { PTR_NULL };
	float *			scene_data;
	size_t			data_len;
	int				ret;

	if (strlen_c(params) != 64)return 0;

	int n = 0;
	while (n<32)
	{
		char    hex[3];
		hex[0] = params[(31 - n) * 2 + 0];
		hex[1] = params[(31 - n) * 2 + 1];
		hex[2] = 0;
		sceneid[n] = strtoul_c(hex, PTR_NULL, 16);
		n++;
	}


	ret = find_scene(sceneid);
	if (!ret)ret = tracer_load_scene(params);

	scene_data			= (float *)malloc_c(2048 * 4 * sizeof(float));

	get_scene_texData				(sceneid,scene_data, &data_len);

	tree_manager_set_child_value_ptr(result, "ptr", scene_data);
	tree_manager_set_child_value_i32(result, "size", data_len*sizeof(float));

	return 2;
}

OS_API_C_FUNC(int) get_scene_data(const char *params, const struct http_req *req, mem_zone_ref_ptr result)
{
	hash_t		 sceneid;
	mem_zone_ref scene = { PTR_NULL };
	int			 ret;

	if (strlen_c(params) != 64)return 0;

	int n = 0;
	while (n<32)
	{
		char    hex[3];
		hex[0] = params[(31 - n) * 2 + 0];
		hex[1] = params[(31 - n) * 2 + 1];
		hex[2] = 0;
		sceneid[n] = strtoul_c(hex, PTR_NULL, 16);
		n++;
	}
	ret = find_scene(sceneid);
	if (!ret)ret = tracer_load_scene(params);

	if (!tree_manager_add_child_node(result, "scene", NODE_RT_SCENE, &scene))
		return 0;

	get_scene_ref				(sceneid,&scene);
	release_zone_ref			(&scene);
	return 1;
}

C_EXPORT mod_name_decoration_t	 mod_name_deco_type = MOD_NAME_DECO;
C_EXPORT int _fltused = 1;

unsigned int C_API_FUNC _DllMainCRTStartup(unsigned int *prev, unsigned int *cur, unsigned int *xx)
{

	return 1;
}

