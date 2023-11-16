/// tl_duplicate()
/// @desc Duplicates the given timeline and children. Returns the new one.

function tl_duplicate()
{
	copy = new_obj(obj_timeline)
	tl_copy(copy)
	
	with (copy)
	{
		root_copy = null
		copy = null
		glint_tex = other.glint_tex
		glint_tex.count++
		
		tl_update_scenery_part()
		
		// Set correct template
		if (temp != null)
		{
			if (temp.object_index = obj_template) // Template is in the library, 
			{
				if (part_of = null) // Add count for non-parts
					temp.count++
			}
			else if (temp = other.id) // Template is itself, update
				temp = id
			else if (temp.part_of != null) // Template is also a part, update to its copy
				temp = temp.copy
		}
		
		// Copy default values
		for (var v = 0; v < e_value.amount; v++)
			value_default[v] = tl_value_find_save_id(v, null, other.value_default[v])
		
		// Copy keyframes
		for (var k = 0; k < ds_list_size(other.keyframe_list); k++)
		{
			var oldkf, newkf;
			oldkf = other.keyframe_list[|k]
			newkf = new_obj(obj_keyframe)
			newkf.position = oldkf.position
			newkf.timeline = id
			newkf.selected = false
			newkf.sound_play_index = null
			for (var v = 0; v < e_value.amount; v++)
				newkf.value[v] = oldkf.value[v]
			ds_list_add(keyframe_list, newkf)
		}
		
		// Copy tree structure
		for (var t = 0; t < ds_list_size(other.tree_list); t++)
		{
			with (other.tree_list[|t])
				ds_list_add(other.tree_list, tl_duplicate())
			tree_list[|t].parent = id
		}
		
		// Copy body part references
		if (other.part_list != null)
		{
			part_list = ds_list_create()
			for (var p = 0; p < ds_list_size(other.part_list); p++)
			{
				var pcopy = other.part_list[|p].copy;
				ds_list_add(part_list, pcopy)
				pcopy.part_of = id
			}
		}
		
		if (other.pattern_type != "" && other.pattern_base_color != null)
		{
			pattern_type = other.pattern_type
			pattern_base_color = other.pattern_base_color
			pattern_pattern_list = array_copy_1d(other.pattern_pattern_list)
			pattern_color_list = array_copy_1d(other.pattern_color_list)
			array_add(pattern_update, id)
		}
		
		// Update
		tl_update()
		tl_update_values()
		
		return id
	}
}
