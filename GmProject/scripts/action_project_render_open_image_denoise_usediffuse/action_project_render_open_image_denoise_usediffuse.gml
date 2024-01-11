/// action_project_render_open_image_denoise_usediffuse(enable)
/// @arg enable

function action_project_render_open_image_denoise_usediffuse(enable)
{
	if (!history_undo && !history_redo)
		history_set_var(action_project_render_open_image_denoise_usediffuse, project_render_open_image_denoise_usediffuse, enable, true)
	
	project_render_open_image_denoise_usediffuse = enable
}
