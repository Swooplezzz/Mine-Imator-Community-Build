///action_recent_search(search);
function action_recent_search(search){
	if (history_undo)
	{
		with (history_data)
		{
			app.search_string = save_var_old_value[0]
			app.tbx_recent_search.text = app.search_string
		}
	}
	else if (history_redo)
	{
		with (history_data)
		{
			app.search_string = save_var_new_value[0]
			app.tbx_recent_search.text = app.search_string
		}
	}
	else
	{
		var hobj = history_save_var_start(action_recent_search, true);
		
		with (hobj)
			history_save_var(app, app.search_string, search)
		
		app.search_string = search
	}
	
	recent_update()
}