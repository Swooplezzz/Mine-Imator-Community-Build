/// history_save_tl(timeline)
/// @arg timeline
/// @desc Saves a timeline in memory.

function history_save_tl(tl)
{
	var save = new_obj(obj_history_save);
	save.hobj = id
	
	with (tl)
		tl_copy(save)
	
	with (save)
	{
		save_id = tl.save_id
		tl_get_save_ids()
		
		// Save values
		for (var v = 0; v < e_value.amount; v++)
			value_default[v] = tl_value_get_save_id(v, tl.value_default[v])
		
		// Save keyframes
		kf_amount = ds_list_size(tl.keyframe_list)
		for (var k = 0; k < kf_amount; k++)
		{
			with (tl.keyframe_list[|k])
			{
				save.kf_pos[k] = position
				for (var v = 0; v < e_value.amount; v++)
					save.kf_value[k, v] = tl_value_get_save_id(v, value[v])
			}
		}
		
		// Save references in templates
		usage_temp_shape_tex_amount = 0
		usage_temp_path_amount = 0
		with (obj_template)
		{
			if (shape_tex = tl)
			{
				save.usage_temp_shape_tex_save_id[save.usage_temp_shape_tex_amount] = save_id
				save.usage_temp_shape_tex_amount++
			}
			
			if (type = e_temp_type.PARTICLE_SPAWNER && pc_spawn_region_path = tl)
			{
				save.usage_temp_path_save_id[save.usage_temp_path_amount] = save_id
				save.usage_temp_path_amount++
			}
		}
		
		// Save references in timelines
		usage_tl_texture_amount = 0
		usage_tl_path_amount = 0
		usage_tl_attractor_amount = 0
		usage_tl_ik_target_amount = 0
		usage_tl_copy_rot_target_amount = 0
		usage_tl_copy_pos_target_amount = 0
		usage_tl_copy_scale_target_amount = 0
		usage_tl_ik_target_angle_amount = 0
		with (obj_timeline)
		{
			if (value[e_value.TEXTURE_OBJ] = tl)
			{
				save.usage_tl_texture_save_id[save.usage_tl_texture_amount] = save_id
				save.usage_tl_texture_amount++
			}
			
			if (value[e_value.PATH_OBJ] = tl)
			{
				save.usage_tl_path_save_id[save.usage_tl_path_amount] = save_id
				save.usage_tl_path_amount++
			}
			
			if (value[e_value.ATTRACTOR] = tl)
			{
				save.usage_tl_attractor_save_id[save.usage_tl_attractor_amount] = save_id
				save.usage_tl_attractor_amount++
			}
			
			if (value[e_value.IK_TARGET] = tl)
			{
				save.usage_tl_ik_target_save_id[save.usage_tl_ik_target_amount] = save_id
				save.usage_tl_ik_target_amount++
			}
			
			if (value[e_value.ROT_TARGET] = tl)
			{
				save.usage_tl_copy_rot_target_save_id[save.usage_tl_copy_rot_target_amount] = save_id
				save.usage_tl_copy_rot_target_amount++
			}
			
		    if (value[e_value.POS_TARGET] = tl)
			{
				save.usage_tl_copy_pos_target_save_id[save.usage_tl_copy_pos_target_amount] = save_id
				save.usage_tl_copy_pos_target_amount++
			}
			
			if (value[e_value.SCALE_TARGET] = tl)
			{
				save.usage_tl_copy_scale_target_save_id[save.usage_tl_copy_scale_target_amount] = save_id
				save.usage_tl_copy_scale_target_amount++
			}
			
			if (value[e_value.BEND_IK_TARGET] = tl)
			{
				save.usage_tl_bnd_ik_target_save_id[save.usage_tl_bnd_ik_target_amount] = save_id
				save.usage_tl_bnd_ik_target_amount++
			}
			
			if (value[e_value.IK_TARGET_ANGLE] = tl)
			{
				save.usage_tl_ik_target_angle_save_id[save.usage_tl_ik_target_angle_amount] = save_id
				save.usage_tl_ik_target_angle_amount++
			}
		}
		
		// Save references in keyframes
		usage_kf_texture_amount = 0
		usage_kf_path_amount = 0
		usage_kf_ik_target_amount = 0
		usage_kf_copy_rot_target_amount = 0
		usage_kf_copy_pos_target_amount = 0
		usage_kf_copy_scale_target_amount = 0
		usage_kf_ik_target_angle_amount = 0
		usage_kf_attractor_amount = 0
		with (obj_keyframe)
		{
			if (value[e_value.TEXTURE_OBJ] = tl)
			{
				save.usage_kf_texture_tl_save_id[save.usage_kf_texture_amount] = save_id_get(timeline)
				save.usage_kf_texture_index[save.usage_kf_texture_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_texture_amount++
			}
			
			if (value[e_value.PATH_OBJ] = tl)
			{
				save.usage_kf_path_tl_save_id[save.usage_kf_path_amount] = save_id_get(timeline)
				save.usage_kf_path_index[save.usage_kf_path_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_path_amount++
			}
			
			if (value[e_value.IK_TARGET] = tl)
			{
				save.usage_kf_ik_target_tl_save_id[save.usage_kf_ik_target_amount] = save_id_get(timeline)
				save.usage_kf_ik_target_index[save.usage_kf_ik_target_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_ik_target_amount++
			}
			
			if (value[e_value.ROT_TARGET] = tl)
			{
				save.usage_kf_copy_rot_target_tl_save_id[save.usage_kf_copy_rot_target_amount] = save_id_get(timeline)
				save.usage_kf_copy_rot_target_index[save.usage_kf_copy_rot_target_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_copy_rot_target_amount++
			}
			
			if (value[e_value.POS_TARGET] = tl)
			{
				save.usage_kf_copy_pos_target_tl_save_id[save.usage_kf_copy_pos_target_amount] = save_id_get(timeline)
				save.usage_kf_copy_pos_target_index[save.usage_kf_copy_pos_target_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_copy_pos_target_amount++
			}
			
			if (value[e_value.SCALE_TARGET] = tl)
			{
				save.usage_kf_copy_scale_target_tl_save_id[save.usage_kf_copy_scale_target_amount] = save_id_get(timeline)
				save.usage_kf_copy_scale_target_index[save.usage_kf_copy_scale_target_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_copy_scale_target_amount++
			}
			
			if (value[e_value.BEND_IK_TARGET] = tl)
			{
				save.usage_kf_bnd_ik_target_tl_save_id[save.usage_kf_bnd_ik_target_amount] = save_id_get(timeline)
				save.usage_kf_bnd_ik_target_index[save.usage_kf_bnd_ik_target_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_bnd_ik_target_amount++
			}
			
			if (value[e_value.IK_TARGET_ANGLE] = tl)
			{
				save.usage_kf_ik_target_angle_tl_save_id[save.usage_kf_ik_target_angle_amount] = save_id_get(timeline)
				save.usage_kf_ik_target_angle_index[save.usage_kf_ik_target_angle_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_ik_target_angle_amount++
			}
			
			if (value[e_value.ATTRACTOR] = tl)
			{
				save.usage_kf_attractor_tl_save_id[save.usage_kf_attractor_amount] = save_id_get(timeline)
				save.usage_kf_attractor_index[save.usage_kf_attractor_amount] = ds_list_find_index(timeline.keyframe_list, id)
				save.usage_kf_attractor_amount++
			}
		}
		
		// Pattern data
		pattern_type = ""
		
		if (tl.pattern_type != "" && tl.pattern_base_color != null)
		{
			pattern_type = tl.pattern_type
			pattern_base_color = tl.pattern_base_color
			pattern_pattern_list = array_copy_1d(tl.pattern_pattern_list)
			pattern_color_list = array_copy_1d(tl.pattern_color_list)
		}
		
		// Save tree recursively
		tree_amount = ds_list_size(tl.tree_list)
		for (var t = 0; t < tree_amount; t++)
			tree_save_obj[t] = history_save_tl(tl.tree_list[|t])
		
		// Save parts
		if (tl.part_list != null)
		{
			part_amount = ds_list_size(tl.part_list)
			for (var p = 0; p < part_amount; p++)
				part_save_id[p] = save_id_get(tl.part_list[|p])
		}
		else
			part_amount = 0
	}
	
	return save
}
