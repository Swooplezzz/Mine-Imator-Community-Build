/// temp_set_scenery(res, animate, [historyobject])
/// @arg res
/// @arg animate
/// @arg [historyobject]

function temp_set_scenery(res, animate, hobj)
{
	if (scenery != null)
		scenery.count--
	
	// Save and remove old timelines
	with (obj_timeline)
	{
		if (temp != other.id || part_list = null)
			continue
		
		var root = id;
		
		// Go through parts
		for (var p = 0; p < ds_list_size(part_list); p++)
		{
			with (part_list[|p])
			{
				// Save non-part children
				if (hobj != null)
				{
					for (var t = 0; t < ds_list_size(tree_list); t++)
					{
						with (tree_list[|t])
						{
							if (part_of != null)
								continue
							
							with (hobj)
							{
								part_child_save_id[part_child_amount] = other.save_id
								part_child_parent_save_id[part_child_amount] = other.parent.save_id
								part_child_parent_tree_index[part_child_amount] = t
								part_child_amount++
							}
						}
					}
				}
				
				// Relocate non-part children
				for (var t = 0; t < ds_list_size(tree_list); t++)
				{
					with (tree_list[|t])
					{
						if (part_of = null)
						{
							tl_set_parent(root)
							t--
						}
					}
				}
				
				// Save and relocate non-part sub-children
				if (part_list != null)
				{
					for (var sp = 0; sp < ds_list_size(part_list); sp++)
					{
						with (part_list[|sp])
						{
							// Save
							if (hobj != null)
							{
								for (var t = 0; t < ds_list_size(tree_list); t++)
								{
									with (tree_list[|t])
									{
										if (part_of != null)
											continue
										
										with (hobj)
										{
											part_child_save_id[part_child_amount] = other.save_id
											part_child_parent_save_id[part_child_amount] = other.parent.save_id
											part_child_parent_tree_index[part_child_amount] = t
											part_child_amount++
										}
									}
								}
							}
							
							// Relocate
							for (var t = 0; t < ds_list_size(tree_list); t++)
							{
								with (tree_list[|t])
								{
									if (part_of == null)
									{
										tl_set_parent(root)
										t--
									}
								}
							}
						}
					}
				}
				
				with (hobj)
					part_save_obj[part_amount++] = history_save_tl(other.id)
			}
		}
		
		// Destroy
		while (ds_list_size(part_list) > 0)
			tl_remove_clean(part_list[|0])
		
		with (obj_timeline)
			if (delete_ready)
				instance_destroy()
		
		ds_list_clear(part_list)
	}
	
	scenery = res
	
	if (scenery != null)
	{
		scenery.count++
		
		if (animate)
		{
			// Create new timelines
			with (obj_timeline)
			{
				if (temp != other.id)
					continue
				
				if (temp.scenery.ready)
					tl_animate_scenery()
				else
					scenery_animate = true
			}
		}
		
		if (scenery.ready)
		{
			temp_update_display_name()
			temp_update_rot_point()
			with (app)
				tl_update_matrix()
		}
	}
}
