/// action_tl_frame_cam_clip_far(value, add)
/// @arg value
/// @arg add

function action_tl_frame_cam_clip_far(val, add)
{
	tl_value_set_start(action_tl_frame_cam_clip_far, true)
	tl_value_set(e_value.CAM_CLIP_FAR, val, add)
	tl_value_set_done()
}
