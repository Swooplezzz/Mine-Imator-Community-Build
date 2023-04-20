/// tab_get_title(tab)
/// @arg tab
/// @desc Returns the tab title.

function tab_get_title(tab)
{
	if (tab = properties)
		return text_get("tabprojectproperties")
	else if (tab = timeline)
		return text_get("tabtimeline")
	else if (tab = template_editor)
	{
		if (!temp_edit)
			return ""
		switch (temp_edit.type)
		{
			case e_temp_type.CHARACTER:
				return text_get("tabcharmodel", string_remove_newline(temp_edit.display_name))
			
			case e_temp_type.SPECIAL_BLOCK:
			case e_temp_type.BLOCK:
				return text_get("tabblock", string_remove_newline(temp_edit.display_name))
			
			case e_temp_type.ITEM:
				return text_get("tabitem", string_remove_newline(temp_edit.display_name))
			
			case e_temp_type.BODYPART:
				return text_get("tabbodypart", string_remove_newline(temp_edit.display_name))
			
			case e_temp_type.PARTICLE_SPAWNER:
				return text_get("tabparticles", string_remove_newline(temp_edit.display_name))
		}
	}
	else if (tab = ground_editor)
		return text_get("tabground")
	else if (tab = timeline_editor)
	{
		var name = "";
		if (tl_edit)
		{
			name = string_remove_newline(tl_edit.display_name)
			if (tl_edit_amount > 1)
				name += "..."
		}
		return text_get("tabtimelineeditor", name)
	}
	else if (tab = frame_editor)
	{
		var name = "";
		if (tl_edit)
		{
			name = string_remove_newline(tl_edit.display_name)
			if (tl_edit_amount > 1)
				name += "..."
		}
		return text_get("tabframeeditor", name, string(round(timeline_marker)))
	}
	else if (tab = settings)
		return text_get("tabsettings")
	
	return ""
}
