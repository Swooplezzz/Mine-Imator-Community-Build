/// action_tl_play_break()

function action_tl_play_break()
{
	timeline_playing = false
	audio_stop_all()

	with (obj_keyframe)
		sound_play_index = null
}
