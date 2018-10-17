var singleTexture = false;

function getImage(id) {

    for (var n = 0; n < g.scene.images.length; n++) {
        if (g.scene.images[n].id == id)
            return g.scene.images[n];
    }

    return null;
}
function getMaterial(id) {

    for (var n = 0; n < g.scene.material_list.length; n++) {
        if (g.scene.material_list[n].id == id)
            return g.scene.material_list[n];
    }

    return null;
}

function reset_rt(render_texture, size) {
    render_texture.w = size;
    render_texture.h = size;
    render_texture.x_pos = 0;
    render_texture.y_pos = 0;
    render_texture.images = [];
  
}

function add_image_rt(gl, texture, image_id) {
    var newImg = {};
    var image = null;

    for (var n = 0; n < images.length; n++) {
        if (images[n].id == 'tex_' + image_id)
            image = images[n];
    }

    if (image == null)
        return null;

    if (!image.complete)
        return null;

    getImage(image_id).width = image.naturalWidth;
    getImage(image_id).height = image.naturalHeight;

    console.log('add image ' + image_id);
    console.log(image);

    if ((texture.x_pos + image.naturalWidth) > texture.w) {
        texture.x_pos = 0;
        texture.y_pos += image.naturalHeight;
    }
    newImg.img_id = image_id;
    newImg.x_pos = texture.x_pos;
    newImg.y_pos = texture.y_pos;
    texture.images.push(newImg);

    gl.texSubImage2D(gl.TEXTURE_2D, 0, newImg.x_pos, newImg.y_pos, gl.RGBA, gl.UNSIGNED_BYTE, image);

    texture.x_pos += image.naturalWidth;

    console.log('new image');
    console.log(newImg);

    return newImg;
}

function get_texture(gl, image_id)
{
    var n;
    var newtex;

    for (n = 0; n < images.length; n++) {
        if (images[n].id == 'tex_' + image_id)
            image = images[n];
    }

    for (n = 0; n < g.textures.length; n++) {

        if(g.textures[n].image_id==image_id)
        {
            if (parseInt(image.getAttribute('animated'))==1)
            {
                gl.bindTexture(gl.TEXTURE_2D, g.textures[n].texid);
                gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.REPEAT);
                gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.REPEAT);
                gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
                gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
                gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, gl.RGBA, gl.UNSIGNED_BYTE, image);
                gl.bindTexture(gl.TEXTURE_2D, null);
            }
            return g.textures[n];
        }
    }



    if (image == null)
        return null;

    if (image.getAttribute('mtype') == 'image')
    {
        if (!image.complete) return null;
        getImage(image_id).width = image.naturalWidth;
        getImage(image_id).height = image.naturalHeight;
    }
    else if (image.getAttribute('mtype') == 'video')
    {
        if (!getImage(image_id).ready) return null;
        getImage(image_id).width = 512;
        getImage(image_id).height = 512;
    }
        
    console.log('add image ' + image_id);
    console.log(image);

    newtex = {};

    newtex.texid = gl.createTexture();
    newtex.image_id = image_id;
    newtex.w = getImage(image_id).width;
    newtex.h = getImage(image_id).height;


    gl.bindTexture(gl.TEXTURE_2D, newtex.texid);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.REPEAT);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.REPEAT);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.texImage2D(gl.TEXTURE_2D,0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image);
    gl.bindTexture(gl.TEXTURE_2D, null);

    console.log(newtex);

    g.textures.push(newtex);

    return newtex;
}


function get_image_uv(gl, texture, image_id) {
    var pos = [0, 0], scale = [0, 0];
    var n = 0;
    var newImg;
    var image = getImage(image_id);

    for (n = 0; n < texture.images.length;n++) {
        if (texture.images[n].img_id == image_id) {
            pos[0] = texture.images[n].x_pos / texture.w;
            pos[1] = texture.images[n].y_pos / texture.h;
            scale[0] = image.width / texture.w;
            scale[1] = image.height / texture.h;

            return { "pos": pos, "scale": scale };
        }
    }
    newImg = add_image_rt(gl, texture, image_id);
    if (newImg != null) {
        pos[0] = newImg.x_pos / texture.w;
        pos[1] = newImg.y_pos / texture.h;
        scale[0] = image.width / texture.w;
        scale[1] = image.height / texture.h;
        return { "pos": pos, "scale": scale };
    }

    return null;
   
}

function add_html_image(id, url) {
    var ext=null;

    if (curfile != null)
    {
        if (curfile.filename)
            ext = curfile.filename.split('.').pop();
        else if (curfile.name)
            ext = curfile.name.split('.').pop();
    }

    if ((ext == 'mp4') || (ext == 'mpg') || (ext == 'mpeg'))
    {
        var video = document.createElement("VIDEO");
        
        video.id = "tex_" + id;
        video.setAttribute('img_id', id);
        video.setAttribute('mtype', 'video');
        video.setAttribute('animated', '1');
        video.width = '128';
        video.height = '128';
        video.src = url;
        video.loop = true;
        video.play();

        video.addEventListener('canplay', function () { var img = getImage(this.getAttribute('img_id')); if (img) img.ready = true; });

        video.addEventListener("click", function () { scene_image_selected(parseInt(this.getAttribute('img_id'))); });
        

        $('#img_list').append(video);
        images.push(video);
    }
    else
    {
        var img = new Image();
        img.id = "tex_" + id;
        img.setAttribute('img_id', id);


        if (ext == 'gif')
            img.setAttribute('animated', '1');
        else
            img.setAttribute('animated', '0');

        img.setAttribute('mtype', 'image');

        img.src = url;
        img.addEventListener("click", function () { scene_image_selected(parseInt(this.getAttribute('img_id'))); });

        $('#img_list').append(img);

        images.push(img);

    }

   
}

function add_image() {

    for (var n = 0; n < g.scene.images.length; n++) {
        if (g.scene.images[n].dataHash == curfile.dataHash) {
            return g.scene.images[n].id;
        }
    }

    curfile.id = ++g.scene.id_var;
    curfile.url = '/app/Cards/file/' + curfile.dataHash;

    g.scene.images.push(curfile);

    add_html_image(curfile.id, curfile.url);

    return curfile.id;
}


function loadShader_program(gl, vshader, fshader, attribs) {
    // create our shaders
    var vertexShader = loadShader(gl, vshader);
    var fragmentShader = loadShader(gl, fshader);


    // Compile the shader
    gl.compileShader(vertexShader);
    var compiled = gl.getShaderParameter(vertexShader, gl.COMPILE_STATUS);
    if (!compiled) {
        // Something went wrong during compilation; get the error
        alert('vert :' + gl.getShaderInfoLog(vertexShader));
        log('vert :' + gl.getShaderInfoLog(vertexShader));
        return null;
    }
    gl.compileShader(fragmentShader);
    // Check the compile status
    var compiled = gl.getShaderParameter(fragmentShader, gl.COMPILE_STATUS);
    if (!compiled) {
        // Something went wrong during compilation; get the error
        alert('frag :' + gl.getShaderInfoLog(fragmentShader));
        log('frag :' + gl.getShaderInfoLog(fragmentShader));
        return null;
    }


    // Create the program object
    var program = gl.createProgram();

    // Attach our two shaders to the program
    gl.attachShader(program, vertexShader);
    gl.attachShader(program, fragmentShader);

    // Bind attributes
    for (var i = 0; i < attribs.length; ++i)
        gl.bindAttribLocation(program, i, attribs[i]);

    // Link the program
    gl.linkProgram(program);

    // Check the link status
    var linked = gl.getProgramParameter(program, gl.LINK_STATUS);
    if (!linked && !gl.isContextLost()) {
        // something went wrong with the link
        var error = gl.getProgramInfoLog(program);
        log("Error in program linking:" + error);
        alert("Error in program linking:" + error);
        alert('vert :' + gl.getShaderInfoLog(vertexShader));
        alert('frag :' + gl.getShaderInfoLog(fragmentShader));
        gl.deleteProgram(program);
        gl.deleteProgram(fragmentShader);
        gl.deleteProgram(vertexShader);

        return null;
    }
    return program;

}


function getObjBounds(obj) {

    obj.bmin = [100000.0, 100000.0, 100000.0];
    obj.bmax = [-100000.0, -100000.0, -100000.0];

    for (var n = 0; n < obj.vtx.length; n++) {

        obj.bmin[0] = Math.min(obj.vtx[n][0], obj.bmin[0]);
        obj.bmin[1] = Math.min(obj.vtx[n][1], obj.bmin[1]);
        obj.bmin[2] = Math.min(obj.vtx[n][2], obj.bmin[2]);

        obj.bmax[0] = Math.max(obj.vtx[n][0], obj.bmax[0]);
        obj.bmax[1] = Math.max(obj.vtx[n][1], obj.bmax[1]);
        obj.bmax[2] = Math.max(obj.vtx[n][2], obj.bmax[2]);
    }


    obj.center = [obj.bmin[0] + (obj.bmax[0] - obj.bmin[0]) / 2.0, obj.bmin[1] + (obj.bmax[1] - obj.bmin[1]) / 2.0, obj.bmin[2] + (obj.bmax[2] - obj.bmin[2]) / 2.0];
}

function scaleObj(obj, toSize) {

    var size = new J3DIVector3(obj.bmax);
    var dimension;

    size.substract(obj.bmin);

    dimension = Math.max(size[0], size[1]);
    dimension = Math.max(dimension, size[2]);

    for (var n = 0; n < obj.vtx.length; n++) {
        obj.vtx[n][0] = (obj.vtx[n][0] - obj.center[0]) * toSize / dimension;
        obj.vtx[n][1] = (obj.vtx[n][1] - obj.center[1]) * toSize / dimension;
        obj.vtx[n][2] = (obj.vtx[n][2] - obj.center[2]) * toSize / dimension;
    }
    obj.bmin[0] = -size[0] / 2.0;
    obj.bmin[1] = -size[1] / 2.0;
    obj.bmin[2] = -size[2] / 2.0;

    obj.bmax[0] = size[0] / 2.0;
    obj.bmax[1] = size[1] / 2.0;
    obj.bmax[2] = size[2] / 2.0;

    obj.center = [0.0, 0.0, 0.0];

    
}

function normalize_vec(v) {
    var mag = Math.sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
    if (mag != 0.0) {
        v[0] = v[0] / mag;
        v[1] = v[1] / mag;
        v[2] = v[2] / mag;
    }
}

function getDir(v1, v2) {
    var v = [v2[0] - v1[0], v2[1] - v1[1], v2[2] - v1[2]];
    normalize_vec(v);

    return v;
}

function compute_biNorms(obj) {

    obj.biNorms = new Array(obj.vtx.length);
    obj.Tangeants = new Array(obj.vtx.length);

    for (var sIdx = 0; sIdx < obj.surfaces.length; sIdx++) {
        var surface = obj.surfaces[sIdx];

        for (var n = 0; n < surface.nTriangles * 3; n += 3) {

            var i1 = surface.faces[n + 0];
            var i2 = surface.faces[n + 1];
            var i3 = surface.faces[n + 2];

            var v1 = obj.vtx[i1];
            var v2 = obj.vtx[i2];
            var v3 = obj.vtx[i3];

            var w1 = surface.texCoords[n + 0];
            var w2 = surface.texCoords[n + 1];
            var w3 = surface.texCoords[n + 2];

            var x1 = v2[0] - v1[0];
            var x2 = v3[0] - v1[0];
            var y1 = v2[1] - v1[1];
            var y2 = v3[1] - v1[1];
            var z1 = v2[2] - v1[2];
            var z2 = v3[2] - v1[2];

            var s1 = w2[0] - w1[0];
            var s2 = w3[0] - w1[0];
            var t1 = w2[1] - w1[1];
            var t2 = w3[1] - w1[1];

            var r = 1.0 / (s1 * t2 - s2 * t1);

            var sdir = [(t2 * x1 - t1 * x2) * r, (t2 * y1 - t1 * y2) * r, (t2 * z1 - t1 * z2) * r];
            var tdir = [(s1 * x2 - s2 * x1) * r, (s1 * y2 - s2 * y1) * r, (s1 * z2 - s2 * z1) * r];

            normalize_vec(sdir);
            normalize_vec(tdir);

            for (var i = 0; i < 3; i++) {
                var vi = surface.faces[n + i];

                if (typeof obj.biNorms[vi] == 'undefined') {
                    obj.biNorms[vi] = sdir;
                    obj.Tangeants[vi] = tdir;
                }
                else {
                    obj.biNorms[vi][0] += sdir[0];
                    obj.biNorms[vi][1] += sdir[1];
                    obj.biNorms[vi][2] += sdir[2];

                    obj.Tangeants[vi][0] += tdir[0];
                    obj.Tangeants[vi][1] += tdir[1];
                    obj.Tangeants[vi][2] += tdir[2];
                }
            }
        }
    }

    for (var n = 0; n < obj.vtx.length; n++) {
        normalize_vec(obj.biNorms[n]);
        normalize_vec(obj.Tangeants[n]);
    }
}

function buildobjarray(gl, obj) {


    if (obj.vertices != null)
        return true;

    if (typeof obj.surfaces == 'undefined')
        return false;

    if (obj.surfaces.length <= 0)
        return false;

    getObjBounds(obj);

    $('#status').append('Building obj buffer .<br/>');

    var total_tri = 0;

    for (var sIdx = 0; sIdx < obj.surfaces.length; sIdx++) {
        var surface = obj.surfaces[sIdx];
        surface.firstTri = total_tri;
        total_tri += surface.nTriangles;
    }

    obj.vertSize = 3 + 3 + 2;

    if (obj.biNorms)
        obj.vertSize += 6;

    obj.vertices = new Float32Array(total_tri * 3 * obj.vertSize);

    total_tri = 0

    for (var sIdx = 0; sIdx < obj.surfaces.length; sIdx++) {
        var surface = obj.surfaces[sIdx];

        for (var n = 0; n < surface.nTriangles * 3; n++) {
            var vidx = surface.faces[n];
            var aidx = (total_tri * 3 + n) * obj.vertSize;

            obj.vertices[aidx + 0] = obj.vtx[vidx][0];
            obj.vertices[aidx + 1] = obj.vtx[vidx][1];
            obj.vertices[aidx + 2] = obj.vtx[vidx][2];

            obj.vertices[aidx + 3] = surface.norms[n][0];
            obj.vertices[aidx + 4] = surface.norms[n][1];
            obj.vertices[aidx + 5] = surface.norms[n][2];

            obj.vertices[aidx + 6] = surface.texCoords[n][0];
            obj.vertices[aidx + 7] = 1.0 - surface.texCoords[n][1];


            if (obj.biNorms) {
                obj.vertices[aidx + 8] = obj.biNorms[vidx][0];
                obj.vertices[aidx + 9] = obj.biNorms[vidx][1];
                obj.vertices[aidx + 10] = obj.biNorms[vidx][2];

                obj.vertices[aidx + 11] = obj.Tangeants[vidx][0];
                obj.vertices[aidx + 12] = obj.Tangeants[vidx][1];
                obj.vertices[aidx + 13] = obj.Tangeants[vidx][2];
            }
        }
        total_tri += surface.nTriangles;
    }

    if (obj.buffer == null)
        obj.buffer = gl.createBuffer();

    gl.bindBuffer(gl.ARRAY_BUFFER, obj.buffer);
    gl.bufferData(gl.ARRAY_BUFFER, obj.vertices, gl.STATIC_DRAW);
    gl.bindBuffer(gl.ARRAY_BUFFER, null);

    $('#status').append('Built obj buffer .<br/>');

    return true;
}



function newSurface(mat_id) {
    var newSurf = {};

    newSurf.material_id = mat_id;
    newSurf.nTriangles = 0;
    newSurf.faces = new Array();
    newSurf.norms = new Array();
    newSurf.texCoords = new Array();

    return newSurf;
}

function newMat(name, color, tex_id, norm_id) {
    var newMat = {};

    newMat.id = ++g.scene.id_var;
    newMat.name = name;
    newMat.color = color;
    newMat.texture_id = tex_id;
    newMat.normalmap_id = norm_id;
    newMat.reflect = 0.0;
    newMat.refract = 0.0;
    newMat.refract_density = 0.0;
    g.scene.material_list.push(newMat);
    return newMat.id;
}

function makeFloor(size, tiles, height, mat_id) {

    var floor = {};
    var x, y;
    var stepx, stepy;
    var nvtx, totvtx;
    var rowSz;
    floor.name = 'floor';
    floor.scale = [1.0, 1.0, 1.0];
    floor.pos = [0.0, 0.0, 0.0];
    totvtx = parseInt((tiles+1) * (tiles+1));
    floor.vtx = new Array(totvtx);
    floor.surfaces = new Array(1);

    floor.biNorms = null;
    floor.Tangeants = null;

    floor.vertices = null;
    floor.buffer = null;

    
    floor.bmin = [-size[0] / 2.0, height, -size[1] / 2.0];
    floor.bmax = [size[0] / 2.0, height, size[1] / 2.0];
    floor.center = [floor.bmin[0] + (floor.bmax[0] - floor.bmin[0]) / 2.0, floor.bmin[1] + (floor.bmax[1] - floor.bmin[1]) / 2.0, floor.bmin[2] + (floor.bmax[2] - floor.bmin[2]) / 2.0];

    floor.surfaces[0] = newSurface(mat_id);

    stepx = (floor.bmax[0] - floor.bmin[0]) / parseFloat(tiles);
    stepy = (floor.bmax[2] - floor.bmin[2]) / parseFloat(tiles);

    floor.surfaces[0].nTriangles = 2 * tiles * tiles;

    nvtx = 0;
    rowSz = parseInt(tiles + 1);

    for (y = floor.bmin[2]; y <= floor.bmax[2]; y += stepy) {

        for (x = floor.bmin[0]; x <= floor.bmax[0]; x += stepx) {

            floor.vtx[nvtx] = [x, height, y];
            
            if ((x < floor.bmax[0])&&(y < floor.bmax[2])) {
                floor.surfaces[0].faces.push(nvtx);
                floor.surfaces[0].faces.push(nvtx + 1);
                floor.surfaces[0].faces.push(nvtx + rowSz + 1);

                floor.surfaces[0].faces.push(nvtx + rowSz + 1);
                floor.surfaces[0].faces.push(nvtx + rowSz );
                floor.surfaces[0].faces.push(nvtx);

                floor.surfaces[0].norms.push([0.0, 1.0, 0.0]);
                floor.surfaces[0].norms.push([0.0, 1.0, 0.0]);
                floor.surfaces[0].norms.push([0.0, 1.0, 0.0]);

                floor.surfaces[0].norms.push([0.0, 1.0, 0.0]);
                floor.surfaces[0].norms.push([0.0, 1.0, 0.0]);
                floor.surfaces[0].norms.push([0.0, 1.0, 0.0]);

                floor.surfaces[0].texCoords.push([0.1, 0.1]);
                floor.surfaces[0].texCoords.push([0.1, 0.9]);
                floor.surfaces[0].texCoords.push([0.9, 0.9]);

                floor.surfaces[0].texCoords.push([0.9, 0.9]);
                floor.surfaces[0].texCoords.push([0.9, 0.1]);
                floor.surfaces[0].texCoords.push([0.1, 0.1]);
            }
            nvtx++;
        }
    }

    return floor;

}

function splitSurface(obj, surf_idx, max) {
    var surface = obj.surfaces[surf_idx];

    if (surface.nTriangles <= max)
        return;

    var newSurf = newSurface(surface.material_id);
    obj.surfaces.push(newSurf);

    while (surface.nTriangles > max) {
        for (var n = 0; n < 3; n++) {
            var vert;

            vert = surface.faces.pop();
            newSurf.faces.push(vert);

            if ((surface.norms != null) && (surface.norms.length > 0)) {
                vert = surface.norms.pop();
                newSurf.norms.push(vert);
            }

            if ((surface.texCoords != null) && (surface.texCoords.length > 0)) {
                vert = surface.texCoords.pop();
                newSurf.texCoords.push(vert);
            }
        }

        newSurf.nTriangles++;
        surface.nTriangles--;

        if (newSurf.nTriangles >= max) {
            var newSurf = newSurface(surface.material_id);
            obj.surfaces.push(newSurf);
        }
    }

}




function renderobj(gl, obj, time) {
    var matrix = [];
    var useCubeMap;

    
    if (typeof obj == 'undefined')
        return;


    if (!obj.buffer) {
        if (!buildobjarray(gl, obj))
            return;
    }

    // Bind the texture to use

    if (g.cubeMaptexID != null) {
        gl.uniform1i(g.cubMaploc, 2);
        gl.activeTexture(gl.TEXTURE2);
        gl.bindTexture(gl.TEXTURE_CUBE_MAP, g.cubeMaptexID);
        useCubeMap = 1;
    }
    else if((g.scene.floor) && (obj != g.scene.floor))
    {
        if (singleTexture) {
            res = get_image_uv(gl, render_texture, getMaterial(g.scene.floor.surfaces[0].material_id).texture_id);

            gl.activeTexture(gl.TEXTURE0);
            gl.uniform1i(g.floortexloc, 0);

            gl.bindTexture(gl.TEXTURE_2D, render_texture.texid);
            gl.uniform2fv(g.uvPosFloorloc, res.pos);
            gl.uniform2fv(g.uvScaleFloorloc, res.scale);
        }
        else {

            gl.activeTexture(gl.TEXTURE2);
            gl.uniform1i(g.floortexloc, 2);

            var tex = get_texture(gl, getMaterial(g.scene.floor.surfaces[0].material_id).texture_id);

            if (tex != null)
                gl.bindTexture(gl.TEXTURE_2D, tex.texid);
            else
                gl.bindTexture(gl.TEXTURE_2D, null);

            gl.uniform2fv(g.uvPosFloorloc, [0.0, 0.0]);
            gl.uniform2fv(g.uvScaleFloorloc, [1.0, 1.0]);
        }
        useCubeMap = 0;
    }
    
    gl.uniform1i(g.useCubemaploc, useCubeMap);
        

    if ((obj) && (obj.buffer)) {


        gl.bindBuffer(gl.ARRAY_BUFFER, obj.buffer);
        // Enable all of the vertex attribute arrays.
        gl.enableVertexAttribArray(0);
        gl.enableVertexAttribArray(1);
        gl.enableVertexAttribArray(2);
        // Set up all the vertex attributes for vertices, normals and texCoords
        gl.vertexAttribPointer(0, 3, gl.FLOAT, false, obj.vertSize * 4, 0);
        gl.vertexAttribPointer(1, 3, gl.FLOAT, true, obj.vertSize * 4, 3 * 4);
        gl.vertexAttribPointer(2, 2, gl.FLOAT, false, obj.vertSize * 4, 6 * 4);


        gl.bindAttribLocation(g.program, 0, "vPosition");
        gl.bindAttribLocation(g.program, 1, "vNorm");
        gl.bindAttribLocation(g.program, 2, "vUv");



        gl.uniform3fv(g.objPosloc, obj.pos);

        gl.uniform3fv(g.objScaleloc, obj.scale);

        for (var sIdx = 0; sIdx < obj.surfaces.length; sIdx++) {
            var surface = obj.surfaces[sIdx];
            var mat;

            mat = getMaterial(obj.surfaces[sIdx].material_id);
            if (mat != null) {
                var image;
                var res;

                gl.uniform1i(g.tex1loc, 0);
                gl.activeTexture(gl.TEXTURE0);

                if (mat.texture_id > 0) {

                    if (singleTexture)
                    {
                        gl.bindTexture(gl.TEXTURE_2D, render_texture.texid);

                        res = get_image_uv(gl, render_texture, mat.texture_id);

                        gl.uniform2fv(g.uvPosloc, res.pos);
                        gl.uniform2fv(g.uvScaleloc, res.scale);
                    }
                    else {

                        var tex = get_texture(gl, mat.texture_id);

                        if (tex == null)
                            return;

                        

                        gl.bindTexture(gl.TEXTURE_2D, tex.texid);
                        
                        gl.uniform2fv(g.uvPosloc, [0.0,0.0]);
                        gl.uniform2fv(g.uvScaleloc, [1.0, 1.0]);
                    }
                }/*
                else
                    gl.bindTexture(gl.TEXTURE_2D, null);
                    */

                if ((mat.normalmap_id > 0) && (obj.biNorms)) {

                    gl.vertexAttribPointer(3, 3, gl.FLOAT, false, obj.vertSize * 4, 8 * 4);
                    gl.vertexAttribPointer(4, 3, gl.FLOAT, false, obj.vertSize * 4, 11 * 4);

                    gl.enableVertexAttribArray(3);
                    gl.enableVertexAttribArray(4);

                    gl.bindAttribLocation(g.program, 3, "vBinorm");
                    gl.bindAttribLocation(g.program, 4, "vTangeant");


                    if (singleTexture) {
                        gl.bindTexture(gl.TEXTURE_2D, render_texture.texid);

                        res = get_image_uv(gl, render_texture, mat.normalmap_id);
                        gl.uniform2fv(g.uvNMapPosloc, res.pos);
                        gl.uniform2fv(g.uvNMapScaleloc, res.scale);

                        gl.uniform1i(g.normTexloc, 0);
                    }
                    else {

                        gl.activeTexture(gl.TEXTURE1);

                        var tex = get_texture(gl, mat.normalmap_id);

                        if (tex == null)
                            return;

                        

                        gl.bindTexture(gl.TEXTURE_2D, tex.texid);
      
                        gl.uniform2fv(g.uvNMapPosloc, [0.0, 0.0]);
                        gl.uniform2fv(g.uvNMapScaleloc, [1.0, 1.0]);

                        gl.uniform1i(g.normTexloc, 1);
                    }

                    
                    
                    gl.uniform1i(g.useNormMaploc, 1);
                }
                else {
                    gl.disableVertexAttribArray(3);
                    gl.disableVertexAttribArray(4);
                    gl.uniform1i(g.useNormMaploc, 0);

                    if (!singleTexture) {
                        gl.activeTexture(gl.TEXTURE1);
                        gl.bindTexture(gl.TEXTURE_2D, null);
                    }
                }

                gl.uniform1f(g.refl_facloc, mat.reflect);
            }

            
            gl.drawArrays(gl.TRIANGLES, surface.firstTri * 3, surface.nTriangles * 3);



            if ((mat.normalmap_id > 0) && (obj.biNorms)) {
                gl.disableVertexAttribArray(3);
                gl.disableVertexAttribArray(4);


            }
        }

        gl.disableVertexAttribArray(0);
        gl.disableVertexAttribArray(1);
        gl.disableVertexAttribArray(2);
        gl.bindBuffer(gl.ARRAY_BUFFER, null);
    }
}


function load_object(hash)
{
    var url = site_base_url + '/getobj/' + hash;

    console.log('load object "' + hash + '" ' + url);

    return $.ajax({
        url: url,
        contentType: "application/json; charset=utf-8",
        type: "GET",
        dataType: "json"
    });

}


function deleteSceneObjects() {
    if (g.cubeMaptexID != null)
        gl.deleteTexture(g.cubeMaptexID);

    g.cubeMaptexID = null;

    $('#img_list').empty();
    images = new Array();

    if (singleTexture)
    {
        reset_rt(render_texture, g.maxTextureSize);
    }
    else if(g.textures){
        for (var n = 0; n < g.textures.length; n++) {

            if (g.textures[n].texid)
            {
                gl.deleteTexture(g.textures[n].texid);
                g.textures[n].texid = null;
            }
        }
    }

    if (!g.scene)
        return;

    if (g.scene.floor) {
        if (g.scene.floor.buffer != null) {
            gl.deleteBuffer(g.scene.floor.buffer);
            g.scene.floor.buffer = null;
        }
    }

    while (g.scene.objects.length) {
        var obj = g.scene.objects.pop();
        obj.vertices = null;
        if (obj.buffer != null) {
            gl.deleteBuffer(obj.buffer);
            obj.buffer = null;
        }
    }

    g.scene.objects = new Array();
    g.scene.material_list = new Array();
    g.scene.images = new Array();



}
function setFloorTex(fileHash) {
    rpc_call('getappfile', [fileHash], function (data) {
        if (!data.error) {
            var imgId, matId;
            curfile = data.result.file;
            imgId = add_image();

            matId = newMat('floor-' + fileHash, [1.0, 1.0, 1.0], imgId, 0);

            g.scene.floor.surfaces[0].material_id = matId;

        }
    });
}

function makeFloorTexSelect(divname,texs,selected)
{
    var select = document.getElementById(divname);

    if (select == null)
        return;

    for (var n = 0; n < texs.length; n++)
    {
        var opt = document.createElement('option');
        var keys = Object.getOwnPropertyNames(texs[n]);
        var key = keys.pop();

        opt.text = key;
        opt.value = texs[n][key];

        if (opt.value == selected)
        {
            opt.setAttribute('selected', 'selected');
        }
        select.add(opt);
    }

  

}