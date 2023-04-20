/// sortlist_remove(sortlist, value)
/// @arg sortlist
/// @arg value
/// @desc Removes the given value from the sortlist

function sortlist_remove(sl, value)
{
	var index = ds_list_find_index(sl.list, value);
	
	if (index < 0)
		return null
	
	ds_list_delete(sl.list, index)
	ds_list_delete(sl.display_list, ds_list_find_index(sl.display_list, value))
	
	index = min(ds_list_size(sl.list) - 1, index)
	if (index < 0)
		return null
	
	return sl.list[|index]
}
