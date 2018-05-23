
precision mediump float;
precision mediump int;
void main()
{
    // Transforming The Vertex
    gl_Position			= gl_ModelViewProjectionMatrix * gl_Vertex;
	
}

