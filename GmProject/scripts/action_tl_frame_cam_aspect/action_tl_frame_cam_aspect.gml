// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_cam_aspect(val, add)
{
	tl_value_set_start(action_tl_frame_cam_aspect, true)
	tl_value_set(e_value.CAM_ASPECT, val, add)
	tl_value_set_done()
}