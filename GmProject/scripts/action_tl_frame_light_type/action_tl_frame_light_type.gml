// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_light_type(mode)
{
	tl_edit.type = mode
	render_samples = -1
	with(tl_edit){
		tl_update_value_types()
	}
	app_update_tl_edit()
}