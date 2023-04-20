/// app_update_play()

function app_update_play()
{
	if (timeline_playing)
	{
		timeline_marker = timeline_playing_start_marker + ((current_time - timeline_playing_start_time) / 1000) * project_tempo
		
		if (setting_timeline_frame_snap)
			timeline_marker = floor(timeline_marker)
		
		if (timeline_repeat || timeline_seamless_repeat)
		{
			if (timeline_region_end != null)
			{
				if (timeline_marker >= timeline_region_end)
					action_tl_play_beginning()
			}
			else if (timeline_marker >= timeline_length && timeline_length > 0)
				action_tl_play_beginning()
		}
	}
}
