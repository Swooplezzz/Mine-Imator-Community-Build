/// action_tl_frame_follow_pos_z(enable)
/// @arg enable

function action_tl_frame_follow_pos_z(enable)
{
	tl_value_set_start(action_tl_frame_follow_pos_z, false)
	tl_value_set(e_value.FLW_POS_Z, enable, false)
	tl_value_set_done()
}