/// action_tl_frame_bend_ik_target(target)
/// @arg target

function action_tl_frame_bend_ik_target(target)
{
	if(target = tl_edit) return;
	tl_value_set_start(action_tl_frame_bend_ik_target, false)
	tl_value_set(e_value.BEND_IK_TARGET, target, false)
	tl_value_set_done()
}