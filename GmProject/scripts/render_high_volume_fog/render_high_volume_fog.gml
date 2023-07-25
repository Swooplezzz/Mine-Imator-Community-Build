///// render_high_glow(basesurf, [falloff])
///// @arg basesurf
///// @arg [falloff]

function render_high_volume_fog(prevsurf, glowfalloff = false)
{
//	var thresholdsurf, bloomsurf, bloomsurftemp, resultsurf, baseradius, bloomstrength;
//	render_surface[0] = surface_require(render_surface[0], render_width, render_height)
//	render_surface[1] = surface_require(render_surface[1], render_width, render_height)
//	render_surface[2] = surface_require(render_surface[2], render_width, render_height)
//	thresholdsurf = render_surface[0]
//	bloomsurf = render_surface[1]
//	bloomsurftemp = render_surface[2]
//	resultsurf = render_high_get_apply_surf()
//	baseradius = ((render_camera.value[e_value.CAM_BLOOM_RADIUS] * 10) * render_height / 500)
//	bloomstrength = 1
	
//	// Filter colors to blur
//	surface_set_target(thresholdsurf)
//	{
//		draw_clear_alpha(c_black, 1)
		
//		render_shader_obj = shader_map[?shader_high_bloom_threshold]
//		with (render_shader_obj)
//		{
//			shader_set(shader)
//			shader_high_bloom_threshold_set()
//		}
//		draw_surface_exists(prevsurf, 0, 0)
//		with (render_shader_obj)
//			shader_clear()
//	}
//	surface_reset_target()
	
//	var glowsurftemp;
//	render_surface[2] = surface_require(render_surface[2], render_width, render_height)
//	glowsurftemp = render_surface[2]

//	// Apply Glow
//	resultsurf = render_high_get_apply_surf()
	
//	surface_set_target(resultsurf)
//	{
//	render_shader_obj = shader_map[?shader_volumetric_fog]
//	with (render_shader_obj){
//		shader_set(shader)
//		render_set_uniform("lightPositionOnScreen", vec2(0.0, 0.0))
//		    var _texture = surface_get_texture(thresholdsurf);
//        texture_set_stage(shader_get_sampler_index(shader_volumetric_fog, "firstpass"), _texture);
//	}
//			draw_surface_exists(prevsurf, 0, 0)
//		with (render_shader_obj)
//			shader_clear()
//	}
//	surface_reset_target()

	
//	return resultsurf









}
