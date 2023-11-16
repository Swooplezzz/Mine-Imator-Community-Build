/// project_save_timeline()

function project_save_timeline()
{
	json_save_object_start()

		json_save_var("id", save_id)
		json_save_var("type", tl_type_name_list[|type])
		json_save_var("name", json_string_encode(name))
		
		json_save_var_save_id("temp", temp)
		json_save_var_nullable("color_tag", color_tag)
		json_save_var_bool("hide", hide)
		json_save_var_bool("lock", lock)
		json_save_var_bool("ghost", ghost)
		json_save_var("depth", depth)
		
		if (type = e_temp_type.BODYPART)
			json_save_var("model_part_name", json_string_encode(model_part_name))
		
		if (type = e_temp_type.TEXT)
			json_save_var("text", json_string_encode(text))
		
		if (part_of != null)
		{
			if (type = e_temp_type.SPECIAL_BLOCK)
			{
				json_save_object_start("model")
					json_save_var("name", model_name)
					json_save_var_state_vars("state", model_state)
				json_save_object_done()
			}
			else if (type = e_temp_type.BLOCK)
			{
				json_save_object_start("block")
					json_save_var("name", block_name)
					json_save_var_state_vars("state", block_state)
				json_save_object_done()
			}
			
			json_save_var_save_id("part_of", part_of)
			
			if (part_root != null)
				json_save_var_save_id("part_root", part_root)
			
			// Pattern values
			if (pattern_type != "" && pattern_base_color != null)
			{
				json_save_var("pattern_type", pattern_type)
				
				var color = ds_map_find_key(minecraft_swatch_dyes.map, pattern_base_color);
				if (color != undefined)
					json_save_var("pattern_base_color", color)
				else
					json_save_var("pattern_base_color", "white")
				
				if (array_length(pattern_pattern_list) > 0)
				{
					json_save_array_start("pattern_pattern_list")
					
						for (var p = 0; p < array_length(pattern_pattern_list); p++)
							json_save_array_value(pattern_pattern_list[p])
					
					json_save_array_done()
				}
				
				if (array_length(pattern_color_list) > 0)
				{
					json_save_array_start("pattern_color_list")
					
						for (var c = 0; c < array_length(pattern_color_list); c++)
							json_save_array_value(ds_map_find_key(minecraft_swatch_dyes.map, pattern_color_list[c]))
					
					json_save_array_done()
				}
			}
		}
		
		if (part_list != null)
		{
			json_save_array_start("parts")
			
				for (var p = 0; p < ds_list_size(part_list); p++)
					json_save_array_value(save_id_get(part_list[|p]))
			
			json_save_array_done()
		}
		
		project_save_values("default_values", value_default, app.value_default)
		
		json_save_object_start("keyframes")
			
			for (var k = 0; k < ds_list_size(keyframe_list); k++)
			{
				with (keyframe_list[|k])
				{
					keyframe_update_item_name()
					project_save_values(string(position), value, other.value_default)
				}
			}
		
		json_save_object_done()
		
		// Only include parent in the file if it's also saved
		if (parent != app && parent.save)
			json_save_var_save_id("parent", parent)
		else
			json_save_var_save_id("parent", app)
		json_save_var("parent_tree_index", ds_list_find_index(parent.tree_list, id))
		
		if (value_type[e_value_type.HIERARCHY])
		{
			json_save_var_bool("lock_bend", lock_bend)
			json_save_var_bool("tree_extend", tree_extend)
			
			json_save_object_start("inherit")
				json_save_var_bool("position", inherit_position)
				json_save_var_bool("rotation", inherit_rotation)
				json_save_var_bool("scale", inherit_scale)
				json_save_var_bool("alpha", inherit_alpha)
				json_save_var_bool("color", inherit_color)
				json_save_var_bool("texture", inherit_texture)
				json_save_var_bool("surface", inherit_surface)
				json_save_var_bool("subsurface", inherit_subsurface)
				json_save_var_bool("visibility", inherit_visibility)
				json_save_var_bool("bend", inherit_bend)
				json_save_var_bool("rot_point", inherit_rot_point)
				json_save_var_bool("glow_color", inherit_glow_color)
				json_save_var_bool("select", inherit_select)
				json_save_var_bool("pose", inherit_pose)
			json_save_object_done()
			
			json_save_var_bool("scale_resize", scale_resize)
		}
		
		if (value_type[e_value_type.ROT_POINT])
		{
			json_save_var_bool("rot_point_custom", rot_point_custom)
			json_save_var_point3D("rot_point", rot_point)
		}
		
		if (value_type[e_value_type.APPEARANCE])
		{
			json_save_var_bool("backfaces", backfaces)
			json_save_var_bool("texture_blur", texture_blur)
			json_save_var_bool("texture_filtering", texture_filtering)
			json_save_var_bool("shadows", shadows)
			json_save_var_bool("ssao", ssao)
			json_save_var_bool("glow", glow)
			json_save_var_bool("glow_texture", glow_texture)
			json_save_var_bool("only_render_glow", only_render_glow)
			json_save_var("glint_mode", glint_mode)
			json_save_var("glint_scale", glint_scale)
			json_save_var("glint_speed", glint_speed)
			json_save_var("glint_strength", glint_strength)
			json_save_var_save_id("glint_tex", glint_tex)
			json_save_var_bool("fog", fog)
			
			if (type = e_temp_type.SCENERY || type = e_temp_type.BLOCK || type = e_temp_type.PARTICLE_SPAWNER || type = e_temp_type.TEXT || type_is_shape(type))
			{
				json_save_var_bool("wind", wind)
				json_save_var_bool("wind_terrain", wind_terrain)
			}
			
			json_save_var_bool("hq_hiding", hq_hiding)
			json_save_var_bool("lq_hiding", lq_hiding)
			json_save_var("blend_mode", blend_mode)
			json_save_var("alpha_mode", alpha_mode)
		}
		
		if (value_type[e_value_type.PATH])
		{
			json_save_object_start("path")
				json_save_var_bool("smooth", path_smooth)
				json_save_var_bool("closed", path_closed)
				json_save_var("detail", path_detail)
				json_save_var_bool("shape_generate", path_shape_generate)
				json_save_var("shape_radius", path_shape_radius)
				json_save_var("shape_tex_length", path_shape_tex_length)
				json_save_var_bool("shape_invert", path_shape_invert)
				json_save_var_bool("shape_tube", path_shape_tube)
				json_save_var("shape_detail", path_shape_detail)
				json_save_var_bool("shape_smooth_segments", path_shape_smooth_segments)
				json_save_var_bool("shape_smooth_ring", path_shape_smooth_ring)
			json_save_object_done()
		}
		
	json_save_object_done()
}
