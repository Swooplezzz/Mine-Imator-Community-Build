/// action_project_render_open_image_denoise_usenormals(enable)
/// @arg enable

function action_project_render_open_image_denoise_usenormals(enable)
{
	if (!history_undo && !history_redo)
		history_set_var(action_project_render_open_image_denoise_usenormals, project_render_open_image_denoise_usenormals, enable, true)
	
	project_render_open_image_denoise_usenormals = enable
}
