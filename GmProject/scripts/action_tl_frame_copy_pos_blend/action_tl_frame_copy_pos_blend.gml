/// action_tl_frame_copy_pos_blend(value, add)
/// @arg value
/// @arg add

function action_tl_frame_copy_pos_blend(val, add)
{
	tl_value_set_start(action_tl_frame_copy_pos_blend, true)
	tl_value_set(e_value.COPY_POS_BLEND, val / 100, add)
	tl_value_set_done()
}
