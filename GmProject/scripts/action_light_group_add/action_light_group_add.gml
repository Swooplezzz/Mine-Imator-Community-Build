// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_light_group_add(){
	if (history_undo)
	{
		with (history_data)
		{
			
			light_group_edit = temp_save_obj
			history_data.temp_save_obj = history_save_lightgroup(temp_save_obj)
			ds_list_delete_value(app.light_groups, light_group_edit);
		    sortlist_remove(app.tab.lightgroups.list, light_group_edit);
			
			with(light_group_edit)
			instance_destroy()
			light_group_edit = null
		}
	}
	else
	{
		var hobj, tl;
		hobj = null
		
		if (history_redo)
		{
		    var obj = history_restore_lightgroup(history_data.temp_save_obj)
		    ds_list_add(light_groups, obj);
		    sortlist_add(tab.lightgroups.list, obj);
			history_data.temp_save_obj = obj
		}
		else
		{
			var obj = new_obj(obj_lightgroup);
		    ds_list_add(light_groups, obj);
		    sortlist_add(tab.lightgroups.list, obj);
			hobj = history_set(action_light_group_add)
			hobj.temp_save_obj = obj;
		}
    }

}