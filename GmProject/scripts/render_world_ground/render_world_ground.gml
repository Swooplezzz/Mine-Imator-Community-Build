/// render_world_ground()
/// @desc Renders a seemingly infinite plane with a repeated texture.

function render_world_ground()
{
	if (!background_ground_show)
		return 0
	
	if (render_mode = e_render_mode.SCENE_TEST || render_mode = e_render_mode.AO_MASK)
		render_set_uniform_color("uReplaceColor", c_white, 1)
	
	// Blend
	var blend = block_texture_get_blend(background_ground_name, background_ground_tex);
	var iswater = (background_ground_name = "block/water_flow" || background_ground_name = "block/water_still");
	
	// Lightlinking figuring it out !!
	if (render_light_group != null &&
			(render_mode = e_render_mode.HIGH_LIGHT_SPOT ||
			render_mode = e_render_mode.HIGH_LIGHT_POINT||
			render_mode = e_render_mode.HIGH_LIGHT_POINT_SHADOWLESS))
		render_set_uniform("uRenderLight", 0)
	else
		render_set_uniform("uRenderLight", 1)
	
	// Lightlinking figuring it out !!
	if (render_light_group != null &&
			(render_mode = e_render_mode.HIGH_LIGHT_SPOT_DEPTH ||
			render_mode = e_render_mode.HIGH_LIGHT_POINT_DEPTH))
	   return 0;

	// Shading
	render_set_uniform_int("uIsGround", 1)
	render_set_uniform_color("uBlendColor", blend, 1)
	render_set_uniform_color("uGlowColor", c_black, 1)
	render_set_uniform_int("uGlowTexture", 0)
	render_set_uniform_int("uFogShow", app.background_fog_show)
	render_set_uniform_int("uIsWater", iswater)
	render_set_uniform_int("uMaterialFormat", background_ground_tex_material.material_format)
	
	if (background_ground_tex_material = mc_res)
	{
		render_set_uniform("uMetallic", 0)
		render_set_uniform("uRoughness", (iswater && app.project_render_water_reflections ? .07 : 1))
		render_set_uniform("uEmissive", 0)
	}
	else
	{
		render_set_uniform("uMetallic", 0)
		render_set_uniform("uRoughness", 0)
		render_set_uniform("uEmissive", 0)
	}
	
	// Texture
	shader_texture_filter_mipmap = app.project_render_texture_filtering
	
	if (background_ground_ani)
		render_set_texture(background_ground_ani_texture[block_texture_get_frame()])
	else
		render_set_texture(background_ground_texture)
	
	if (background_ground_material_ani)
		render_set_texture(background_ground_ani_texture_material[block_texture_get_frame()], "Material")
	else
		render_set_texture(background_ground_texture_material, "Material")
	
	if (background_ground_normal_ani)
		render_set_texture(background_ground_ani_texture_normal[block_texture_get_frame()], "Normal")
	else
		render_set_texture(background_ground_texture_normal, "Normal")
	
	// Submit ground mesh at an offset from the camera
	var xo, yo;
	xo = (cam_from[X] div 16) * 16
	yo = (cam_from[Y] div 16) * 16
	vbuffer_render(background_ground_vbuffer, point3D(xo, yo, 0), point3D(0, 0, -background_ground_direction + 90))
	
	// Reset
	render_set_uniform_int("uIsGround", 0)
	
	if (iswater)
	{
		render_set_uniform("uRoughness", 1)
		render_set_uniform_int("uIsWater", 0)
	}
	
	shader_texture_filter_mipmap = false
}
