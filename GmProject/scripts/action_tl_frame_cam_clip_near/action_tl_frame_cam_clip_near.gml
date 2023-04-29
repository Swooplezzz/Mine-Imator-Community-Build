/// action_tl_frame_cam_clip_near(value, add)
/// @arg value
/// @arg add

function action_tl_frame_cam_clip_near(val, add)
{
	tl_value_set_start(action_tl_frame_cam_clip_near, true)
	tl_value_set(e_value.CAM_CLIP_NEAR, val, add)
	tl_value_set_done()
}
