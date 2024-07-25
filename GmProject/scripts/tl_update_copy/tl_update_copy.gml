/// tl_update_copy(parts)
/// @arg parts

function tl_update_copy(parts)
{
	if (array_length(parts) = 0)
		return 0
	
	// Recursivly update IK data, break if positions are done moving
	repeat (2)
	{
		var update = false
		
		for (var i = 0; i < array_length(parts); i++)
		{
			with (parts[i])
			{
				if (update_matrix)
				{
					update = true
					tl_update_matrix(false, false, false, true)
				}
			}
		}
		
		if (!update)
			break
	}
}

function do_copy(tl)
{
	if (tl = null)
		return 0

	tl.update_matrix = true
	return 0
}
