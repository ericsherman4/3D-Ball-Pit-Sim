#version 460
// use https://www.realtech-vr.com/home/?page_id=1402 to get the version you have ^

// this looks like a crazy good resource https://thebookofshaders.com/
// this especially looks sick https://thebookofshaders.com/13/

// inigo quilez is apparently a shader god and has a very good youtube channel on shaders.

// mainly following the video https://www.youtube.com/watch?v=3mfvZ-mdtZQ
// but be careful because the syntax is very out of date. see first comment.

// a place for sharing shader code https://www.shadertoy.com/
// he has a lot of good ones as well https://www.kishimisu.art/collection

// to better understand shaders in the context of sfml, read the game dev book.

in vec2 aPos;
out vec4 vertexColor;


void main()
{

	// figure this out took a combo of https://learnopengl.com/Getting-started/Shaders
	// and https://www.youtube.com/watch?v=f4s1h2YETNY


	// it's only showing 0,0 and 0,0 is at the center of the screen
	// aha! I got it.
	// the shader is setup to be from -1 to 1 on both the x and y axis.
	// bottomleft is -1,-1 and topright is 1,1. Cool!

	// should change this to uniform
	// TODO: Test when chaning resolution sizes!! to also be something that's not square!
	// see https://www.youtube.com/watch?v=f4s1h2YETNY for how he did this
	vec2 screen_size = vec2(200.,200.);

	vec2 uv = (aPos*2 - screen_size) / screen_size;
	uv.y = -uv.y;

	gl_Position = vec4(uv, 0.0,1.0);
	vertexColor = vec4(1.0,0.0,0.0,1.0);
}