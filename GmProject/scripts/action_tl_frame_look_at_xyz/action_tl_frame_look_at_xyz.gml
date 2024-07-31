// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_look_at_xyz(point)
{
	tl_value_set_start(action_tl_frame_look_at_xyz, false)
	tl_value_set(e_value.LOOK_AT_OFFSET_X, point[@ X], false)
	tl_value_set(e_value.LOOK_AT_OFFSET_Y, point[@ Y], false)
	tl_value_set(e_value.LOOK_AT_OFFSET_Z, point[@ Z], false)
	tl_value_set_done()
	tl_edit.update_matrix = true
}
