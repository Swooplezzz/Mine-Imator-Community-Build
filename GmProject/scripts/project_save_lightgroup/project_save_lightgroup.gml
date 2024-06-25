/// project_save_lightgroup()

function project_save_lightgroup()
{
	json_save_object_start()
		json_save_var("id", save_id)
		json_save_var("name", json_string_encode(name))	
	json_save_object_done()
}