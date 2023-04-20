// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_follow_scale_target(target){
	tl_value_set_start(action_tl_frame_follow_scale_target, false)
	tl_value_set(e_value.SCALE_TARGET, target, false)
	tl_value_set_done()
}