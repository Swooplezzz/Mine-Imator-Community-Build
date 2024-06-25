/// history_save_lightgroup(temp)
/// @arg temp

function history_save_lightgroup(temp)
{
	var save = new_obj(obj_history_save);
	save.hobj = id
	
	save.name = temp.name;
	
	with (save)
		save_id = temp.save_id
	
	save.usage_light_group_amount = 0
	
	with (obj_timeline)
	{
		if (light_group = temp)
		{
			save.usage_light_group_save_id[save.usage_light_group_amount] = save_id
			save.usage_light_group_amount++
		}	
	}
	
	return save
}
