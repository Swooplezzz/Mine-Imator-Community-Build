/// action_tl_frame_copy_pos_xyz(point)
/// @arg point

function action_tl_frame_copy_pos_xyz(point)
{
	tl_value_set_start(action_tl_frame_copy_pos_xyz, false)
	tl_value_set(e_value.COPY_POS_OFFSET_X, point[@ X], false)
	tl_value_set(e_value.COPY_POS_OFFSET_Y, point[@ Y], false)
	tl_value_set(e_value.COPY_POS_OFFSET_Z, point[@ Z], false)
	tl_value_set_done()
	tl_edit.update_matrix = true
}
