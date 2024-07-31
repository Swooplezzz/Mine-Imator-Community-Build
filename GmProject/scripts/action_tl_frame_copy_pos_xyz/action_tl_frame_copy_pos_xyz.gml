// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_tl_frame_copy_pos_xyz(point)
{
	tl_value_set_start(action_tl_frame_copy_pos_xyz, false)
	tl_value_set(e_value.COPY_POS_OFFSET_X, point[@ X], false)
	tl_value_set(e_value.COPY_POS_OFFSET_Y, point[@ Y], false)
	tl_value_set(e_value.COPY_POS_OFFSET_Z, point[@ Z], false)
	tl_value_set_done()
	tl_edit.update_matrix = true
}
