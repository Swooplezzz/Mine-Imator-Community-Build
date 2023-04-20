// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function project_load_startup(){
	project_startup_fn = ""
	
	for (var i = 0; i < parameter_count(); i++)
	{
		var p, ext;
		p = parameter_string(i)
		ext = filename_ext(p)
		
		for (var j = 0; j <= 9; j++)
			ext = string_replace(ext, string(j), "")
			

		if (ext = ".miproject")
		{
			project_startup_fn = p
			return 0
		}
	}
}