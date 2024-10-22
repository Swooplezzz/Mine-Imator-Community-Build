/// shader_hue_yiq
/// @desc Applies a YIQ hue shift to pixels

attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 vTexCoord;
varying vec4 vColour;

void main()
{
	vColour = in_Colour;
	vTexCoord = in_TextureCoord;
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}