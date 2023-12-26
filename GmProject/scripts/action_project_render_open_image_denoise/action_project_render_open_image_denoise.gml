/// action_project_render_open_image_denoise(enable)
/// @arg enable

function action_project_render_open_image_denoise(enable)
{
	if (!history_undo && !history_redo)
		history_set_var(action_project_render_open_image_denoise, project_render_open_image_denoise, enable, true)
	
	project_render_open_image_denoise = enable
}
