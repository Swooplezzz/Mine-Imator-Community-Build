// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_project_render_open_image_denoise(enable)
{
	if (!history_undo && !history_redo)
		history_set_var(action_project_render_open_image_denoise, project_render_open_image_denoise, enable, true)
	
	project_render_open_image_denoise = enable
}
