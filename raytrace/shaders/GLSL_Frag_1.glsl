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
	cylNorm = normalize(cylNorm*cyl_norm_mat);

	return 1;

}



 int castRaytoLight(vec3 ray_origin, vec3 lightPos, int CastId)
 {
	 vec3			ray_direction;
	 vec3			ray_inv_direction;
	 int				intersect;
	 float			distFin = 1000000.0;


	 ray_direction = normalize(lightPos - ray_origin);
	 ray_inv_direction = 1.0 / ray_direction;
	 intersect = 0;

	 for (int i = 0; i<8; i++)
	 {
		 if (i >= numboxes)break;
		 int  item_idx, item_type, item_ID;

		 getItemInfos(i, item_type, item_idx, item_ID);

		 if (CastId != item_ID)
		 {
			 if (intersect_ray_box(i, ray_origin, ray_inv_direction) == 1)
			 {
				 if (item_type == 3)
				 {
					 vec3		cyl_norm;
					 vec2		cyl_uv;
					 vec2		cyl_dist;

					 intersect = intersectRayCyl(item_idx, ray_origin, ray_direction, distFin, cyl_dist, cyl_norm, cyl_uv);
				 }

				 if (intersect == 1)
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
	

	
	for (int i = 0; i<8; i++)
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

				if (item_type == 3)
				{					
					vec3		cyl_norm;
					vec2		cyl_uv;
					vec2		cyl_dist;

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

	if(col==1)
	{
		vec3			lightVec;
		vec3			pixNorm;
		vec2			t_uv_coord;
		
		if (matId>=0)
		{
			getMatTexs (matId, tid, nid);
			

			if (tid<128)
			{
				vec2	uv_pos, uv_scale;
				getTexUv(matId, uv_pos, uv_scale);
			
				t_uv_coord[0] = uv_coord[0] * uv_scale[0]+uv_pos[0];
				t_uv_coord[1] = uv_coord[1] * uv_scale[1]+uv_pos[1];
				pix			=   texture2D		(texture1,t_uv_coord);
			}
			else
				pix = getMatColor(matId);

			if (nid<128)
			{
				vec2		uv_pos, uv_scale;
				vec3		axis_1, axis_2;
				vec3		newNorm, tNorm;
				vec2		n_uv_coord;
				vec3		c1, c2;
				vec3		binormal, tangent, nn;
				vec3  	    test_norm;
				float		dist, plane_det;
				mat3		mat;

				getNormUv(matId, uv_pos, uv_scale);

				n_uv_coord[0] = uv_coord[0] * uv_scale[0] + uv_pos[0];
				n_uv_coord[1] = uv_coord[1] * uv_scale[1] + uv_pos[1];
				pixNorm = texture2D(texture2, n_uv_coord).rgb;

				tNorm[0] = ((pixNorm[0] - 0.5))*2.0;
				tNorm[1] = ((pixNorm[1] - 0.5))*2.0;
				tNorm[2] = ((pixNorm[2] - 0.5))*2.0;
				tNorm = normalize(tNorm);

				plane_det = -dot(normVec, vecPos);
				test_norm = vecPos;

				test_norm[0] = test_norm[0] + 1.0;
				dist = dot(test_norm, normVec) + plane_det;


				if (abs(dist)<0.1)
				{
					test_norm = vecPos;
					test_norm[1] = test_norm[1] + 1.0;
					dist = dot(test_norm, normVec) + plane_det;
				}


				tangent[0] = test_norm[0] - normVec[0] * dist;
				tangent[1] = test_norm[1] - normVec[1] * dist;
				tangent[2] = test_norm[2] - normVec[2] * dist;

				tangent = normalize(tangent);
				binormal = cross(normVec, tangent);
				binormal = normalize(binormal);
				nn = cross(tangent, binormal);

				mat = mat3(vec3(tangent[0], binormal[0], normVec[0]), vec3(tangent[1], binormal[1], normVec[1]), vec3(tangent[2], binormal[2], normVec[2]));
				//mat			=	mat3(tangent, binormal, nn);
				newNorm = tNorm*mat;
				normVec = normalize(newNorm);
			}
							
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
	origId				=	-1;

	if (castRay(ray_origin, ray_direction, ray_inv_direction, pix, outPos, normVec, matId, origId) == 1)
	{
		float shadow = 1.0;

		if (castRaytoLight(outPos, lightPos, origId) == 0)
			shadow *= 0.5;

		pix *= shadow;
	}
	else
		pix = vec4(textureCube(cubemap, ray_direction));

	
	gl_FragColor = pix;
}