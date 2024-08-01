/// action_tl_frame_copy_scale(enable)
/// @arg enable

function action_tl_frame_copy_scale(enable)
{
	tl_value_set_start(action_tl_frame_copy_scale, false)
	tl_value_set(e_value.COPY_SCALE_X + axis_edit, enable, false)
	tl_value_set_done()
}