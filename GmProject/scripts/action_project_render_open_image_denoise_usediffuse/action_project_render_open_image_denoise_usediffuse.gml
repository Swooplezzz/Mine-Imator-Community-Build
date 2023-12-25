// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_project_render_open_image_denoise_usediffuse(enable)
{
	if (!history_undo && !history_redo)
		history_set_var(action_project_render_open_image_denoise_usediffuse, project_render_open_image_denoise_usediffuse, enable, true)
	
	project_render_open_image_denoise_usediffuse = enable
}
