/// action_tl_left()

function action_tl_left()
{
	timeline_marker_move -= project_tempo / room_speed
	
	if (setting_timeline_frame_snap || keyboard_check(vk_control))
		timeline_marker = round(timeline_marker_move)
	else
		timeline_marker = timeline_marker_move
	
	if (timeline_repeat)
	{
		if (timeline_region_end != null)
		{
			if (timeline_marker < timeline_region_start)
				timeline_marker = timeline_region_end
		}
		else if (timeline_marker < 0)
			timeline_marker = timeline_length
	}
	
	timeline_marker = max(0, timeline_marker)
	timeline_marker_move = max(0, timeline_marker_move)
}
