/// action_tl_frame_follow_pos_offset_y(value)
/// @arg value

function action_tl_frame_follow_pos_offset_y(value)
{
	tl_value_set_start(action_tl_frame_follow_pos_offset_y, false)
	tl_value_set(e_value.FLW_POS_OFFSET_Y, value, false)
	tl_value_set_done()
}