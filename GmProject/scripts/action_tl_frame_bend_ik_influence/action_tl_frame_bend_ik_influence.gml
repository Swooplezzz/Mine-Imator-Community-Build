// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_bend_ik_influence(val, add){
	tl_value_set_start(action_tl_frame_bend_ik_influence, true)
	tl_value_set(e_value.BEND_IK_INFLUENCE, val, add)
	tl_value_set_done()
}