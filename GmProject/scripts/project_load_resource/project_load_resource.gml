/// project_load_resource(map)
/// @arg map

function project_load_resource(argument0)
{
	var map = argument0;
	
	if (!ds_map_valid(map))
		return 0
	
	with (new_obj(obj_resource))
	{
		loaded = true
		load_id = value_get_string(map[?"id"], save_id)
		save_id_map[?load_id] = load_id
		
		var typestr = value_get_string(map[?"type"]);
		
		if (load_format < e_project.FORMAT_200_PRE_5)
		{
			if (typestr = "schematic")
				typestr = "scenery"
		}
		
		type = ds_list_find_index(res_type_name_list, typestr)
		
		filename = value_get_string(map[?"filename"], filename)
		
		if (type = e_res_type.SKIN || type = e_res_type.DOWNLOADED_SKIN)
			player_skin = value_get_real(map[?"player_skin"], player_skin)
		
		if (type = e_res_type.ITEM_SHEET)
			item_sheet_size = value_get_point2D(map[?"item_sheet_size"], item_sheet_size)
		
		if (type = e_res_type.SCENERY || type = e_res_type.FROM_WORLD)
		{
			scenery_tl_add = value_get_real(map[?"scenery_tl_add"], true)
			scenery_download_skins = value_get_real(map[?"scenery_download_skins"], false)
		}
		
		if (type = e_res_type.SCENERY)
		{
			scenery_palette = value_get_real(map[?"scenery_palette"], scenery_palette)
			scenery_integrity = value_get_real(map[?"scenery_integrity"], scenery_integrity)
			scenery_integrity_invert = value_get_real(map[?"scenery_integrity_invert"], scenery_integrity_invert)
			scenery_randomize = value_get_real(map[?"randomize"], scenery_randomize)
		}
		
		if (type = e_res_type.FROM_WORLD)
		{
			world_regions_dir = value_get_string(map[?"world_regions_dir"])
			world_box_start = value_get_point3D(map[?"world_box_start"])
			world_box_end = value_get_point3D(map[?"world_box_end"])
			world_filter_mode = value_get_real(map[?"world_filter_mode"])
			world_filter_array = array()
			var filterlist = map[?"world_filter_array"]
			if (ds_list_valid(filterlist))
				for (var i = 0; i < ds_list_size(filterlist); i++)
					array_add(world_filter_array, filterlist[|i])
		}
		
		material_format = value_get_real(map[?"material_format"], material_format)
		
		sortlist_add(app.res_list, id)
	}
}
