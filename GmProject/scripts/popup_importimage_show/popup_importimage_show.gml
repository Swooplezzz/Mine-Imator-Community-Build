/// popup_importimage_show(filename)
/// @arg filename

function popup_importimage_show(fn)
{
	with (popup_importimage)
	{
	    filename = filenames[|0];
		if (texture != null)
			texture_free(texture)
		
		texture = texture_create(filename)
	}
	
	popup_show(popup_importimage)
}
