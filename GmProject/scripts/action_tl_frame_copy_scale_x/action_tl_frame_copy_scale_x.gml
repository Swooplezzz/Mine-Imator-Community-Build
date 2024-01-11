/// action_tl_frame_copy_scale_x(enable)
/// @arg enable

function action_tl_frame_copy_scale_x(enable)
{
	tl_value_set_start(action_tl_frame_copy_scale_x, false)
	tl_value_set(e_value.COPY_SCALE_X, enable, false)
	tl_value_set_done()
}