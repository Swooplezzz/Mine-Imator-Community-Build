/// action_tl_frame_follow_scale_z(enable)
/// @arg enable

function action_tl_frame_follow_scale_z(enable)
{
	tl_value_set_start(action_tl_frame_follow_scale_z, false)
	tl_value_set(e_value.FLW_SCALE_Z, enable, false)
	tl_value_set_done()
}