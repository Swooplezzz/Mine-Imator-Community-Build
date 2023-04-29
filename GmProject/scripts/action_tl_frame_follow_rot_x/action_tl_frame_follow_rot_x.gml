/// action_tl_frame_follow_rot_x(enable)
/// @arg enable

function action_tl_frame_follow_rot_x(enable)
{
	tl_value_set_start(action_tl_frame_follow_rot_x, false)
	tl_value_set(e_value.FLW_ROT_X, enable, false)
	tl_value_set_done()
}