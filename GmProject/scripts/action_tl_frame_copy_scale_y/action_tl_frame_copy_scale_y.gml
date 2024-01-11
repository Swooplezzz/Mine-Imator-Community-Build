/// action_tl_frame_copy_scale_y(enable)
/// @arg enable

function action_tl_frame_copy_scale_y(enable)
{
	tl_value_set_start(action_tl_frame_copy_scale_y, false)
	tl_value_set(e_value.COPY_SCALE_Y, enable, false)
	tl_value_set_done()
}