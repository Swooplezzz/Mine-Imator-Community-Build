// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_spot_gobo_offset_x(val, add)
{
	tl_value_set_start(action_tl_frame_spot_gobo_offset_x, true)
	tl_value_set(e_value.SPOT_GOBO_OFFSET_X, val, add)
	tl_value_set_done()
}