/// action_tl_frame_copy_rot_target(target)
/// @arg target

function action_tl_frame_look_at_target(target)
{
	tl_value_set_start(action_tl_frame_look_at_target, false)
	tl_value_set(e_value.LOOK_AT_TARGET, target, false)
	tl_value_set_done()
}