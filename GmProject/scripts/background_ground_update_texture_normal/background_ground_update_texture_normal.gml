/// background_ground_update_texture_normal()
/// @desc Updates the ground sprite depending on the chosen slot and texture.

function background_ground_update_texture_normal()
{
	if (!background_ground_tex_normal.ready || (background_ground_slot = background_ground_slot_normal && background_ground_tex_normal.save_id = background_ground_tex_normal_prev))
		return 0
	
	background_ground_slot_normal = background_ground_slot
	background_ground_tex_normal_prev = background_ground_tex_normal.save_id
	
	// Clear old
	if (background_ground_normal_ani)
	{
		if (background_ground_ani_tex_normal[0] != null)
			for (var f = 0; f < block_sheet_ani_frames; f++)
				texture_free(background_ground_ani_texture_normal[f])
	}
	else if (background_ground_texture_normal != null)
		texture_free(background_ground_texture_normal)
	
	var size, bx, by, surf, tex;
	
	// In static block list
	if (background_ground_slot < ds_list_size(mc_assets.block_texture_list))
	{
		background_ground_normal_ani = false
		size = ceil(texture_width(background_ground_tex_normal.block_sheet_tex_normal) / block_sheet_width)
		bx = (background_ground_slot mod block_sheet_width) * size
		by = (background_ground_slot div block_sheet_width) * size
	}
	
	// In animated block list
	else
	{
		// Static block sheet only
		if (background_ground_tex_normal.block_sheet_ani_tex_normal = null)
		{
			background_ground_normal_ani = false
			background_ground_texture_normal = sprite_duplicate(spr_default_normal)
			return 0
		}
		
		var slot = background_ground_slot - ds_list_size(mc_assets.block_texture_list);
		background_ground_normal_ani = true
		size = ceil(texture_width(background_ground_tex_normal.block_sheet_ani_tex_normal[0]) / block_sheet_ani_width)
		bx = (slot mod block_sheet_ani_width) * size
		by = (slot div block_sheet_ani_width) * size
	}
	
	draw_texture_start()
	surf = surface_create(size, size)
	surface_set_target(surf)
	{
		// Animated
		if (background_ground_normal_ani)
		{
			for (var f = 0; f < block_sheet_ani_frames; f++)
			{
				draw_clear_alpha(c_black, 0)
				draw_texture_part(background_ground_tex_normal.block_sheet_ani_tex_normal[f], 0, 0, bx, by, size, size)
				background_ground_ani_texture_normal[f] = texture_surface(surf)
			}
		}
		
		// Static
		else
		{
			draw_clear_alpha(c_black, 0)
			draw_texture_part(background_ground_tex_normal.block_sheet_tex_normal, 0, 0, bx, by, size, size)
			background_ground_texture_normal = texture_surface(surf)
		}
	}
	surface_reset_target()
	surface_free(surf)
	draw_texture_done()
}
