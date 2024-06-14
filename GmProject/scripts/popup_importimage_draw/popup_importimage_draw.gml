/// popup_importimage_draw()

function popup_importimage_draw()
{
	// Preview
	var previewsize, previewx, previewy, texwid, texhei, scale;
	previewsize = 256
	previewx = floor((content_x - (dx - content_x)) + content_width - previewsize)
	previewy = dy
	texwid = texture_width(popup.texture)
	texhei = texture_height(popup.texture)
	scale = max(texwid / previewsize, texhei / previewsize)
	
	draw_box(previewx, previewy, previewsize, previewsize, false, c_level_bottom, 1)
	draw_texture(popup.texture, previewx + ((previewsize / 2) - ((texwid / scale) / 2)), dy + ((previewsize / 2) - ((texhei / scale) / 2)), 1 / scale, 1 / scale)
	
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
	
	tab_control(80)
	tab_next(false)
	
	// Ok
	tab_control_button_label()

	if (ds_list_size(popup.filenames) > 1 || !is_cpp())
		draw_checkbox("importimagedoall", dx, dy, popup.do_all, action_toolbar_importimage_do_all)
	
	if (draw_button_label("importimageok", dx + dw, dy, null, null, e_button.PRIMARY, null, e_anchor.RIGHT))
	{
		if (popup.type = e_res_type.ITEM_SHEET)
			popup_importitemsheet_show(popup.filename, null)
		else
		{
			if(popup.do_all){
				for(var i = 0; i < ds_list_size(popup.filenames); i++){
					action_res_image_load(popup.filenames[i], popup.type)
				}
			}
			else{
			action_res_image_load(popup.filename, popup.type)
			}
			
			if (ds_list_size(popup.filenames) <= 1)
				popup_close()
		}
		
		if (ds_list_size(popup.filenames) > 1)
		{
			ds_list_delete(popup.filenames, 0)
			popup_importimage_show(popup.filenames[|0])
			show_debug_message("New popup")
		}
	}
	tab_next()
}
