/// debug_info_draw()

function debug_info_draw()
{
	if (debug_info <= 0)
		return 0
	
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = window_height
	
	// Debug info
	var str = "";
	
	if (debug_info == 1)
	{
		str += "[F12] | FPS: " + string(fps) + " (" + string(fps_real) + ")\n"
	}
	else
	{
		str += "Performance: \n"
		str += "======================================= \n"
		str += "FPS: " + string(fps) + " \n"
		str += "FPS real: " + string(fps_real) + " \n"
		str += "delta: " + string(delta) + " \n"
		str += "\n"
	
		str += "Window: \n"
		str += "======================================= \n"
		str += "DPI: " + string(display_get_dpi_x()) + "," + string(display_get_dpi_y()) + " \n"
		str += "Size: " + string(window_width) + "," + string(window_height) + " \n"
		str += "window_busy: " + string(window_busy) + " \n"
		str += "window_focus: " + string(window_focus) + " \n"
		str += "current_step: " + string(current_step) + " \n"
		str += "\n"
	
		var userprofile = string_replace_all(string(environment_get_variable("USERPROFILE")), "/", "\\")
		var nodox_userprofile = string_replace_all(userprofile, string(environment_get_variable("USERNAME")), "?????")
		var nodox_project_file = string_replace_all(project_file, "/", "\\")
		var nodox_project_folder = string_replace_all(project_folder, "/", "\\")
		var nodox_working_directory = string_replace_all(working_directory, "/", "\\")
		var nodox_file_directory = string_replace_all(file_directory, "/", "\\")
	
		str += "Project: \n"
		str += "======================================= \n"
		str += "project_file: " + string_replace_all(nodox_project_file, userprofile, nodox_userprofile) + " \n"
		str += "project_folder: " + string_replace_all(nodox_project_folder, userprofile, nodox_userprofile) + " \n"
		str += "working_directory: " + string_replace_all(nodox_working_directory, userprofile, nodox_userprofile) + " \n"
		str += "file_directory: " + string_replace_all(nodox_file_directory, userprofile, nodox_userprofile) + " \n"
		str += "\n"
	
		str += "instance_count: " + string(instance_count) + " \n"
		str += "render_world() calls: " + string(render_world_count) + " \n"
		str += "Vertex buffer triangles: " + string(get_vertex_buffer_triangles()) + " \n"
		str += "Vertex buffer render calls: " + string(get_vertex_buffer_render_calls()) + " \n"
		str += "Primitive lines: " + string(get_primitive_lines()) + " \n"
		str += "Primitive triangles: " + string(get_primitive_triangles()) + " \n"
		str += "Primitive render calls: " + string(get_primitive_render_calls()) + " \n"
		str += "\n"
	
		if (dev_mode)
		{
			str += "[F7]: Reload Minecraft assets" + " \n"
			str += "[F9]: Open file directory" + " \n"
			str += "[F10]: Open working directory" + " \n"
			str += "[F11]: Open log file" + " \n"
		}
		str += "[F12 to disable]"
	}
	
	var w = string_width_font(str, font_label) + 16;
	var h = string_height_font(str, font_label) + 16;
	var xx = debug_info_corner mod 2 == 0 ? 8 : window_width - w - 8;
	var yy = debug_info_corner < 2 ? 8 : window_height - h - 8;
	var tx = xx + 8
	var ty = yy + h - 8
	var mouseon = app_mouse_box(xx, yy, w, h);
	
	draw_box(xx, yy, w, h, false, c_black, mouseon ? .5675 : .75) //window_width - w - 8
	draw_label(str, tx, ty, fa_left, fa_bottom, c_white, mouseon ? .75 : 1, font_label)
}
