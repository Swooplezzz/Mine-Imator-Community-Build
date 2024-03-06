/// render_high_volumetric_scatter(prevsurf)
/// @arg prevsurf

function render_high_volumetric_scatter(prevsurf)
{
	render_surface[0] = surface_require(render_surface[0], render_width, render_height)
	
	surface_set_target(render_surface[0])
	{
		draw_clear_alpha(c_black, 0)
		render_shader_obj = shader_map[?shader_volumelight]
		
		with (render_shader_obj)
		{
			shader_set(shader)
			shader_high_dof_coc_set(depthsurf)
		}
		
		draw_blank(0, 0, render_width, render_height)
		draw_surface_exists(prevsurf, 0, 0)
		
		with (render_shader_obj)
			shader_clear()
	}
	
	surface_reset_target()
	
	surface_set_target(prevsurf)
	{
		
	}
	
	surface_reset_target()
}
