/// render_set_texture(texture, [type])
/// @arg texture
/// @arg [type]
/// @desc Sets the texture of the currently selected shader.

function render_set_texture(tex, type = "")
{
	var sampler, scalex, scaley;
	sampler = render_shader_obj.sampler_map[?"uTexture" + type]
	scalex = 1
	scaley = 1
	
	if (is_undefined(sampler) || sampler < 0)
		return 0
	
	// Set filter
	var mipactive = (shader_texture_filter_mipmap && type = "") ? mip_on : mip_off;
	
	if (gpu_get_texfilter_ext(sampler) != shader_texture_filter_linear)
		gpu_set_texfilter_ext(sampler, shader_texture_filter_linear)
	
	if (gpu_get_tex_mip_enable() != mipactive)
		gpu_set_tex_mip_enable(mipactive)
	
	// Surface
	if (shader_texture_surface)
	{
		if (surface_exists(tex))
			texture_set_stage(sampler, surface_get_texture(tex))
		else
			texture_set_stage(sampler, 0)
	}
	
	// Sprite texture
	else
	{
		if (sprite_exists(tex))
			texture_set_stage(sampler, sprite_get_texture(tex, 0))
		else
			texture_set_stage(sampler, 0)
	}
	
	gpu_set_texrepeat_ext(sampler, true)
}
