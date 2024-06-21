/// project_save_objects()

function project_save_objects()
{
	// Templates
	json_save_array_start("templates")
	for (var i = 0; i < ds_list_size(lib_list.list); i++)
		with (lib_list.list[|i])
			if (save)
				project_save_template()
	json_save_array_done()
	
	// Timelines
	json_save_array_start("timelines")
	with (obj_timeline)
		if (save)
			project_save_timeline()
	json_save_array_done()
	
	//Light Groups
	json_save_array_start("lightgroups")
	for (var i = 0; i < ds_list_size(light_group_list.list); i++)
		with (light_group_list.list[|i])
			if (save)
				 project_save_lightgroup()
	json_save_array_done()
	
	// Resources
	json_save_array_start("resources")
	for (var i = 0; i < ds_list_size(res_list.list); i++)
		with (res_list.list[|i])
			if (id != mc_res && save)
				project_save_resource()
	json_save_array_done()
}
