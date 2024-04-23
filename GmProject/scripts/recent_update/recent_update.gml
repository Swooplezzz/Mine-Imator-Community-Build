/// recent_update()
/// @desc Updates the recent model display list

function recent_update()
{
	var pinnedlist = ds_list_create();
	var unpinnedlist = ds_list_create();
	
	var itemslist = ds_list_create();
	ds_list_copy(itemslist, recent_list)
	
	// Separate recent items into separate lists
	for (var i = 0; i < ds_list_size(itemslist); i++)
	{
		var item = itemslist[|i];
		
		if (item.remove)
		{
			ds_list_delete(recent_list, i)
			instance_destroy(item)
			continue
		}
		
		if (item.pinned)
			ds_list_add(pinnedlist, item)
		else
			ds_list_add(unpinnedlist, item)
	}
	ds_list_clear(recent_list_display)
	
	// Sort lists separately
	recent_update_sort(pinnedlist)
	recent_update_sort(unpinnedlist)
	
	// Put them back together
	for (var i = 0; i < ds_list_size(pinnedlist); i++)
	{
		if (recent_search = "" || string_contains(string_upper(filename_name(pinnedlist[|i].name)), string_upper(recent_search)))
			ds_list_add(recent_list_display, pinnedlist[|i])
	}
	
	for (var i = 0; i < ds_list_size(unpinnedlist); i++)
	{
		if (recent_search = "" || string_contains(string_upper(filename_name(unpinnedlist[|i].name)), string_upper(recent_search)))
			ds_list_add(recent_list_display, unpinnedlist[|i])
	}
	
	recent_list_amount_search = ds_list_size(recent_list_display)
	recent_list_amount = ds_list_size(unpinnedlist) + ds_list_size(pinnedlist)
	
	// Cleanup
	ds_list_destroy(pinnedlist)
	ds_list_destroy(unpinnedlist)
	ds_list_destroy(itemslist)
}
