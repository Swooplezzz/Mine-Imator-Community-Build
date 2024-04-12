/// action_toolbar_import_asset()

function action_toolbar_import_asset()
{
	var fn = file_dialog_open_asset();
	var path_array = string_split(fn, "\n");
	var path_array_count = array_length(path_array);
	show_debug_message("File count: " + string(path_array_count))

	if (path_array_count = 0)
		return false
	
	for (var i = 0; i < path_array_count; i += 1)
	{
<<<<<<< HEAD

=======
		show_debug_message("Starting import: " + string(path_array[i]))
>>>>>>> origin/main
	    asset_load(path_array[i])
	}
}