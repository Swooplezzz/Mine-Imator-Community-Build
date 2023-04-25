/// project_load_startup()
/// @desc Loads a selected project on startup.

function project_load_startup()
{
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