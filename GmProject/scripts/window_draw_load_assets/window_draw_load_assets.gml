/// window_draw_load_assets()

function window_draw_load_assets()
{
	if (!minecraft_assets_load())
	{
		error("errorloadassets")
		game_end()
		return 0
	}
	
	// Background
	draw_clear(c_level_top)
	
	if (load_assets_stage = "done")
	{
		load_assets_stage = "exit"
		return 0
	}
	else if (load_assets_stage = "exit")
	{
		window_state = "startup"
		app_startup_interface()
		
		// Deactivate instances for better performance
		instance_deactivate_object(obj_deactivate)
		
		return 0
	}
	
	var screenwid, screenhei, splashwid;
	screenwid = 740
	screenhei = 450
	splashwid = 550
	
	var xoff, yoff;
	xoff = floor((window_width/2) - (screenwid/2))
	yoff = floor((window_height/2) - (screenhei/2))
	
	content_x = 28
	content_y = 28
	content_width = window_width - 56
	content_height = window_height - 56
	
	draw_gradient(0, 0, window_width, window_height - (yoff + 425), c_black, 1, 1, 0, 0)
	draw_gradient(0, yoff + 400, window_width, 25, c_viewport_top, 0, 0, 1, 1)
	draw_gradient(0, yoff + 425, window_width, window_height - (yoff + 425), c_viewport_top, 1, 1, 0.25, 0.25)
	
	draw_image(spr_icons, icons.GHOST, xoff + 1300, yoff - 260, 1, 1, c_text_secondary, a_text_secondary, 0)
	draw_dropshadow(xoff, yoff, screenwid, screenhei, c_accent, 1)
	draw_box(xoff, yoff, screenwid, screenhei, false, c_level_middle, 1)
	
	draw_sprite_ext(spr_startupasset_gradient, 0, xoff, yoff, 1, 1, 0, merge_color(c_accent, c_white, 0.2), .5)
	
	// Pattern
	var pattern = (setting_theme = theme_light ? 0 : 1);
	draw_sprite_ext(spr_pattern_left, pattern, xoff - 138/4, yoff, 138 / sprite_get_width(spr_pattern_left), screenhei / sprite_get_height(spr_pattern_left), 0, c_white, 1)
	
	draw_sprite(spr_load_assets, 0, xoff + 95, yoff + 207)
	draw_set_font(font_splash_bold_big);
	draw_set_font(font_splash_bold)
	draw_set_font(font_splash_bold_secondary);
		
	draw_label("Mine-imator " + string(mineimator_version), xoff + 95, yoff + 289, fa_middle, fa_bottom, c_text_main, a_text_main, font_splash_bold)
	draw_label(string(string_upper(mineimator_version_sub)), xoff + 95, yoff + 289 + 12, fa_middle, fa_bottom, c_accent, a_accent, font_splash_bold_secondary)
	draw_label(string(string_upper(mineimator_version_extra)), xoff + 95, yoff + 289 + 28, fa_middle, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
	
	draw_label(text_get("startuploadingassets"), xoff + 12, yoff + 418, fa_left, fa_bottom, c_text_main, a_text_main, font_splash_bold_big)
	draw_label(string(string_upper(minecraft_version)), xoff + 12, yoff + 435, fa_left, fa_bottom, c_accent, a_accent, font_splash_bold_big)
	draw_label(string(floor(load_assets_progress * 100)) + "%", xoff + 180, yoff + 435, fa_right, fa_bottom, c_text_main, a_text_main, font_splash_bold_big)
	
	draw_gradient(xoff + 190, yoff, shadow_size * 2, screenhei, c_black, shadow_alpha * 2, 0, 0, shadow_alpha * 2)
	draw_gradient(xoff + 190, yoff, screenwid - 190, shadow_size * 2, c_black, shadow_alpha * 2, shadow_alpha * 2, 0, 0)
	
	// Splash
	if (load_assets_splash != null)
	{
		var texwid, texhei;
		texwid = sprite_get_width(load_assets_splash)
		texhei = sprite_get_height(load_assets_splash)
		
		// Too big for screen, scale down
		var scale = 1
		if (texwid > splashwid || texhei > screenhei)
			scale = max(texwid / splashwid, texhei / screenhei)
		
		draw_sprite_ext(load_assets_splash, 0, xoff + 190 + (275 - ((texwid / scale) / 2)), yoff + (225 - ((texhei / scale) / 2)), 1 / scale, 1 / scale, 0, c_white, 1)
	}
	
	// Splash credits
	if (load_assets_credits != "")
	{
		draw_label(text_get("startupsplashauthor"), xoff + 95, yoff + 289 + 34, fa_middle, fa_top, c_text_main, a_text_main, font_splash_bold)
		draw_label(load_assets_credits, xoff + 95, yoff + 289 + 50, fa_middle, fa_top, c_accent, a_accent, font_splash_bold)
	}
	
	if (dev_mode)
		draw_label("DEV MODE ENABLED", xoff + 95, yoff + 4, fa_middle, fa_top, c_accent, 1, font_heading_big)
	
	// Loading bar
	draw_box(xoff, yoff + screenhei - 8, screenwid, 8, false, c_level_top, .8)
	draw_box(xoff, yoff + screenhei - 8, screenwid * load_assets_progress, 8, false, c_accent, 1)
	
	draw_outline(xoff, yoff, screenwid, screenhei, 1, c_border, a_border, true)
	draw_dropshadow(xoff, yoff, screenwid, screenhei, c_black, 1)
	
	current_step++
}
