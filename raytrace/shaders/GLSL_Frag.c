#version 100
//#extension GL_NV_shadow_samplers_cube : enable

precision highp  float;
precision highp int;

uniform mediump  vec3	lightPos;

uniform	mediump  mat3	cameraInvNormal;
uniform	mediump  mat3	cameraInvMat;
uniform	mediump  vec3	cameraPos;

uniform	mediump  float	winW;
uniform	mediump  float	winH;

//general box infos
//uniform vec3	cube_normz[6];
#ifdef USE_CUBES
vec3	cube_normz[6];
int		box_dets[6];
#endif

uniform mediump  int num_materials;

//axis aligned bounding box
uniform mediump  int numboxes;

//cubes
uniform mediump  int num_cubes;

//sphere
uniform mediump  int num_spheres;

//cylinder
uniform mediump  int num_cyls;

//planes
uniform mediump  int num_planes;

uniform	mediump  float		PI;
uniform	mediump  float		invRes;
uniform	mediump  float		D3_EPSILON;

uniform			samplerCube cubemap;
uniform			sampler2D	texture1;
uniform			sampler2D	texture2;
uniform			sampler2D	boxDataTex;


vec3 refract(vec3 incident,vec3 normal,float n1, float n2)
{
	vec3			outVec;
	float n			=  n1 / n2;
	float cosI		= dot(normal, incident);
	float  sinT2	= n * n * (1.0 - cosI * cosI);
	if (sinT2 > 1.0)
	{
		return vec3(0,0,0);
	}

	outVec	=	n*incident-(n+sqrt(1.0-sinT2))*normal;
	
	return outVec;
}

vec4 getPixTex(int coord)
{
	return texture2D(boxDataTex, vec2(float(coord)*invRes, 0.0));
}

int getItemInfos(int i,out int item_type,out int item_idx, out int item_ID )
{
	item_type	  = int (getPixTex(num_materials*7+i*3+2).r);
	item_idx	  = int (getPixTex(num_materials*7+i*3+2).g);
	item_ID		  = item_type*1024+item_idx;
	return 1;
}

#ifdef USE_CUBE
int getCubeInfos(int item_idx,out vec3 cube_center,out vec3 cube_size,out mat3 cube_mat)
{
	float			startPixU;

	startPixU	=	float(num_materials*7+numboxes*3+(item_idx*6));

	cube_center	=	texture2D(boxDataTex,vec2((startPixU+0.0)*invRes,0.0)).rgb;
	cube_size	=	texture2D(boxDataTex,vec2((startPixU+1.0)*invRes,0.0)).rgb;
	cube_mat	=	mat3	 (texture2D(boxDataTex,vec2((startPixU+3.0)*invRes,0.0)).rgb,texture2D(boxDataTex,vec2((startPixU+4.0)*invRes,0.0)).rgb,texture2D(boxDataTex,vec2((startPixU+5.0)*invRes,0.0)).rgb);

	return 1;
}
#endif


void getMatTexs(int mat_id, out int tid, out int nid)
{
	vec3 pix = getPixTex(mat_id * 7).rgb;
	tid = int(pix.r);
	nid = int(pix.g);
}
vec4 getMatColor(int mat_id)
{
	return getPixTex(mat_id * 7 + 1);
}

vec3 getMatInfos(int mat_id)
{
	return getPixTex(mat_id * 7 + 2).rgb;
}
void getTexUv(int mat_id, out vec2 pos, out vec2 scale)
{
	pos.x = getPixTex(mat_id * 7 + 3).r;
	pos.y = getPixTex(mat_id * 7 + 3).g;

	scale.x = getPixTex(mat_id * 7 + 4).r;
	scale.y = getPixTex(mat_id * 7 + 4).g;
}
void getNormUv(int mat_id, out vec2 pos, out vec2 scale)
{
	pos.x = getPixTex(mat_id * 7 + 5).r;
	pos.y = getPixTex(mat_id * 7 + 5).g;

	scale.x = getPixTex(mat_id * 7 + 6).r;
	scale.y = getPixTex(mat_id * 7 + 6).g;
}
vec3 project(vec3 A, vec3 B)
 {
	float dot1,dot2;
	float coef;

	dot1=dot(A,B);
	dot2=dot(B,B);
	coef=dot1/dot2;

	return(B*coef);
 }

int intersect_ray_box (int idx,vec3 ray_origin,vec3 ray_inv_direction)
{
  vec3 vmin,vmax;
  float tmin, tmax, tymin, tymax, tzmin, tzmax;

  vmin = getPixTex(num_materials * 7 + (idx * 3) + 0).rgb;
  vmax = getPixTex(num_materials * 7 + (idx * 3) + 1).rgb;
    
  if(ray_inv_direction[0]>0.0)
  {
	tmin = ((vmin[0] - ray_origin[0]) * ray_inv_direction[0]);
	tmax = ((vmax[0] - ray_origin[0]) * ray_inv_direction[0]);
  }
  else
  {
	tmin = ((vmax[0]  - ray_origin[0]) * ray_inv_direction[0]);
	tmax = ((vmin[0]  - ray_origin[0]) * ray_inv_direction[0]);
  }

  if(ray_inv_direction[1]>0.0)
  {
	tymin = ((vmin[1] - ray_origin[1])   * ray_inv_direction[1]);
	tymax  =((vmax[1] - ray_origin[1]) * ray_inv_direction[1]);
  }
  else
  {
	tymin = ((vmax[1]  - ray_origin[1]) * ray_inv_direction[1]);
	tymax = ((vmin[1]  - ray_origin[1]) * ray_inv_direction[1]);
  }
   
  if ( (tmin > tymax) || (tymin > tmax) ) 
    return 0;

  if (tymin > tmin)
    tmin = tymin;

  if (tymax < tmax)
    tmax = tymax;

  if(ray_inv_direction[2]>0.0)
  {
	tzmin = ((vmin[2] - ray_origin[2]) * ray_inv_direction[2]);
	tzmax = ((vmax[2] - ray_origin[2]) * ray_inv_direction[2]);
  }
  else
  {
	tzmin = ((vmax[2]  - ray_origin[2]) * ray_inv_direction[2]);
	tzmax = ((vmin[2]  - ray_origin[2]) * ray_inv_direction[2]);
  }  

  if ( (tmin > tzmax) || (tzmin > tmax) ) 
    return 0;
    
  tmax = min(tzmax, tmax);
  if (tmax < 0.0)return 0;
  /*
  tmin = max(tmin,tzmin);
  t[0]=tmin;
  t[1]=tmax;
  */
  return 1;
}

	
#ifdef USE_CUBE
int rayIntersectCube(vec3 center,vec3 size,vec3 raypos ,vec3 direction,mat3 mat,out vec3 NormVec,out vec2 uv_coord,out int plane_id,out float out_dist)
{
	int			col,ret;
	float		dist;
	vec3		raydir;
	vec3		rayori;
	vec3		rayidir;
	vec3		vec;
					
	dist		=	10000000.0;
	raypos		=	(raypos-center)	*	mat;
	raydir		=	direction		*	mat;
	rayidir		=	1.0/raydir;
	ret			=	0;
	
	if(intersect_ray_box	( -size,size,raypos,rayidir,minmax)==1)
	{
		float	distPlane,det_c;
		int		det;

		if(minmax[0]>0.0)
		{
			dist	=	minmax[0];
			vec		=	raypos+raydir*dist;

			for(int n=0;n<6;n++)
			{
				if (n == 0)
				{
					det_c = size[2];
					NormVec = cube_normz[0];
				}
				else if(n==1)
				{ 
					det_c =	 size[0];
					NormVec = cube_normz[1];
				}
				else if (n == 2)
				{
					det_c = size[2];
					NormVec = cube_normz[2];
				}
				else if (n == 3)
				{
					det_c = size[0];
					NormVec = cube_normz[3];
				}
				else if (n == 4)
				{ 
					det_c = size[1];
					NormVec = cube_normz[4];
				}
				else if (n == 5)
				{ 
					det_c = size[1];
					NormVec = cube_normz[5];
				}

			
				distPlane		=	dot(NormVec,vec)-det_c;
				if(abs(distPlane)<5.0)
				{
					plane_id		=	n;
					out_dist		=	dist;
					ret				=	1;
				}
			}
		}
	}

	if(ret==1)
	{
		vec3	total;
		total=(vec+size)/(size*2.0);
		if ((plane_id == 0) || (plane_id == 2))
		{
			uv_coord[0] = total[0];
			uv_coord[1] = total[1];
		}
		else if ((plane_id == 1) || (plane_id == 3))
		{
			//	cube_normz[1]=vec3(1.0,0.0,0.0);
			uv_coord[0] = total[1];
			uv_coord[1] = total[2];
		}
		else if ((plane_id == 4) || (plane_id == 5))
		{
			//	cube_normz[4]=vec3(0.0,1.0,0.0);
			uv_coord[0]	= total[0];
			uv_coord[1]	= total[2];
		}
	}
	return ret;
}
#endif


int Sphere_intersect(int sp_idx,vec3 raypos, vec3 direction, float minDist, out float d0, out float d1, out vec3 sphere_norm)
{
    //Compute A, B and C coefficients
	vec3  outPos,raydir;
	vec3  rp,rd;
	float a;// = dot(direction, direction);
    float b;// = 2.0 * dot(direction,l);
    float c;// = dot(sphere_center,sphere_center) + dot(raypos,raypos) -2.0*dot(sphere_center,raypos) - sq_radius;
	float q;
	vec3		sphere_center;
	float		sq_radius,radius;
	mat3		sphere_inv_mat;
	mat3		sphere_mat;
	int			startPixU;

	startPixU = num_materials * 7 + numboxes * 3 + num_cubes * 6 + sp_idx * 9;

	sphere_center	= getPixTex(startPixU + 0).rgb;
	sq_radius		= getPixTex(startPixU + 1).r;
	radius			= getPixTex(startPixU + 1).g;

	sphere_inv_mat	= mat3(getPixTex(startPixU + 3).rgb, getPixTex(startPixU + 4).rgb, getPixTex(startPixU + 5).rgb);
	sphere_mat		= mat3(getPixTex(startPixU + 6).rgb, getPixTex(startPixU + 7).rgb, getPixTex(startPixU + 8).rgb);
		
	rp = raypos - sphere_center;// *sphere_inv_mat;
	rd = direction;// *sphere_inv_mat;
	
	a 			= dot(rd, rd);
    b 			= 2.0 * dot(rd,rp);
    c 			= dot(rp,rp) - sq_radius;
    //Compute A, B and C coefficients

    //Find discriminant
    float disc = b * b - 4.0 * a * c;
    
    // if discriminant is negative there are no real roots, so return 
    // false as ray misses sphere
    if (disc < 0.0)
        return 0;

    // compute q as described above
    float distSqrt = sqrt(disc);
 
    if (b < 0.0)
        q = (-b - distSqrt)/(2.0*a);
    else
        q = (-b + distSqrt)/(2.0*a);


    // compute t0 and t1
    float t0 = q / a;
    float t1 = c / q;

    // make sure t0 is smaller than t1
    if (t0 > t1)
    {
        // if t0 is bigger than t1 swap them around
        float temp = t0;
        t0 = t1;
        t1 = temp;
    }

    // if t1 is less than zero, the object is in the ray's negative direction
    // and consequently the ray misses the sphere
    if (t1 < 0.0)
        return 0;
		

    // if t0 is less than zero, the intersection point is at t1
    if (t0 < 0.0)
    {
		d0=t1;
		d1=t0;
    }
    // else the intersection point is at t0
    else
    {
		d0=t0;
		d1=t1;
    }
	if (d0 > minDist)return 0;

	outPos			=	raypos+raydir*d0;
	sphere_norm		=	normalize	(outPos)*sphere_mat;
	/*
	sphere_uv[0]	=	asin(sphere_norm[0])/(PI) + 0.5;
	sphere_uv[1]	=	asin(sphere_norm[1])/(PI) + 0.5;
	*/
	return 1;
}


 int intcyl(vec3 raybase,vec3  raydir, float radius, out vec2 tVals)
 {
     int	 hit; // True if ray intersects cyl
     vec3    RC; // Ray base to cylinder base
     vec3    n, O;
	 float   d; // Shortest distance between the ray and the cylinder
     float	 t, s; // Distances along the ray
     float	 ln;


	 RC	  = raybase;
	
	 n	 = vec3(-raydir[2],0.0,raydir[0]);
     
     // Ray is parallel to the cylinder's axis.
     if ((ln = length(n)) < D3_EPSILON)
     {
		 d		=	dot(RC,RC);
         tVals[0] = -1000000000.0;
         tVals[1] = 1000000000.0;
         // True if ray is in cylinder.
		 if(d <= (radius*radius))
			return 1;
		 else
			 return 0;
     }
	 n*=1.0/ln;

     d	 = abs(dot(RC,n)); // Shortest distance.

	 if(d <= (radius))
		hit = 1;
	 else
		 hit = 0;

     // If ray hits cylinder.
     if (hit==1)
     {
		 float dd;
		 O[0] = -RC[2];
		 O[1] =  0.0;
		 O[2] =  RC[0];

         t	  = -dot(O,n) / ln;

		 O[0] = -n[2];
		 O[1] =  0.0;
		 O[2] =  n[0];

		 O		  = normalize	(O);
		 dd		  = dot(raydir, O);
		 if ((radius >= d*d) && (abs(dd)>D3_EPSILON))
			 s = abs(sqrt(radius - d * d) / dd);
		 else
			 s = 0.0;

         tVals[0] = t - s; // Entering distance.
         tVals[1] = t + s; // Exiting distance.
     }

     return hit;
 }

 int clipcyl(vec3 raybase,vec3 raydir,float half_height, inout vec2 tVals)
{
  float dc, dwb, dwt, tb, tt;
  float _in, _out; // Object intersection distances.

  _in  = tVals[0];
  _out = tVals[1];

  dc  = raydir[1];
  dwb = raybase[1] + half_height;
  dwt = raybase[1] - half_height;

  // Ray is parallel to the cylinder end-caps.
  if (dc == 0.0)
  {
      if (dwb <= 0.0)
          return 0;
      if (dwt >= 0.0)
          return 0;
  }
  else
  {
      // Intersect the ray with the bottom end-cap.
      tb = -dwb / dc;
      // Intersect the ray with the top end-cap.
      tt = -dwt / dc;

      // Bottom is near cap, top is far cap.
      if (dc >= 0.0)
      {
          if (tb > _out)
              return 0;
          if (tt < _in)
              return 0;
          if (tb > _in && tb < _out)
              _in = tb;
          if (tt > _in && tt < _out)
              _out = tt;
      }
      // Bottom is far cap, top is near cap.
      else
      {
          if (tb < _in)
              return 0;
          if (tt > _out)
              return 0;
          if (tb > _in && tb < _out)
              _out = tb;
          if (tt > _in && tt < _out)
              _in = tt;
      }
  }

  tVals[0] = _in;
  tVals[1] = _out;
  if(_in < _out)
	return 1;
  else
	return 0;
 }

 int intersectRayCyl(int cyl_idx,vec3 ray_origin, vec3 ray_direction,float minDist,out vec2 tVals,out vec3 cylNorm,out vec2 uv_coord)
{
	vec3	infos;
	vec3	raypos,raydir;
	vec3	A,P;
	vec3	cyl_center;
	float	cyl_half_height;
	float	cyl_radius, cyl_sqradius;
	mat3	cyl_inv_mat;
	mat3	cyl_inv_norm_mat;
	mat3	cyl_norm_mat;
	int		startPixU;

	startPixU = num_materials * 7 + numboxes * 3 + num_cubes * 6 + num_spheres * 9 + cyl_idx * 12;
	cyl_center = getPixTex(startPixU + 0).rgb;

	infos = getPixTex(startPixU + 1).rgb;
	cyl_sqradius = infos.r;
	cyl_half_height = infos.g;
	cyl_radius = infos.b;

	cyl_inv_mat = mat3(getPixTex(startPixU + 3).rgb, getPixTex(startPixU + 4).rgb, getPixTex(startPixU + 5).rgb);
	cyl_inv_norm_mat = mat3(getPixTex(startPixU + 6).rgb, getPixTex(startPixU + 7).rgb, getPixTex(startPixU + 8).rgb);
	cyl_norm_mat = mat3(getPixTex(startPixU + 9).rgb, getPixTex(startPixU + 10).rgb, getPixTex(startPixU + 11).rgb);

	raypos   = ray_origin	-cyl_center;
	raypos *= cyl_inv_mat;
	raydir = ray_direction*cyl_inv_norm_mat;

	if (intcyl(raypos, raydir, cyl_radius*cyl_radius, tVals) == 0)
        return 0;
	
    if (clipcyl(raypos, raydir, cyl_half_height, tVals)==0)
        return 0;

	if (tVals[0] > minDist)return 0;
		
	raypos			=	raypos+raydir*tVals[0];
	A				= vec3(0.0, 1.0, 0.0);
	//V = X - C
	P				=	project		(raypos,A);
	if ((raypos[1] + 0.1) >= cyl_half_height)
	{
		cylNorm= vec3(0.0,1.0,0.0);
		uv_coord[0] = (((raypos[0] / cyl_radius) + 1.0)*0.5)*0.75 + 0.125;
		uv_coord[1] = (((raypos[2] / cyl_radius) + 1.0)*0.5)*0.75;
	}
	else if ((raypos[1] - 0.1) <= -cyl_half_height)
	{
		cylNorm = vec3(0.0, -1.0, 0.0);
		uv_coord[0] = (((raypos[0] / cyl_radius) + 1.0)*0.5)*0.75 + 0.125;
		uv_coord[1] = (((raypos[2] / cyl_radius) + 1.0)*0.5)*0.75;;
	}
	else
	{
		cylNorm = normalize(raypos - P);
		uv_coord[0] = asin(cylNorm[0]) / PI + 0.5;
		uv_coord[1] = (length(P) / cyl_half_height)*0.25+0.75;
	}
	cylNorm = cylNorm*cyl_norm_mat;

	return 1;

}





int castRaytoLight(vec3 ray_origin,vec3 lightPos,int CastId)
{
	vec3			ray_direction;
	vec3			ray_inv_direction;
	int				intersect;
	float			distFin = 1000000.0;


	ray_direction			=	normalize(lightPos-ray_origin);
	ray_inv_direction		=	1.0/ray_direction;
	intersect				=	0;

	for (int i = 0; i<32; i++)
	{
		if (i >= numboxes)break;
		int  item_idx,item_type,item_ID;

		getItemInfos	(i,item_type,item_idx,item_ID);
	
		if (CastId!=item_ID)
		{
			if(intersect_ray_box(i,ray_origin,ray_inv_direction)==1)
			{
				if (item_type == 1)
				{
					float			sphere_dist1, sphere_dist2;

					vec3			sphere_norm;

					/*
					vec2			sphere_uv;
					vec3	sphere_center;
					float	sphere_radius;
					mat3		sphere_inv_mat;
					mat3		sphere_mat;
					getSphereInfos(item_idx, sphere_center, sphere_radius, sphere_inv_mat, sphere_mat);
					intersect = Sphere_intersect(sphere_center, sphere_radius, sphere_inv_mat, ray_origin, ray_direction, distFin,sphere_dist1, sphere_dist2, sphere_norm, sphere_uv);
					*/
					intersect = Sphere_intersect(item_idx, ray_origin, ray_direction, distFin, sphere_dist1, sphere_dist2, sphere_norm);
				}
#ifdef USE_CUBE
				else if (item_type == 2)
				{
					float			cube_dist;
					vec3	cubeNorm;
					vec2	uv_coord;
					vec3	cube_center, cube_size;
					mat3	cube_mat;
					int				planeId;

					getCubeInfos(item_idx, cube_center, cube_size, cube_mat);


					intersect = rayIntersectCube(cube_center, cube_size, ray_origin, ray_direction, cube_mat, cubeNorm, uv_coord, planeId, cube_dist);
				}
#endif
				else if (item_type == 3)
				{

						vec3		cyl_norm;
						vec2		cyl_uv;
						vec2		cyl_dist;

						/*
						vec3		cyl_center;
						float		cyl_half_height;
						float		cyl_radius, cyl_sqradius;
						mat3		cyl_inv_mat;
						mat3		cyl_inv_norm_mat;
						mat3		cyl_norm_mat;
						getCylInfos	  (item_idx,cyl_center,cyl_radius,cyl_half_height,cyl_inv_mat,cyl_inv_norm_mat,cyl_norm_mat);
						intersect	=	intersectRayCyl	(ray_origin,ray_direction,cyl_center,cyl_half_height,cyl_radius,cyl_inv_mat,cyl_inv_norm_mat,cyl_dist,cyl_norm,cyl_uv);
						*/
						intersect = intersectRayCyl(item_idx, ray_origin, ray_direction, distFin, cyl_dist, cyl_norm, cyl_uv);
				}

				if(intersect==1)
					return 0;
				
			}
		}
	}
	

	return 1;
}




int castRay(vec3 ray_origin, vec3 ray_direction, vec3 ray_inv_direction, out vec4 pix, out vec3 vecPos, out vec3 normVec, out int matId, inout int CastId)
{
	float			dist_final;
	vec2			minmax;
	float			lightDot;
	int				planeId;
	vec3			cubeNorm;
	int				inCastId;
	int				tid;
	int				nid;
	vec2			uv_coord;
	vec3			Reflect;
	int				col;

	inCastId	=   CastId;
	matId		= -1;
	col			=	0;
	dist_final	=	 1000000000000000.0;
	

	
	if (num_planes>0)
	{
		float denom, distPlane;
		int startPixU, myId;
		vec3  center, norm;

		startPixU   = num_materials * 7 + numboxes * 3 + num_cubes * 6 + num_spheres * 9 + num_cyls * 12;
		myId		= int(getPixTex(startPixU + 2).r);

		if (myId != CastId)
		{
			center = getPixTex(startPixU + 0).rgb;
			norm   = getPixTex(startPixU + 1).rgb;

			// assuming vectors are all normalized
			denom = dot(norm, ray_direction);
			if (abs(denom) > D3_EPSILON)
			{
				vec3		lp0;
				lp0 = center - ray_origin;
				distPlane = dot(lp0, norm) / denom;
				if (distPlane > D3_EPSILON)
				{
					dist_final = distPlane;
					vecPos = ray_origin + ray_direction*dist_final;
					matId   = int(getPixTex(startPixU + 2).g);

					col = 1;
					CastId = myId;
					normVec = norm;

					uv_coord[0] = fract (vecPos[0] * 0.002);
					uv_coord[1] = fract (vecPos[2] * 0.002);
				}
			}
		}
	}
	

	
	for (int i = 0; i<32; i++)
	{
		if (i >= numboxes)break;
		int item_type;
		int item_idx;
		int item_ID;
		
		getItemInfos	(i,item_type,item_idx,item_ID);
		if(inCastId!=item_ID)
		{
			if(intersect_ray_box(i,ray_origin,ray_inv_direction)==1)
			{
				int		startPixU;

				if (item_type == 1)
				{
					vec3		sphere_norm;
					float		sphere_dist1, sphere_dist2;
					/*
					vec2		sphere_uv;
					int			sid;
					vec3		sphere_center;
					float		sphere_radius;
					
					mat3		sphere_inv_mat;
					mat3		sphere_mat;
					getSphereInfos(item_idx, sphere_center, sphere_radius, sphere_inv_mat, sphere_mat);
					if (Sphere_intersect(sphere_center, sphere_radius, sphere_inv_mat, ray_origin, ray_direction, dist_final,sphere_dist1, sphere_dist2, sphere_norm, sphere_uv) == 1)
					{
					*/
					if (Sphere_intersect(item_idx, ray_origin, ray_direction, dist_final, sphere_dist1, sphere_dist2, sphere_norm) == 1)
					{
						startPixU = num_materials * 7 + numboxes * 3 + num_cubes * 6 + item_idx * 9;
						dist_final = sphere_dist1;
						vecPos = ray_origin + ray_direction*dist_final;
						normVec = sphere_norm;
						col = 1;
						CastId = item_ID;
						matId = int(getPixTex(startPixU + 2).g);
						
						//uv_coord = sphere_uv;
					}
				}
#ifdef USE_CUBE
				else if (item_type == 2)
				{
					vec3	cube_center, cube_size;
					vec2	cube_uv;
					mat3	cube_mat;
					float	cube_dist;

					getCubeInfos(item_idx, cube_center, cube_size, cube_mat);

					if (rayIntersectCube(cube_center, cube_size, ray_origin, ray_direction, cube_mat, cubeNorm, cube_uv, planeId, cube_dist) == 1)
					{
						if (cube_dist < dist_final)
						{
							startPixU = num_materials * 7 + numboxes * 3 + (item_idx * 6);
							dist_final = cube_dist;
							vecPos = ray_origin + ray_direction*dist_final;
							normVec = normalize(cubeNorm)*cube_mat;
							col = 1;
							CastId = item_ID;

							matId = int(getPixTex(startPixU + 2).g);
							uv_coord = cube_uv;
						}
					}
				}
#endif
				else if (item_type == 3)
				{
					
					vec3		cyl_norm;
					vec2		cyl_uv;
					vec2		cyl_dist;
					/*
					vec3		cyl_center;
					float		cyl_half_height;
					float		cyl_radius, cyl_sqradius;
					mat3		cyl_inv_mat;
					mat3		cyl_inv_norm_mat;
					mat3		cyl_norm_mat;

					getCylInfos(item_idx, cyl_center, cyl_radius, cyl_half_height, cyl_inv_mat, cyl_inv_norm_mat, cyl_norm_mat);
											
					if (intersectRayCyl(ray_origin, ray_direction, cyl_center, cyl_half_height, cyl_radius, cyl_inv_mat, cyl_inv_norm_mat, cyl_dist, cyl_norm, cyl_uv) == 1)
					{
					*/
					if (intersectRayCyl(item_idx, ray_origin, ray_direction,dist_final, cyl_dist, cyl_norm, cyl_uv) == 1)
					{
						startPixU = num_materials * 7 + numboxes * 3 + num_cubes * 6 + num_spheres * 9 + item_idx * 12;
						dist_final = cyl_dist[0];
						vecPos = ray_origin + ray_direction*dist_final;
						matId = int(getPixTex(startPixU + 2).g);
						col = 1;
						CastId = item_ID;
						uv_coord = cyl_uv;
						normVec = cyl_norm;
					}
				}
			}
		}
	}


	
	/*
	for(int halo_idx=0;halo_idx<num_halos;halo_idx++)
	{
		mat3		sphere_inv_mat;
		vec3		sphere_center;
		vec3		sphere_norm;
		vec2		sphere_uv;
		float		startPixU;
		float		sphere_radius;
		float		sphere_dist1,sphere_dist2;
		int			halo_idx;

		halo_idx		=	0;
		
		startPixU		=	float(numboxes*3+num_cubes*7+num_spheres*10+num_cyls*13+ num_planes * 12+halo_idx*10);

		sphere_center	=		texture2D(boxDataTex,vec2((startPixU+0.0)*invRes,0.0)).rgb;
		sphere_radius	=		texture2D(boxDataTex,vec2((startPixU+1.0)*invRes,0.0)).r;
		sphere_inv_mat	=		mat3(texture2D(boxDataTex,vec2((startPixU+4.0)*invRes,0.0)).rgb,texture2D(boxDataTex,vec2((startPixU+ 5.0)*invRes,0.0)).rgb,texture2D(boxDataTex,vec2((startPixU+ 6.0)*invRes,0.0)).rgb);
		
		
				
		if(Sphere_intersect(sphere_center,sphere_radius,sphere_inv_mat,ray_origin,ray_direction,sphere_dist1,sphere_dist2,sphere_norm,sphere_uv)==1)
		{
			float volume;
			if(sphere_dist1<dist_final)
			{
				volume		=	abs(sphere_dist2-sphere_dist1);
				ddlight		=	volume/150.0;//powf(volume/100.0,100.0);

				if(ddlight<0.0)
					ddlight=0.0;
						
				if(ddlight>1.0)
					ddlight=1.0;
			}
		}
	}
	*/

	if(col==1)
	{
		vec3			lightVec;
		vec3			pixNorm;
		vec2			t_uv_coord;
		
		if (matId>=0)
		{
			getMatTexs (matId, tid, nid);
			

			if (tid>0)
			{
				vec2	uv_pos, uv_scale;
				getTexUv(matId, uv_pos, uv_scale);
			
				t_uv_coord[0] = uv_coord[0] * uv_scale[0]+uv_pos[0];
				t_uv_coord[1] = uv_coord[1] * uv_scale[1]+uv_pos[1];
				pix			=   texture2D		(texture1,t_uv_coord);
			}
			else
				pix = getMatColor(matId);
				

			/*
			if(nid>0)
			{
				vec2		uv_pos, uv_scale;
				vec3		axis_1,axis_2;
				vec3		newNorm,tNorm;
				vec2		n_uv_coord;
				vec3		c1,c2;
				vec3		binormal,tangent,nn;
				vec3  	    test_norm;
				float		dist,plane_det;
				mat3		mat;

				getNormUv(matId, uv_pos, uv_scale);

				n_uv_coord[0] = uv_coord[0] * uv_scale[0] + uv_pos[0];
				n_uv_coord[1] = uv_coord[1] * uv_scale[1] + uv_pos[1];
				pixNorm			= texture2D(texture2, n_uv_coord).rgb;

				tNorm[0]		= ((pixNorm[0]-0.5))*2.0;
				tNorm[1]		= ((pixNorm[1]-0.5))*2.0;
				tNorm[2]		= ((pixNorm[2]-0.5))*2.0;
				tNorm			=	normalize(tNorm);

				plane_det		= -dot(normVec,vecPos);
				test_norm		=	vecPos;

				test_norm[0]	=	test_norm[0]+1.0;
				dist			=	dot(test_norm,normVec)+plane_det;

				
				if(abs(dist)<0.1)
				{
					test_norm		=	vecPos;
					test_norm[1]	=	test_norm[1]+1.0;
					dist			=	dot(test_norm,normVec)+plane_det;
				}
				

				tangent[0]		=	test_norm[0]-normVec[0]*dist;
				tangent[1]		=	test_norm[1]-normVec[1]*dist;
				tangent[2]		=	test_norm[2]-normVec[2]*dist;

				tangent			=	normalize	(tangent);
				binormal		=	cross		(normVec, tangent ); 
				binormal		=	normalize	(binormal);
				nn				=	cross		(tangent,binormal ); 

				mat			=	mat3(vec3(tangent[0],binormal[0],normVec[0]),vec3(tangent[1],binormal[1],normVec[1]),vec3(tangent[2],binormal[2],normVec[2]));
				//mat			=	mat3(tangent, binormal, nn);
				newNorm		=	tNorm*mat;
				normVec		=	normalize(newNorm);
			}
			*/
			
		}
		else
			pix = vec4(1.0, 1.0, 1.0, 1.0);

		lightVec		=	lightPos-vecPos;
		lightVec		=	normalize	(lightVec);
		lightDot		=	dot			(normVec,lightVec);
		if(lightDot<0.1)lightDot=0.1;
		
		pix			*= lightDot;
	}
	else
	{
		pix			=	vec4	(textureCube(cubemap,ray_direction));
	}

	
	return col;
}

void main()
{
	vec4			pix;
	vec4			halopix;
	vec3			ray_origin;
	vec3			origin;
	vec3			ray_direction;
	vec3			ray_inv_direction;
	vec3			outPos;

	vec3			normVec;
	vec3			raypos,raydir;

	int				CastId;
	int				origId;
	int				matId;
	int				n;

#ifdef USE_CUBE
	box_dets[0]	=2;
	box_dets[1]	=0;
	box_dets[2]	=2;
	box_dets[3]	=0;
	box_dets[4]	=1;
	box_dets[5]	=1;
	cube_normz[0] = vec3(0.0, 0.0, 1.0);
	cube_normz[1] = vec3(1.0, 0.0, 0.0);
	cube_normz[2] = vec3(0.0, 0.0, -1.0);
	cube_normz[3] = vec3(-1.0, 0.0, 0.0);
	cube_normz[4] = vec3(0.0, 1.0, 0.0);
	cube_normz[5] = vec3(0.0, -1.0, 0.0);
#endif

	origin[0]		=winW/2.0;
	origin[1]		=winH/2.0;
	origin[2]		=400.0;

	raypos[0]		=0.0;
	raypos[1]		=0.0;
	raypos[2]		=-10.0;

	raydir[0]		=(float(gl_FragCoord.x)-origin[0])/winW;
	raydir[1]		=(float(gl_FragCoord.y)-origin[1])/winH;
	raydir[2]		=1.0;
	
	ray_origin		= (raypos)*cameraInvMat+cameraPos;
	ray_direction	= normalize(raydir)*cameraInvNormal;

	
	ray_inv_direction	= 1.0/ray_direction;
	
	origId			=	-1;

		
	
	if (castRay(ray_origin, ray_direction, ray_inv_direction, pix, outPos, normVec, matId, origId) == 1)
	{
		vec3		reflectedVec,refractedVec;
		vec3		invReflect,invRefract;
		vec3		newOut,newNorm;
		vec4		reflPix,refrPix;
		vec4		newPix;
		vec4		pixNew;
		
		float		reflect_fac, refract_fac, refract_density;
		float		shadow;
		float		light;
		float		len;
		vec3		Material;
		
		Material=getMatInfos(matId);

		refract_fac		= Material.g;
		refract_density = Material.b;

		if (refract_fac > 0.0)
		{
			CastId = origId;
			refractedVec = refract(ray_direction, normVec, 1.0, refract_density);
			castRay(outPos, refractedVec, 1.0/refractedVec, refrPix, newOut, newNorm, matId, CastId);
			pix += refrPix*refract_fac;
		}
		/*
		else
			pixNew = pix;
		*/
		
		reflect_fac		= Material.r;
		if (reflect_fac > 0.0)
		{
			CastId			= origId;
			reflectedVec	= reflect(ray_direction,normVec);
			castRay			(outPos, reflectedVec, 1.0 / reflectedVec, reflPix, newOut, newNorm, matId, CastId);
			pix	+= reflPix*reflect_fac;
		}
		
		/*
		shadow			=	1.0;
		
		if(castRaytoLight(outPos,lightPos,origId)==0)
			shadow*=0.5;
		
		pix			=pixNew*shadow;
		*/
	}
	else
	{
		pix = vec4(textureCube(cubemap, ray_direction));
	}
	
	gl_FragColor = pix;
}