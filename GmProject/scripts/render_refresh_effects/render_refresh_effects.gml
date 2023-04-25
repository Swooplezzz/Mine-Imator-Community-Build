/// render_refresh_effects(sceneeffects, posteffects)
/// @arg sceneeffects
/// @arg posteffects

function render_refresh_effects(sceneeffects = true, posteffects = true)
{
	ds_list_clear(render_effects_list)
	ds_list_add(render_effects_list,
		render_camera_dof && sceneeffects,
		render_glow && (sceneeffects || posteffects),
		render_glow_falloff && (sceneeffects || posteffects),
		render_camera_bloom && posteffects,
		render_camera_lens_dirt,
		render_camera_ca && posteffects,
		render_camera_distort && posteffects,
		render_camera_color_correction && posteffects,
		render_camera_grain && posteffects,
		render_camera_vignette && posteffects,
		render_overlay && posteffects
	)
	
	render_effects_progress = -1
	render_post_index = 0
	render_effects_done = false
}
