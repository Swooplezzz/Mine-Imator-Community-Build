/// action_tl_frame_copy_pos_offset_y(value)
/// @arg value

function action_tl_frame_copy_pos_offset_y(value,add)
{
	tl_value_set_start(action_tl_frame_copy_pos_offset_y, false)
	tl_value_set(e_value.COPY_POS_OFFSET_Y, value, add)
	tl_value_set_done()
}