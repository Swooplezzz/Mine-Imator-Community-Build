/// action_tl_frame_copy_pos_target(target)
/// @arg target

function action_tl_frame_copy_pos_target(target)
{
	tl_value_set_start(action_tl_frame_copy_pos_target, false)
	tl_value_set(e_value.POS_TARGET, target, false)
	tl_value_set_done()
}