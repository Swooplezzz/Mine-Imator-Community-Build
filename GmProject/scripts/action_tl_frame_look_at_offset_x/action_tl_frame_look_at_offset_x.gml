// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_look_at_offset_x(value, add)
{
	tl_value_set_start(action_tl_frame_look_at_offset_x, false)
	tl_value_set(e_value.LOOK_AT_OFFSET_X, value, add)
	tl_value_set_done()
}