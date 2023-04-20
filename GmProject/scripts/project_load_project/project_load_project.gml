/// project_load_project(map)
/// @arg map

function project_load_project(map)
{
	if (!ds_map_valid(map))
		return 0
	
	project_name = value_get_string(map[?"name"], project_name)
	project_author = value_get_string(map[?"author"], project_author)
	project_description = value_get_string(map[?"description"], project_description)
	project_video_width = value_get_real(map[?"video_width"], project_video_width)
	project_video_height = value_get_real(map[?"video_height"], project_video_height)
	project_video_template = find_videotemplate(project_video_width, project_video_height)
	project_video_keep_aspect_ratio = value_get_real(map[?"video_keep_aspect_ratio"], project_video_keep_aspect_ratio)
	
	project_render_settings = value_get_string(map[?"render_settings"], project_render_settings)
	project_tempo = value_get_real(map[?"tempo"], project_tempo)
	project_grid_rows = value_get_real(map[?"grid_rows"], project_grid_rows)
	project_grid_columns = value_get_real(map[?"grid_columns"], project_grid_columns)
	view_main.camera = value_get_save_id(map[?"view_main_camera"], -4)
	view_second.camera = value_get_save_id(map[?"view_second_camera"], -5)
	
	// If render settings file doesn't exists, set to custom
	if (project_render_settings != "" && !file_exists_lib(render_directory + project_render_settings + ".mirender"))
		project_render_settings = ""
	
	var tlmap = map[?"timeline"];
	if (ds_map_valid(tlmap))
	{
		timeline_repeat = value_get_real(tlmap[?"repeat"], timeline_repeat)
		timeline_seamless_repeat = value_get_real(tlmap[?"seamless_repeat"], timeline_seamless_repeat)
		
		if (load_format < e_project.FORMAT_200_PRE_5)
			timeline_intervals_show = value_get_real(tlmap[?"show_seconds"], timeline_intervals_show)
		else
			timeline_intervals_show = value_get_real(tlmap[?"intervals_show"], timeline_intervals_show)
		
		timeline_interval_size = value_get_real(tlmap[?"interval_size"], timeline_interval_size)
		timeline_interval_offset = value_get_real(tlmap[?"interval_offset"], timeline_interval_offset)
		
		timeline_marker = value_get_real(tlmap[?"marker"], timeline_marker)
		timeline.list_width = value_get_real(tlmap[?"list_width"], timeline.list_width)
		timeline.hor_scroll.value = value_get_real(tlmap[?"hor_scroll"], timeline.hor_scroll.value)
		timeline_zoom = value_get_real(tlmap[?"zoom"], timeline_zoom)
		timeline_zoom_goal = timeline_zoom
		timeline_region_start = value_get_real(tlmap[?"region_start"], timeline_region_start)
		timeline_region_end = value_get_real(tlmap[?"region_end"], timeline_region_end)
		timeline_hide_color_tag = value_get_array(tlmap[?"hide_color_tag"], timeline_hide_color_tag)
	}
	
	var cammap = map[?"work_camera"];
	if (ds_map_valid(cammap))
	{
		cam_work_focus = value_get_point3D(cammap[?"focus"], cam_work_focus)
		cam_work_angle_xy = value_get_real(cammap[?"angle_xy"], cam_work_angle_xy)
		cam_work_angle_z = value_get_real(cammap[?"angle_z"], cam_work_angle_z)
		cam_work_roll = value_get_real(cammap[?"roll"], cam_work_roll)
		cam_work_zoom = value_get_real(cammap[?"zoom"], cam_work_zoom)
		cam_work_zoom_goal = cam_work_zoom
		
		cam_work_angle_look_xy = cam_work_angle_xy
		cam_work_angle_look_z = -cam_work_angle_z
		
		// Fix if value was saved outside of range in previous versions
		cam_work_angle_look_z = clamp(cam_work_angle_look_z, -89.9, 89.9)
		
		camera_work_set_from()
	}
}
