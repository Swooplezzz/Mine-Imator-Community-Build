/// tl_update_part_list(part, parent)
/// @arg part
/// @arg parent
/// @desc Sets the model parts and hierarchy of the timelines.

function tl_update_part_list(part, par)
{
	for (var mp = 0; mp < ds_list_size(part.part_list); mp++)
	{
		var mpart = part.part_list[|mp];
		
		// Find timeline with name
		var tl = tl_part_find(mpart.name);
		with (tl)
		{
			model_part = mpart
			lock_bend = mpart.lock_bend
			part_mixing_shapes = mpart.part_mixing_shapes
			bend_model_part_last = null
			tl_set_parent(par)
			tl_update_value_types()
			tl_update_type_name()
			tl_update_display_name()
			tl_update_model_shape()
		}
		
		// Recurse for this part
		if (tl != null && mpart.part_list != null)
			tl_update_part_list(mpart, tl)
	}
}
