/// action_tl_frame_sound_end(value, add)
/// @arg value
/// @arg add

function action_tl_frame_sound_end(val, add)
{
	tl_value_set_start(action_tl_frame_sound_end, true)
	tl_value_set(e_value.SOUND_END, val, add)
	tl_value_set_done()
	tl_update_length()
}
