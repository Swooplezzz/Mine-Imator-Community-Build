/// action_tl_frame_cam_aspect(value, add)
/// @arg value
/// @arg add

function action_tl_frame_cam_aspect(val, add)
{
	tl_value_set_start(action_tl_frame_cam_aspect, true)
	tl_value_set(e_value.CAM_ASPECT, val, add)
	tl_value_set_done()
}