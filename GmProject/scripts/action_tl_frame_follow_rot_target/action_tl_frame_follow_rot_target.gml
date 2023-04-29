/// action_tl_frame_follow_rot_target(target)
/// @arg target

function action_tl_frame_follow_rot_target(target)
{
	tl_value_set_start(action_tl_frame_follow_rot_target, false)
	tl_value_set(e_value.ROT_TARGET, target, false)
	tl_value_set_done()
}