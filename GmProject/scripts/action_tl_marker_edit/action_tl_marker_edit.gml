/// action_tl_marker_edit(name, color)
/// @arg name
/// @arg color

function action_tl_marker_edit(name, color)
{
	if (history_undo)
	{
		with (save_id_find(history_data.marker_save_id))
		{
			color = history_data.marker_color_prev
			name = history_data.marker_name_prev
		}
	}
	else
	{
		var hobj, marker;
	
		// Combine with creation action
		if (history_amount > 0 && (history[0].script = action_tl_marker_new) && (history[0].marker_save_id = save_id_get(timeline_marker_edit)))
		{
			history[0].marker_name = name
			history[0].marker_color = color
		
			marker = save_id_find(history[0].marker_save_id)
			marker.name = name
			marker.color = color
		
			return 0
		}
	
		// New action/redo
		if (!history_redo)
		{
			marker = timeline_marker_edit
		
			// Combine
			if (history_amount > 0 && (history[0].script = action_tl_marker_edit) && (history[0].marker_save_id = save_id_get(marker)))
			{
				hobj = history[0]
				hobj.marker_name_new = name
				hobj.marker_color_new = color
			}
			else
			{
				hobj = history_set(action_tl_marker_edit)
		
				with (hobj)
				{
					marker_save_id = save_id_get(marker)
					marker_name_prev = marker.name
					marker_color_prev = marker.color
					marker_name_new = name
					marker_color_new = color
				}
			}
			marker.name = hobj.marker_name_new
			marker.color = hobj.marker_color_new
		}
		else
		{
			with (save_id_find(history_data.marker_save_id))
			{
				name = history_data.marker_name_new
				color = history_data.marker_color_new
			}
		}
	}
}
