/// action_tl_frame_follow_pos_offset_z(value)
/// @arg value

function action_tl_frame_follow_pos_offset_z(value)
{
	tl_value_set_start(action_tl_frame_follow_pos_offset_z, false)
	tl_value_set(e_value.FLW_POS_OFFSET_Z, value, false)
	tl_value_set_done()
}