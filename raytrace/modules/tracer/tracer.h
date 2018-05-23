#ifndef TRACER_API
#define TRACER_API C_IMPORT
#endif


TRACER_API int C_API_FUNC tracer_resize(unsigned int w, unsigned int h);



TRACER_API int C_API_FUNC  newMaterial		 (mem_zone_ref_ptr scene, vec_4uc_t color, float reflect, float refract, float refract_density, unsigned int tex_id, unsigned int n_id);
TRACER_API int C_API_FUNC  newCylinderf		 (mem_zone_ref_ptr scene, float centerX, float centerY, float centerZ, float half_height, float radius);
TRACER_API int C_API_FUNC  newCubef			 (mem_zone_ref_ptr scene, float centerX, float centerY, float centerZ, float sizeX, float sizeY, float sizeZ);
TRACER_API int C_API_FUNC  newPlanf			 (mem_zone_ref_ptr scene, float posX, float posY, float posZ, float normX, float normY, float normZ);
TRACER_API int C_API_FUNC  newSpheref		 (mem_zone_ref_ptr scene, float centerX, float centerY, float centerZ, float radius);
TRACER_API void C_API_FUNC setMaterial		 (mem_zone_ref_ptr scene, unsigned int obj_id, unsigned int mat_id);
TRACER_API void C_API_FUNC setLightPosf		 (mem_zone_ref_ptr scene, float x, float y, float z);
TRACER_API void C_API_FUNC setCameraf		 (mem_zone_ref_ptr scene, vec3f_t pos, mat3x3f_t mat, mat3x3f_t nmat);
TRACER_API void C_API_FUNC set_cube_anglesf	 (mem_zone_ref_ptr scene,unsigned int obj_id, float x, float y, float z);
TRACER_API void C_API_FUNC set_cyl_anglesf	 (mem_zone_ref_ptr scene,unsigned int obj_id, float x, float y, float z);
TRACER_API void C_API_FUNC set_sphere_anglesf(mem_zone_ref_ptr scene,unsigned int obj_id, float x, float y, float z);

/*
TRACER_API int C_API_FUNC read_texture			(scene_t *scene, const char *file);
TRACER_API int C_API_FUNC read_cubemap_texture	(scene_t *scene, const char *maps[6]);
TRACER_API void C_API_FUNC castRayf				(scene_t *scene,const rayf_t *new_ray, unsigned char *pix, int cast, thread_info_t *thread);
TRACER_API void C_API_FUNC doCasts				(scene_t *scene,rayf_t *new_ray_ptr, thread_info_t *thread);
*/

TRACER_API int C_API_FUNC  tracer_init		();
TRACER_API int C_API_FUNC  tracer_load_scene(const char *objHash);
TRACER_API int C_API_FUNC  init_tracer		(unsigned int w, unsigned int h);
TRACER_API int C_API_FUNC  get_scene_ref	(hash_t id, mem_zone_ref_ptr out);
TRACER_API int	C_API_FUNC get_image_list	(hash_t id, mem_zone_ref_ptr out);
TRACER_API int	C_API_FUNC get_scene_texData(hash_t id, float *scene_data, size_t *data_len);
TRACER_API int	C_API_FUNC find_scene		(hash_t h);


#define		NODE_RT_MATERIAL				0x1e000001
#define		NODE_RT_CUBEMAP					0x1e000002
#define		NODE_RT_PLANE					0x1e000003
#define		NODE_RT_SPHERE					0x1e000004
#define		NODE_RT_CYLINDER				0x1e000005
#define		NODE_RT_SCENE					0x1E000006

#define		NODE_RT_BBOX					0x0D000010
#define		NODE_RT_CUBE					0x1e000007
