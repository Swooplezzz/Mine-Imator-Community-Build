/// action_tl_frame_copy_pos_offset(value, add)
/// @arg value
/// @arg add

function action_tl_frame_copy_pos_offset(val, add)
{
	tl_value_set_start(action_tl_frame_copy_pos_offset, true)
	tl_value_set(e_value.COPY_POS_OFFSET_X + axis_edit, val, add)
	tl_value_set_done()
}