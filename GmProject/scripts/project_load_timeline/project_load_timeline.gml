/// project_load_timeline(map)
/// @arg map

function project_load_timeline(map)
{
	if (!ds_map_valid(map))
		return 0
	
	with (new_obj(obj_timeline))
	{
		loaded = true
		load_id = value_get_string(map[?"id"], save_id)
		save_id_map[?load_id] = load_id
		
		type = ds_list_find_index(tl_type_name_list, value_get_string(map[?"type"]))
		name = value_get_string(map[?"name"], name)
		
		temp = value_get_save_id(map[?"temp"], temp)
		color_tag = value_get_real(map[?"color_tag"], color_tag)
		hide = value_get_real(map[?"hide"], hide)
		lock = value_get_real(map[?"lock"], lock)
		ghost = value_get_real(map[?"ghost"], ghost)
		depth = value_get_real(map[?"depth"], depth)
		
		if (type = e_temp_type.BODYPART)
			model_part_name = value_get_string(map[?"model_part_name"], model_part_name)
		
		if (type = e_temp_type.TEXT)
			text = value_get_string(map[?"text"], text)
		
		part_of = value_get_save_id(map[?"part_of"], part_of)
		if (part_of != null)
		{
			if (type = e_temp_type.SPECIAL_BLOCK)
			{
				var modelmap = map[?"model"];
				if (ds_map_valid(modelmap))
				{
					model_name = value_get_string(modelmap[?"name"], "")
					model_state = value_get_state_vars(modelmap[?"state"])
				}
				
				part_root = value_get_save_id(map[?"part_root"], part_root)
				
				// Pattern values
				pattern_type = value_get_string(map[?"pattern_type"], pattern_type)
				
				// Legacy "is_banner" value
				if (load_format < e_project.FORMAT_200_PRE_5)
				{
					var isbanner = value_get_real(map[?"is_banner"], false);
					
					if (isbanner)
						pattern_type = "banner"
				}
				
				if (pattern_type != "")
				{
					var base_color, pattern_list, color_list;
					
					if (load_format < e_project.FORMAT_200_PRE_5)
					{
						base_color = value_get_string(map[?"banner_base_color"], "white")
						pattern_list = map[?"banner_pattern_list"]
						color_list = map[?"banner_color_list"]
					}
					else
					{
						base_color = value_get_string(map[?"pattern_base_color"], "white")
						pattern_list = map[?"pattern_pattern_list"]
						color_list = map[?"pattern_color_list"]
					}
					
					pattern_base_color = minecraft_color_list[|ds_list_find_index(minecraft_color_name_list, base_color)]
					
					if (ds_list_valid(pattern_list))
					{
						pattern_pattern_list = array()
						for (var p = 0; p < ds_list_size(pattern_list); p++)
							array_add(pattern_pattern_list, pattern_list[|p])
					}
					
					if (ds_list_valid(color_list))
					{
						pattern_color_list = array()
						for (var c = 0; c < ds_list_size(color_list); c++)
							array_add(pattern_color_list, minecraft_color_list[|ds_list_find_index(minecraft_color_name_list, color_list[|c])])
					}
				}
			}
			else if (type = e_temp_type.BLOCK)
			{
				var blockmap = map[?"block"];
				if (ds_map_valid(blockmap))
				{
					if (load_format < e_project.FORMAT_120_PRE_1)
					{
						// Read legacy block
						var bid = value_get_real(blockmap[?"legacy_id"], 2);
						var bdata = value_get_real(blockmap[?"legacy_data"], 0);
						if (legacy_block_set[bid])
						{
							var block = legacy_block_obj[bid, bdata];
							if (block != null)
							{
								block_name = block.name
								block_state = block_get_state_id_state_vars(block, legacy_block_state_id[bid, bdata])
							}
						}
					}
					else
					{
						block_name = value_get_string(blockmap[?"name"], "")
						block_state = value_get_state_vars(blockmap[?"state"])
					}
				}
			}
		}
		
		var partslist = map[?"parts"];
		if (ds_list_valid(partslist))
		{
			part_list = ds_list_create()
			for (var p = 0; p < ds_list_size(partslist); p++)
				ds_list_add(part_list, partslist[|p])
		}
		
		// Default values
		project_load_values(map[?"default_values"], value_default)
		
		// Keyframes
		var kfmap = map[?"keyframes"];
		if (ds_map_valid(kfmap))
		{
			var key = ds_map_find_first(kfmap);
			keyframe_array = 0
			while (!is_undefined(key))
			{
				with (new_obj(obj_keyframe))
				{
					position = string_get_real(key)
					loaded = true
					timeline = other.id
					selected = false
					sound_play_index = null
					
					for (var v = 0; v < e_value.amount; v++)
						value[v] = other.value_default[v]
					
					project_load_values(kfmap[?key], value)
					project_load_values_update()
					
					other.keyframe_array[position] = id
				}
				key = ds_map_find_next(kfmap, key)
			}
			
			// Create list (in the same order as position)
			for (var i = 0; i < array_length(keyframe_array); i++)
				if (keyframe_array[i] > 0)
					ds_list_add(keyframe_list, keyframe_array[i])
		}
		
		parent = value_get_save_id(map[?"parent"], parent)
		parent_tree_index = value_get_real(map[?"parent_tree_index"], null)
		
		lock_bend = value_get_real(map[?"lock_bend"], lock_bend)
		tree_extend = value_get_real(map[?"tree_extend"], tree_extend)
		
		var inheritmap = map[?"inherit"];
		if (ds_map_valid(inheritmap))
		{
			inherit_position = value_get_real(inheritmap[?"position"], inherit_position)
			inherit_rotation = value_get_real(inheritmap[?"rotation"], inherit_rotation)
			inherit_rot_point = value_get_real(inheritmap[?"rot_point"], inherit_rot_point)
			inherit_scale = value_get_real(inheritmap[?"scale"], inherit_scale)
			inherit_alpha = value_get_real(inheritmap[?"alpha"], inherit_alpha)
			inherit_color = value_get_real(inheritmap[?"color"], inherit_color)
			inherit_visibility = value_get_real(inheritmap[?"visibility"], inherit_visibility)
			inherit_bend = value_get_real(inheritmap[?"bend"], inherit_bend)
			inherit_texture = value_get_real(inheritmap[?"texture"], inherit_texture)
			inherit_surface = value_get_real(inheritmap[?"surface"], inherit_surface)
			inherit_subsurface = value_get_real(inheritmap[?"subsurface"], inherit_subsurface)
			inherit_glow_color = value_get_real(inheritmap[?"glow_color"], inherit_glow_color)
			inherit_select = value_get_real(inheritmap[?"select"], inherit_select)
		}
		
		scale_resize = value_get_real(map[?"scale_resize"], scale_resize)
		
		rot_point_custom = value_get_real(map[?"rot_point_custom"], rot_point_custom)
		rot_point = value_get_point3D(map[?"rot_point"], rot_point)
		
		backfaces = value_get_real(map[?"backfaces"], backfaces)
		texture_blur = value_get_real(map[?"texture_blur"], texture_blur)
		texture_filtering = value_get_real(map[?"texture_filtering"], texture_filtering)
		shadows = value_get_real(map[?"shadows"], shadows)
		ssao = value_get_real(map[?"ssao"], ssao)
		glow = value_get_real(map[?"glow"], glow)
		glow_texture = value_get_real(map[?"glow_texture"], glow_texture)
		only_render_glow = value_get_real(map[?"only_render_glow"], only_render_glow)
		fog = value_get_real(map[?"fog"], fog)
		
		if (type = e_temp_type.SCENERY || type = e_temp_type.BLOCK || type = e_temp_type.PARTICLE_SPAWNER || type = e_temp_type.TEXT || type_is_shape(type))
		{
			wind = value_get_real(map[?"wind"], wind)
			wind_terrain = value_get_real(map[?"wind_terrain"], wind_terrain)
		}
		
		hq_hiding = value_get_real(map[?"hq_hiding"], hq_hiding)
		lq_hiding = value_get_real(map[?"lq_hiding"], lq_hiding)
		
		blend_mode = value_get_string(map[?"blend_mode"], blend_mode)
		
		if (load_format < e_project.FORMAT_200_PRE_5)
			alpha_mode = e_alpha_mode.BLEND
		else
			alpha_mode = value_get_real(map[?"alpha_mode"], alpha_mode)
		
		var pathmap = map[?"path"];
		if (ds_map_valid(pathmap))
		{
			path_smooth = value_get_real(pathmap[?"smooth"], path_smooth)
			path_closed = value_get_real(pathmap[?"closed"], path_closed)
			path_detail = value_get_real(pathmap[?"detail"], path_detail)
			path_shape_generate = value_get_real(pathmap[?"shape_generate"], path_shape_generate)
			path_shape_radius = value_get_real(pathmap[?"shape_radius"], path_shape_radius)
			path_shape_tex_length = value_get_real(pathmap[?"shape_tex_length"], path_shape_tex_length)
			path_shape_invert = value_get_real(pathmap[?"shape_invert"], path_shape_invert)
			path_shape_tube = value_get_real(pathmap[?"shape_tube"], path_shape_tube)
			path_shape_detail = value_get_real(pathmap[?"shape_detail"], path_shape_detail)
			path_shape_smooth_segments = value_get_real(pathmap[?"shape_smooth_segments"], path_shape_smooth_segments)
			path_shape_smooth_ring = value_get_real(pathmap[?"shape_smooth_ring"], path_shape_smooth_ring)
		}
	}
}
