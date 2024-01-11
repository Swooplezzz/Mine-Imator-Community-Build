/// action_tl_frame_copy_scale_target(target)
/// @arg target

function action_tl_frame_copy_scale_target(target)
{
	tl_value_set_start(action_tl_frame_copy_scale_target, false)
	tl_value_set(e_value.SCALE_TARGET, target, false)
	tl_value_set_done()
}