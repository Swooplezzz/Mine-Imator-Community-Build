/// popup_importimage_draw()

function popup_importimage_draw()
{

	with (popup_importimage)
	{
	    filename = filenames[|0];
		if (texture != null)
			texture_free(texture)
		
		texture = texture_create(filename)

	}
	draw_image_box_cover(popup.texture,  dx + dw - 130, dy+24, 128, 128);
	// Info
	draw_label(text_get("importimagetype") + ":", dx, dy + 14, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_label)
	dy += 28
	
	tab_control_checkbox()
	draw_radiobutton("importimageskin", dx, dy, e_res_type.SKIN, popup.type = e_res_type.SKIN, action_toolbar_importimage_type)
	tab_next()
	
	tab_control_checkbox()
	draw_radiobutton("importimageitemsheet", dx, dy, e_res_type.ITEM_SHEET, popup.type = e_res_type.ITEM_SHEET, action_toolbar_importimage_type)
	tab_next()
	
	tab_control_checkbox()
	draw_radiobutton("importimageblocksheet", dx, dy, e_res_type.BLOCK_SHEET, popup.type = e_res_type.BLOCK_SHEET, action_toolbar_importimage_type)
	tab_next()
	
	tab_control_checkbox()
	draw_radiobutton("importimageparticlesheet", dx, dy, e_res_type.PARTICLE_SHEET, popup.type = e_res_type.PARTICLE_SHEET, action_toolbar_importimage_type)
	tab_next()
	
	tab_control_checkbox()
	draw_radiobutton("importimagetexture", dx, dy, e_res_type.TEXTURE, popup.type = e_res_type.TEXTURE, action_toolbar_importimage_type)
	tab_next()
	tab_control_checkbox()
	draw_checkbox("importimagedoall", dx, dy, popup.do_all, action_toolbar_importimage_do_all)
	// Ok
	tab_control_button_label()
	if (draw_button_label("importimageok", dx + dw, dy, null, null, e_button.PRIMARY, null, e_anchor.RIGHT))
	{
		if (popup.type = e_res_type.ITEM_SHEET)
			popup_importitemsheet_show(popup.filename, null)
		else
		{
			action_res_image_load(popup.filename, popup.type)
			if(ds_list_size(popup.filenames) = 1)
			popup_close()
		}

		if(ds_list_size(popup.filenames) > 1){
			ds_list_delete(popup.filenames,0);
			popup_show(popup);
			show_debug_message("new popup");
		}
	}
	tab_next()
}
