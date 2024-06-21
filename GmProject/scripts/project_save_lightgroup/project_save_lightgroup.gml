// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function project_save_lightgroup(){
	json_save_object_start()
	
		json_save_var("id", save_id)
		
		json_save_var("name", json_string_encode(name))
		
	json_save_object_done()
}