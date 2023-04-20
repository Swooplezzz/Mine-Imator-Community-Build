// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_follow_rot_y(enable){
	tl_value_set_start(action_tl_frame_follow_rot_y, false)
	tl_value_set(e_value.FLW_ROT_Y, enable, false)
	tl_value_set_done()
}