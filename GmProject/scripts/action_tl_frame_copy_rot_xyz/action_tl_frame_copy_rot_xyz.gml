/// action_tl_frame_copy_rot_xyz(point)
/// @arg point

function action_tl_frame_copy_rot_xyz(point)
{
	tl_value_set_start(action_tl_frame_copy_rot_xyz, false)
	tl_value_set(e_value.COPY_ROT_OFFSET_X, point[@ X], false)
	tl_value_set(e_value.COPY_ROT_OFFSET_Y, point[@ Y], false)
	tl_value_set(e_value.COPY_ROT_OFFSET_Z, point[@ Z], false)
	tl_value_set_done()
	tl_edit.update_matrix = true
}
