/// history_restore_lightgroup(save)
/// @arg save

function history_restore_lightgroup(save)
{
	var temp = new_obj(obj_lightgroup);
	
	temp.name = save.name
	
	with (temp)
		save_id = save.save_id
	
	for (var s = 0; s < save.usage_light_group_amount; s++)
		with (save_id_find(save.usage_light_group_save_id[s]))
			light_group = temp
	
	return temp
}