// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tl_update_flw(parts)
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
					tl_update_matrix(false, false, false)
				}
			}
		}
		
		if (!update)
			break
	}
}

function do_flw(tl)
{
	if (tl = null)
		return 0

	tl.update_matrix = true
	return 0
}
