// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_light_group_name(name)
{
	if (!history_undo && !history_redo)
		history_set_var(action_light_group_name, light_group_edit.name, name, true)
	
	with (light_group_edit)
	{
		id.name = name
	}
}