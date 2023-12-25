/// debug_info_draw()

function debug_info_draw()
{
	if (!debug_info)
		return 0
	
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = window_height
	
	// Debug info
	var str = "";
	
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
	
	var nodox_userprofile = string_replace(string(environment_get_variable("USERPROFILE")), string(environment_get_variable("USERNAME")), "*****")
	var nodox_project_file = string_replace(project_file, string(environment_get_variable("USERPROFILE")), nodox_userprofile)
	var nodox_project_folder = string_replace(project_folder, string(environment_get_variable("USERPROFILE")), nodox_userprofile)
	var nodox_working_directory = string_replace(working_directory, string(environment_get_variable("USERPROFILE")), nodox_userprofile)
	var nodox_file_directory = string_replace(file_directory, string(environment_get_variable("USERPROFILE")), nodox_userprofile)
	
	str += "Project: \n"
	str += "======================================= \n"
	str += "project_file: " + nodox_project_file + " \n"
	str += "project_folder: " + nodox_project_folder + " \n"
	str += "working_directory: " + nodox_working_directory + " \n"
	str += "file_directory: " + nodox_file_directory + " \n"
	str += "\n"
	
	str += "instance_count: " + string(instance_count) + " \n"
	str += "render_world() calls: " + string(render_world_count) + " \n"
	str += "Vertex buffer triangles: " + string(get_vertex_buffer_triangles()) + " \n"
	str += "Vertex buffer render calls: " + string(get_vertex_buffer_render_calls()) + " \n"
	str += "Primitive lines: " + string(get_primitive_lines()) + " \n"
	str += "Primitive triangles: " + string(get_primitive_triangles()) + " \n"
	str += "Primitive render calls: " + string(get_primitive_render_calls()) + " \n"
	str += "\n"
	
	str += "[F12 to disable]"
	
	var w = string_width_font(str, font_label) + 16
	var h = string_height_font(str, font_label) + 16;
	
	draw_box(window_width - w - 8, window_height - h - 8, w, h, false, c_black, .75)
	draw_label(str, window_width - w, window_height - 16, fa_left, fa_bottom, c_white, 1, font_label)
}
