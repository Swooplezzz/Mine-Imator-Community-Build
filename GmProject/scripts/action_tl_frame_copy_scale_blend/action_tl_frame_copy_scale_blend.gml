/// action_tl_frame_copy_scale_blend(val, add)
/// @arg val
/// @arg add

function action_tl_frame_copy_scale_blend(val, add)
{
	tl_value_set_start(action_tl_frame_copy_scale_blend, true)
	tl_value_set(e_value.COPY_SCALE_BLEND, val / 100, add)
	tl_value_set_done()
}
