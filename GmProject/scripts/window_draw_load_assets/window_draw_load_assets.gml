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
	
	var xoff, yoff;
	xoff = floor((window_width/2) - (740/2))
	yoff = floor((window_height/2) - (450/2))
	
	content_x = 28
	content_y = 28
	content_width = window_width - 56
	content_height = window_height - 56
	
	draw_dropshadow(xoff, yoff, 740, 450, c_accent, 1)
	draw_image(spr_jonathan_splash, 0, xoff + (740/2), yoff + 100)
	
	draw_box(xoff, yoff, 740, 450, false, c_level_middle, 1)
	draw_sprite_ext(spr_startupasset_gradient, 0, xoff, yoff, 1, 1, 0, merge_color(c_accent, c_white, 0.2), .5)
	
	// Pattern
	var pattern = (setting_theme = theme_light ? 0 : 1);
	draw_sprite_ext(spr_pattern_left, pattern, xoff - 138/4, yoff, 138 / sprite_get_width(spr_pattern_left), 450 / sprite_get_height(spr_pattern_left), 0, c_white, 1)
	
	draw_sprite(spr_load_assets, 0, xoff + 95, yoff + 207)
	draw_set_font(font_splash_bold_big);
	draw_set_font(font_splash_bold)
	draw_set_font(font_splash_bold_secondary);
		
	draw_label("Mine-imator " + string(mineimator_version), xoff + 95, yoff + 289,fa_middle, fa_bottom, c_text_main, a_text_main, font_splash_bold)
	draw_label(string(string_upper(mineimator_version_sub)), xoff + 95, yoff + 289 + 12, fa_middle, fa_bottom, c_accent, a_accent, font_splash_bold_secondary)
	draw_label(string(string_upper(mineimator_version_extra)), xoff + 95, yoff + 289 + 28, fa_middle, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
	
	draw_label(text_get("startuploadingassets"), xoff + 12, yoff +418, fa_left, fa_bottom, c_text_main, a_text_main, font_splash_bold_big)
	draw_label(string(string_upper(minecraft_version)), xoff + 12, yoff + 435, fa_left, fa_bottom, c_accent, a_accent, font_splash_bold_big)
	draw_label(string(floor(load_assets_progress * 100)) + "%", xoff + 180, yoff + 435, fa_right, fa_bottom, c_text_main, a_text_main, font_splash_bold_big)

	// Splash
	if (load_assets_splash != null)
		draw_sprite(load_assets_splash, 0, xoff + 190, yoff)
	else
		draw_box(xoff + 190, yoff, 550, 450, false, c_level_bottom, 1)
	
	if (load_assets_splash = null || sprite_get_width(load_assets_splash) = 550)
		draw_gradient(xoff + 190, yoff, shadow_size, 450, c_black, shadow_alpha, 0, 0, shadow_alpha)
	
	// Splash credits
	if (load_assets_credits != "")
	{
		draw_label(text_get("startupsplashauthor"), xoff + 95, yoff + 289 + 34, fa_middle, fa_top, c_text_main, a_text_main, font_splash_bold)
		draw_label(load_assets_credits, xoff + 95, yoff + 289 + 50, fa_middle, fa_top, c_accent, a_accent, font_splash_bold)
	}
	
	if (dev_mode)
		draw_label("DEV MODE ENABLED", xoff + 95, yoff + 4, fa_middle, fa_top, c_accent, 1, font_heading_big)
	
	draw_box(xoff, yoff + 450 - 8, 740, 8, false, c_level_top, .8)
	draw_box(xoff, yoff + 450 - 8, 740 * load_assets_progress, 8, false, c_accent, 1)
	
	draw_outline(xoff, yoff, 740, 450, 1, c_border, a_border, true)
	draw_dropshadow(xoff, yoff, 740, 450, c_black, 1)
	
	current_step++
}
