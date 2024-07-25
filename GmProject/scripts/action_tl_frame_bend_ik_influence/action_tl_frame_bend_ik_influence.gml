/// action_tl_frame_bend_ik_influence(value, add)
/// @arg value
/// @arg add

function action_tl_frame_bend_ik_influence(val, add)
{
	tl_value_set_start(action_tl_frame_bend_ik_influence, true)
	tl_value_set(e_value.BEND_IK_INFLUENCE, val / 100, add)
	tl_value_set_done()
}