/// action_tl_frame_copy_pos_offset_x(value, add)
/// @arg value
/// @arg add

function action_tl_frame_copy_pos_offset_x(value, add)
{
	tl_value_set_start(action_tl_frame_copy_pos_offset_x, false)
	tl_value_set(e_value.COPY_POS_OFFSET_X, value, add)
	tl_value_set_done()
}