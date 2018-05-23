var g = {};
var images = [];
var ct = 0;
var imgs = [];
var vtx_attribs = ["vPosition"];
var render_texture1 = {};
var render_texture2 = {};
var gl = {};
var buffer;
var byteArray;
var dataview;
function rt_api_call(in_method, in_params, in_success) {
    $.ajax({
        url: '/rt/' + in_method + in_params,
        type: "GET",
        async: true,
        dataType: "json",
        success: in_success,
        error: function (err) { alert("json api error"); }
    });
}

function newAABB(min, max, type, idx) {
    var AABOX = {};
    AABOX.min = min;
    AABOX.max = max;
    AABOX.type = type;
    AABOX.idx = idx;
    g.bbox_list.push(AABOX);
    return AABOX;
}

function get_material_idx(Scene, matId) {
    for (var n = 0; n < Scene.material_list.length; n++) {
        if (Scene.material_list[n].id == matId)
            return n;
    }
    return -1;
}

function jsonToOgl3x3(mat) {
    var outMat = [];
    for (var col = 0; col < 3; col++) {
        for (var row = 0; row < 3; row++) {
            outMat[3 * row + col] = parseFloat(mat[col][row]);
        }
    }
    return outMat;
}
function add_image(ctx, texture, image_id) {
    if (image_id >= imgs.length) return null;
    if (!images[image_id].complete) return null;
    
    var image = imgs[image_id];
    var newImg = {};
    if ((texture.x_pos + image.width) > texture.w) {
        texture.x_pos = 0;
        texture.y_pos += image.height;
    }

    newImg.img_id = image_id;
    newImg.x_pos = texture.x_pos;
    newImg.y_pos = texture.y_pos;
    texture.images.push(newImg);

    ctx.activeTexture(texture.tex_unit);
    ctx.bindTexture(ctx.TEXTURE_2D, texture.texid);
    ctx.texSubImage2D(ctx.TEXTURE_2D, 0, newImg.x_pos, newImg.y_pos, ctx.RGBA, ctx.UNSIGNED_BYTE, images[image_id]);
    ctx.bindTexture(ctx.TEXTURE_2D, null);
    //loadRGBTexture(texture->texid, texture->images[texture->n_images].x_pos, texture->images[texture->n_images].y_pos, image->w, image->h, image->pixels);
    texture.x_pos += image.width;
    return newImg;

}
function get_image_uv(ctx, texture, image_id) {
    var pos = [0, 0], scale = [0, 0];
    var n = 0;
    var newImg;

    

    while (n < texture.images.length) {

        
        if (texture.images[n].img_id == image_id) {
            pos[0] = texture.images[n].x_pos / texture.w;
            pos[1] = texture.images[n].y_pos / texture.h;
            scale[0] = imgs[image_id].width / texture.w;
            scale[1] = imgs[image_id].height / texture.h;
            return { "pos": pos, "scale": scale };
        }
        n++;
    }
    newImg = add_image(ctx, texture, image_id);
    if (newImg != null) {
        pos[0] = newImg.x_pos / texture.w;
        pos[1] = newImg.y_pos / texture.h;
        scale[0] = imgs[image_id].width / texture.w;
        scale[1] = imgs[image_id].height / texture.h;

        


    }
    return { "pos": pos, "scale": scale };

}

function hex2dig(d) {
    return ("00" + (+d).toString(16)).slice(-2);
}


function updtMatData(ctx, Scene) {
    var n = 0;

    for (n = 0; n < Scene.material_list.length; n++) {
        var pos = [0.0, 0.0], scale = [1.0, 1.0];
        var material = Scene.material_list[n];


        if (typeof material.texture_id == "number")
            g.boxData[n * 21 + 0] = material.texture_id;
        else
            g.boxData[n * 21 + 0] = 128.0;

        if (typeof material.normalmap_id == "number")
            g.boxData[n * 21 + 1] = material.normalmap_id;
        else
            g.boxData[n * 21 + 1] = 128.0;
        

        g.boxData[n * 21 + 2] = 0.0;

        g.boxData[n * 21 + 3] = material.color[0] / 255.0;
        g.boxData[n * 21 + 4] = material.color[1] / 255.0;
        g.boxData[n * 21 + 5] = material.color[2] / 255.0;

        g.boxData[n * 21 + 6] = material.reflect;
        g.boxData[n * 21 + 7] = material.refract;
        g.boxData[n * 21 + 8] = material.refract_density;


        if (typeof material.texture_id =='number') {
            if (render_texture1.texid != null) {
                var res;
                res = get_image_uv(ctx, render_texture1, material.texture_id);
                pos = res.pos;
                scale = res.scale;
            }
        }
        g.boxData[n * 21 + 9] = pos[0];
        g.boxData[n * 21 + 10] = pos[1];
        g.boxData[n * 21 + 11] = 0.0;

        g.boxData[n * 21 + 12] = scale[0];
        g.boxData[n * 21 + 13] = scale[1];
        g.boxData[n * 21 + 14] = 0.0;


        if (typeof material.normalmap_id == 'number' ) {
            if (render_texture2.texid != null) {
                var res;
                res = get_image_uv(ctx, render_texture2, material.normalmap_id);
                pos = res.pos;
                scale = res.scale;
            }
        }


        g.boxData[n * 21 + 15] = pos[0];
        g.boxData[n * 21 + 16] = pos[1];
        g.boxData[n * 21 + 17] = 0.0;

        g.boxData[n * 21 + 18] = scale[0];
        g.boxData[n * 21 + 19] = scale[1];
        g.boxData[n * 21 + 20] = 0.0;

    }
}
function getGeomData(ctx, Scene) {
    var n = 0;
    var boxData = [];

    if (typeof Scene.material_list == 'undefined') return;

    for (n = 0; n < Scene.material_list.length; n++) {
        var pos = [0.0, 0.0], scale = [1.0, 1.0];
        var material = Scene.material_list[n];


        if (typeof material.texture_id == "number")
            boxData.push(material.texture_id);
        else
            boxData.push(128.0);

        if (typeof material.normalmap_id == "number")
            boxData.push(material.normalmap_id);
        else
            boxData.push(128.0);



        boxData.push(0.0);

        boxData.push(material.color[0] / 255.0);
        boxData.push(material.color[1] / 255.0);
        boxData.push(material.color[2] / 255.0);

        boxData.push(material.reflect);
        boxData.push(material.refract);
        boxData.push(material.refract_density);

        if (typeof material.texture_id == 'number') {
            if (render_texture1.texid != null) {
                var res;
                res = get_image_uv(ctx, render_texture1, material.texture_id);
                pos = res.pos;
                scale = res.scale;
            }
        }

        boxData.push(pos[0]);
        boxData.push(pos[1]);
        boxData.push(0.0);

        boxData.push(scale[0]);
        boxData.push(scale[1]);
        boxData.push(0.0);


        if (typeof material.normalmap_id == 'number') {
            if (render_texture2.texid != null) {
                var res;
                res = get_image_uv(ctx, render_texture2, material.normalmap_id);
                pos = res.pos;
                scale = res.scale;
            }
        }


        boxData.push(pos[0]);
        boxData.push(pos[1]);
        boxData.push(0.0);

        boxData.push(scale[0]);
        boxData.push(scale[1]);
        boxData.push(0.0);

    }

    n = 0;
    while (n < g.bbox_list.length) {

        boxData.push(g.bbox_list[n].min[0]);
        boxData.push(g.bbox_list[n].min[1]);
        boxData.push(g.bbox_list[n].min[2]);

        boxData.push(g.bbox_list[n].max[0]);
        boxData.push(g.bbox_list[n].max[1]);
        boxData.push(g.bbox_list[n].max[2]);

        boxData.push(g.bbox_list[n].type);
        boxData.push(g.bbox_list[n].idx);
        boxData.push(0.0);
        n++;
    }
    for (n = 0; n < Scene.cube_list.length; n++) {
        var cube = Scene.cube_list[n];

        boxData.push(cube.center[0]);
        boxData.push(cube.center[1]);
        boxData.push(cube.center[2]);

        boxData.push(cube.size[0]);
        boxData.push(cube.size[1]);
        boxData.push(cube.size[2]);

        boxData.push(cube.id);
        boxData.push(get_material_idx(g.scene, cube.material_id));
        boxData.push(0.0);

        boxData = boxData.concat(jsonToOgl3x3(cube.mat));
    }


    for (n = 0; n < Scene.sphere_list.length; n++) {
        var sphere = Scene.sphere_list[n];

        boxData.push(sphere.center[0]);
        boxData.push(sphere.center[1]);
        boxData.push(sphere.center[2]);

        boxData.push(sphere.sq_radius);
        boxData.push(sphere.radius);
        boxData.push(0.0);

        boxData.push(sphere.id);
        boxData.push(sphere.material_idx);
        boxData.push(0.0);

        boxData = boxData.concat(jsonToOgl3x3(sphere.imat));
        boxData = boxData.concat(jsonToOgl3x3(sphere.mat));

    }
    for (n = 0; n < Scene.cylinder_list.length; n++) {
        var cyl = Scene.cylinder_list[n];

        boxData.push(cyl.center[0]);
        boxData.push(cyl.center[1]);
        boxData.push(cyl.center[2]);

        boxData.push(cyl.radius * cyl.radius);
        boxData.push(cyl.half_height);
        boxData.push(cyl.radius);

        boxData.push(cyl.id);
        boxData.push(cyl.material_idx);
        boxData.push(0);

        boxData = boxData.concat(jsonToOgl3x3(cyl.imat));
        boxData = boxData.concat(jsonToOgl3x3(cyl.inmat));
        boxData = boxData.concat(jsonToOgl3x3(cyl.nmat));

    }
    for (n = 0; n < Scene.plane_list.length; n++) {
        var plane = Scene.plane_list[n];


        boxData.push(plane.center[0]);
        boxData.push(plane.center[1]);
        boxData.push(plane.center[2]);

        boxData.push(plane.norm[0]);
        boxData.push(plane.norm[1]);
        boxData.push(plane.norm[2]);

        boxData.push(plane.id);

        boxData.push(get_material_idx(g.scene, plane.material_id));
        boxData.push(0);
    }
    return new Float32Array(boxData);
}

function loadUniforms(ctx, list) {
    if (g.program == null) return;
    var keys = Object.keys(list);
    for (var i = 0; i < keys.length; i++) {
        var uniformID = ctx.getUniformLocation(g.program, keys[i]);
        if (uniformID == null) {
            console.log("failed to load uniform : '" + keys[i] + "'")
            continue;
        }
        if (typeof list[keys[i]] == "number") {
            if ((keys[i] == 'PI') || (keys[i] == 'D3_EPSILON') || (keys[i] == 'winW') || (keys[i] == 'winH')) {
                ctx.uniform1f(uniformID, list[keys[i]]);
            }
            else
                ctx.uniform1i(uniformID, list[keys[i]]);
        }
        else if (Array.isArray(list[keys[i]])) {
            var arr = list[keys[i]];
            if (typeof arr[0] == 'number') {
                if (arr.length == 3)
                    ctx.uniform3fv(uniformID, new Float32Array(arr));
            }
            else {

                gl.uniformMatrix3fv(uniformID, false, jsonToOgl3x3(arr));
            }
        }
        else {
            console.log('unknown : ' + keys[i] + ' ' + typeof list[keys[i]]);
        }
    }
    return 1;
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





function copyBoxesToTex(ctx) {
    if (g.float_texture_ext == null) return;
    if (g.boxData == null) return;
    if (g.tex_up_to_date == false) {
        ctx.activeTexture(ctx.TEXTURE0);
        ctx.bindTexture(ctx.TEXTURE_2D, g.boxDataTexId);
        ctx.texSubImage2D(ctx.TEXTURE_2D, 0, 0, 0, g.boxData.length / 3, 1, ctx.RGB, ctx.FLOAT, g.boxData);
        ctx.bindTexture(ctx.TEXTURE_2D, null);
        g.tex_up_to_date = true;
    
    }
}


function rayTracePicture(gl, time) {
    var matrix = [];


    copyBoxesToTex(gl);



    if (g.scene.cubemap.length == 6) {
        gl.activeTexture(gl.TEXTURE1);

        if ((g.cubeMaptexID == null) && (ct >= imgs.length)) {
            g.max_cm = gl.getParameter(gl.MAX_CUBE_MAP_TEXTURE_SIZE);
            g.cubeMaptexID = gl.createTexture();

            gl.activeTexture(gl.TEXTURE1);
            gl.bindTexture(gl.TEXTURE_CUBE_MAP, g.cubeMaptexID);
            var targets = [
               gl.TEXTURE_CUBE_MAP_POSITIVE_X, gl.TEXTURE_CUBE_MAP_NEGATIVE_X,
               gl.TEXTURE_CUBE_MAP_POSITIVE_Y, gl.TEXTURE_CUBE_MAP_NEGATIVE_Y,
               gl.TEXTURE_CUBE_MAP_POSITIVE_Z, gl.TEXTURE_CUBE_MAP_NEGATIVE_Z
            ];

            gl.texParameteri(gl.TEXTURE_CUBE_MAP, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
            gl.texParameteri(gl.TEXTURE_CUBE_MAP, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
            gl.texParameteri(gl.TEXTURE_CUBE_MAP, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
            gl.texParameteri(gl.TEXTURE_CUBE_MAP, gl.TEXTURE_MIN_FILTER, gl.LINEAR);

            for (var j = 0; j < 6; j++) {
                gl.texImage2D(targets[j], 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, images[g.scene.cubemap[i]]);
            }
            gl.generateMipmap(gl.TEXTURE_CUBE_MAP);
            gl.bindTexture(gl.TEXTURE_CUBE_MAP, null);
        }
    }





    // Bind the texture to use
    gl.uniform1i(g.boxDataTexloc, 0);
    gl.activeTexture(gl.TEXTURE0);
    gl.bindTexture(gl.TEXTURE_2D, g.boxDataTexId);

    gl.uniform1i(g.cubMaploc, 1);
    gl.activeTexture(gl.TEXTURE1);
    gl.bindTexture(gl.TEXTURE_CUBE_MAP, g.cubeMaptexID);

    gl.uniform1i(g.texture1loc, 2);
    gl.activeTexture(render_texture1.tex_unit);
    gl.bindTexture(gl.TEXTURE_2D, render_texture1.texid);

    gl.uniform1i(g.texture2loc, 3);
    gl.activeTexture(render_texture2.tex_unit);
    gl.bindTexture(gl.TEXTURE_2D, render_texture2.texid);

    gl.uniform1f(g.invResloc, 1.0 / 1024.0);

    // Enable all of the vertex attribute arrays.
    gl.enableVertexAttribArray(0);
    gl.disableVertexAttribArray(1);
    gl.disableVertexAttribArray(2);

    // Set up all the vertex attributes for vertices, normals and texCoords
    gl.bindBuffer(gl.ARRAY_BUFFER, g.rt_plane.vertexObject);
    gl.vertexAttribPointer(0, 3, gl.FLOAT, false, 0, 0);

    // Bind the index array
    gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, g.rt_plane.indexObject);


    g.mvpMatrix.load(g.perspectiveMatrix);
    g.mvpMatrix.setUniform(gl, g.matModProjloc, false);

    gl.drawElements(gl.TRIANGLES, g.rt_plane.numIndices, gl.UNSIGNED_BYTE, 0);
}
function update_texscene() {

    var req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // Typical action to be performed when the document is ready:
            var c = document.getElementById('gl_canvas');
            var resp = this.responseText;

            for (var i = 0; i < resp.length; i++) {
                byteArray[i] = resp.charCodeAt(i) & 0xff;
            }

            var flen = parseInt(resp.length / 4);

            

            // Copy floats
            for (var i = g.scene.material_list.length * 21; i < flen; i++) {
                g.boxData[i] = dataview.getFloat32(i * 4, true);
            }
            //g.boxData = newData;
            g.tex_up_to_date = false;
             setTimeout(update_texscene, 100);
            //requestId = window.requestAnimFrame(f, c);
            //setTimeout(f, 40);
        }
    };
    req.open('GET', '/rt/get_scene_tex/'+scene_id, true);
    req.overrideMimeType('text\/plain; charset=x-user-defined');
    req.send(null);
}
function update_scene() {

    $('#status').append('Dowloading scene data ... <br/>');

    rt_api_call('get_scene_data', '/'+scene_id, function (data) {
        var c = document.getElementById('gl_canvas');
        g.bbox_list = new Array();
        for (i = 0; i < data.scene.sphere_list.length; i++) {
            var sp = data.scene.sphere_list[i];
            newAABB(sp.bmin, sp.bmax, 1, sp.idx);
        }
        for (i = 0; i < data.scene.cube_list.length; i++) {
            var cube = data.scene.cube_list[i];
            newAABB(cube.bmin, cube.bmax, 2, cube.idx);
        }
        for (i = 0; i < data.scene.cylinder_list.length; i++) {
            var cyl = data.scene.cylinder_list[i];
            newAABB(cyl.bmin, cyl.bmax, 3, cyl.idx);
        }
        g.scene = data.scene;

        $('#status').append('Scene data loaded.<br/>');

        updtMatInfos(g.scene);

        loadUniforms(gl, g.scene.shader_vars);
        g.boxData = getGeomData(gl, g.scene);
        g.tex_up_to_date = false;
        update_texscene();
        requestId = window.requestAnimFrame(f, c);
    });
}

function image_load() {
    ct++;
    $('#status').append(ct + ' images loaded.<br/>');

    if (g.scene != null)
        updtMatData(gl, g.scene);
}


function update_scenes(scenes, scene_id) {
    var n;
    var html = '';

    for (n = 0; n < scenes.length; n++) {
        html += '<div class="scene"><h2><a href="/app/raytrace/page/raytrace.site/draw/' + scenes[n].hash + '" > ' + scenes[n].name + '</a></h2></div>';
    }

    $('#' + scene_id).html(html);

}

function update_shaders(shaders, list_id) {
    var n;
    var html = '';

    for (n = 0; n < shaders.length; n++) {
        $('<option value="' + shaders[n].file + '">' + shaders[n].name + '</option>').appendTo('#' + list_id);
    }

 

}