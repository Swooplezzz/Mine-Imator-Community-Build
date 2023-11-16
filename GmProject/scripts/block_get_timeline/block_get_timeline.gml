/// block_get_timeline(block, stateid)
/// @arg block
/// @arg stateid

function block_get_timeline(block, stateid)
{
	var pos = build_pos;
	
	with (new_obj(obj_block_tl))
	{
		id.block = block
		model_name = block.tl_model_name
		model_state = array()
		
		if (model_name != "")
		{
			if (!block.tl_has_model_state)
				model_state = block_get_state_id_state_vars(block, stateid) // Copy block state if not specified
			else if (block.tl_model_state_amount = 0)
				model_state = array_copy_1d(block.tl_model_state)
			
			// Find model state from block state
			for (var i = 0; i < block.tl_model_state_amount; i++)
			{
				var curstate = block.tl_model_state[i];
				if (array_contains(curstate.state_id, stateid)) // Found matching state
				{
					model_state = array_copy_1d(curstate.value)
					break
				}
			}
			
			// Unique case with decorated pot
			if (mc_builder.block_decorated_pot_sherds_map[?pos] != undefined)
				model_state = array_copy_1d(mc_builder.block_decorated_pot_sherds_map[?pos])
		}
		
		// Get text from state
		has_text = block.tl_has_text
		if (has_text)
		{
			text_front = mc_builder.block_text_front_map[?pos]
			text_front_color = mc_builder.block_text_front_color_map[?pos]
			text_front_glow_color = mc_builder.block_text_front_glow_color_map[?pos]
			text_front_emissive = mc_builder.block_text_front_glowing_map[?pos]
			text_back = mc_builder.block_text_back_map[?pos]
			text_back_color = mc_builder.block_text_back_color_map[?pos]
			text_back_glow_color = mc_builder.block_text_back_glow_color_map[?pos]
			text_back_emissive = mc_builder.block_text_back_glowing_map[?pos]
			
			if (is_undefined(text_front))
			{
				text_front = ""
				text_front_color = c_black
				text_front_glow_color = c_black
				text_front_emissive = 0
			}
			
			if (is_undefined(text_back))
			{
				text_back = ""
				text_back_color = c_black
				text_back_glow_color = c_black
				text_back_emissive = 0
			}
			
			text_front_position = block.tl_text_front_position
			text_front_rotation = block.tl_text_front_rotation
			text_front_scale = block.tl_text_front_scale
			text_back_position = block.tl_text_back_position
			text_back_rotation = block.tl_text_back_rotation
			text_back_scale = block.tl_text_back_scale
		}
		
		// Get banner patterns
		pattern_type = block.tl_pattern_type
		if (pattern_type != "")
		{
			banner_color = mc_builder.block_banner_color_map[?pos]
			banner_patterns = mc_builder.block_banner_patterns_map[?pos]
			banner_pattern_colors = mc_builder.block_banner_pattern_colors_map[?pos]
			if (is_undefined(banner_color))
			{
				banner_color = c_white
				banner_patterns = array()
				banner_pattern_colors = array()
			}
		}
		
		// Skull resource
		if (mc_builder.block_skull_map[?pos] != undefined)
		{
			var userid = mc_builder.block_skull_map[?pos];
			texture = mc_builder.block_skull_res_map[?userid]
		}
		else
			texture = null
		
		rot_point = block.tl_rot_point
		position = block.tl_position
		rotation = block.tl_rotation
		
		// Find rotation point from state
		for (var i = 0; i < block.tl_rot_point_state_amount; i++)
		{
			var curstate = block.tl_rot_point_state[i];
			if (array_contains(curstate.state_id, stateid)) // Found matching state
			{
				rot_point = curstate.value
				break
			}
		}
		
		// Find position from state
		for (var i = 0; i < block.tl_position_state_amount; i++)
		{
			var curstate = block.tl_position_state[i];
			if (array_contains(curstate.state_id, stateid)) // Found matching state
			{
				position = curstate.value
				break
			}
		}
		
		// Find rotation point from state
		for (var i = 0; i < block.tl_rotation_state_amount; i++)
		{
			var curstate = block.tl_rotation_state[i];
			if (array_contains(curstate.state_id, stateid)) // Found matching state
			{
				rotation = curstate.value
				break
			}
		}
		
		// Add current position in terrain
		position[X] += other.build_pos_x * block_size
		position[Y] += other.build_pos_y * block_size
		position[Z] += other.build_pos_z * block_size
		
		// Get variant
		variant = block_get_state_id_value(block, stateid, "variant")
		
		return id
	}
}
