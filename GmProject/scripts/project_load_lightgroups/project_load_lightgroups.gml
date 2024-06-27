/// project_load_lightgroups(map)
/// @arg map

function project_load_lightgroups(map)
{
	if (!ds_map_valid(map))
		return 0
	
	with (new_obj(obj_lightgroup))
	{
		loaded = true
		load_id = value_get_string(map[?"id"], save_id)
		save_id_map[?load_id] = load_id
		name = value_get_string(map[?"name"], name)
		sortlist_add(app.light_group_list, id)
	}
}