/// action_tl_frame_pos_xyz(point)
/// @arg point

function action_tl_frame_pos_xyz(point)
{
	tl_value_set_start(action_tl_frame_pos_xyz, false)
	tl_value_set(e_value.POS_X, point[@ X], false)
	tl_value_set(e_value.POS_Y, point[@ Y], false)
	tl_value_set(e_value.POS_Z, point[@ Z], false)
	tl_value_set_done()
}
