/// action_tl_frame_copy_scale_z(enable)
/// @arg enable

function action_tl_frame_copy_scale_z(enable)
{
	tl_value_set_start(action_tl_frame_copy_scale_z, false)
	tl_value_set(e_value.COPY_SCALE_Z, enable, false)
	tl_value_set_done()
}