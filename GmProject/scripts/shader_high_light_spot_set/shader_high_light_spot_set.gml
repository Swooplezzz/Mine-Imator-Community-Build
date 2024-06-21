/// shader_high_light_spot_set()

function shader_high_light_spot_set()
{
	render_set_uniform("uEmissive", 0)
	
	render_set_uniform_int("uIsSky", 0)
	render_set_uniform_int("uIsWater", 0)
    render_set_uniform_vec2("uGoboOffset",
							render_gobo_offset[X],
							render_gobo_offset[Y])
	render_set_uniform_vec2("uGoboRepeat",
							render_gobo_repeat[X],
							render_gobo_repeat[Y])
	render_set_uniform("uLightMatrix", render_spot_matrix)
	render_set_uniform("uShadowMatrix", render_shadow_matrix)
	render_set_uniform_vec3("uLightPosition", render_light_from[X], render_light_from[Y], render_light_from[Z])
	render_set_uniform_color("uLightColor", render_light_color, 1)
	render_set_uniform("uLightStrength", render_light_strength)
	render_set_uniform("uLightSpecular", render_light_specular_strength)
	render_set_uniform("uLightSize", render_light_size)
	render_set_uniform("uRenderLight", 1)
	
	render_set_uniform("uLightNear", render_light_near)
	render_set_uniform("uLightFar", render_light_far)
	render_set_uniform("uLightFadeSize", render_light_fade_size)
	render_set_uniform("uLightSpotSharpness", render_light_spot_sharpness)
	
	texture_set_stage(sampler_map[?"uLightGobo"], sprite_get_texture(render_gobo_texture, 0))
	gpu_set_texfilter_ext(sampler_map[?"uLightGobo"], true)
	
	texture_set_stage(sampler_map[?"uDepthBuffer"], surface_get_texture(render_surface_spot_buffer))
	gpu_set_texfilter_ext(sampler_map[?"uDepthBuffer"], true)
}
