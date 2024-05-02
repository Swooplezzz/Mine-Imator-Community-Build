/// action_tl_frame_bend_ik_multiplier(value, add)
/// @arg value
/// @arg add

function action_tl_frame_bend_ik_multiplier(val, add)
{
	tl_value_set_start(action_tl_frame_bend_ik_multiplier, true)
	tl_value_set(e_value.BEND_IK_MULTIPLIER, val, add)
	tl_value_set_done()
}