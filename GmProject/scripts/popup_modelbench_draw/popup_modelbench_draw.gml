/// popup_modelbench_draw()

function popup_modelbench_draw()
{
	dy += 8
	
	// Screenshot
	draw_image(spr_modelbench_ad, 0, dx + dw / 2, dy)
	dy += sprite_get_height(spr_modelbench_ad) + 8
	
	// Info
	draw_label(string_limit_ext(text_get("modelbenchinfo"), dw + 24, dh), dx + dw / 2, dy, fa_center, fa_top, c_text_main, a_text_main, font_value)
	dy += 34 + 30
	
	draw_set_font(font_button)
	var buttonx = string_width(text_get("modelbenchdownload")) + button_padding;
	
	tab_control_button_label()
	
	// Download
	if (draw_button_label("modelbenchdownload", dx + dw - buttonx, dy))
	{
		open_url(link_modelbench)
		popup_close()
	}
	
	// Not now
	buttonx += 12 + (string_width(text_get("modelbenchnotnow")) + button_padding)
	if (draw_button_label("modelbenchnotnow", dx + dw - buttonx, dy, null, null, e_button.SECONDARY))
		popup_close()
	
	// Don't show again
	if (draw_checkbox("modelbenchdontshow", dx, dy + 4, popup_modelbench.hidden, null))
		popup_modelbench.hidden = !popup_modelbench.hidden
	
	tab_next()
}
