/// popup_importimage_show(filename)
/// @arg filename

function popup_importimage_show(fn, script = null)
{
	with (popup_importimage)
	{
		if (texture != null)
			texture_free(texture)
		
	    filename = filenames[|0];
		value_script = script
		
		texture = texture_create(filename)
		is_sheet = true
		sheet_size = vec2(item_sheet_width, item_sheet_height)
		if (texture_width(texture) < item_size * 8 || texture_height(texture) < item_size * 8) // Probably too small to be a sheet
			is_sheet = false
		else if (texture_width(texture) = texture_height(texture)) // Square, probably old sheet
			sheet_size = vec2(16, 16)
		sheet_size_def = array_copy_1d(sheet_size)
	}
	
	popup_show(popup_importimage)
}
