/// tab_settings_controls()

function tab_settings_controls()
{
	tab_control(20)
	draw_label(text_get("settingscontrolskeybinds") + ":", dx, dy + 10, fa_left, fa_middle, c_text_tertiary, a_text_tertiary, font_label) 
	tab_next()
	
	// File
	tab_control_switch()
	draw_button_collapse("bindsfile", collapse_map[?"bindsfile"], null, true, "settingscontrolsfile")
	tab_next()
	
	if (collapse_map[?"bindsfile"])
	{
		tab_collapse_start()
	
		draw_keybind(e_keybind.PROJECT_NEW, dx, dy)
		draw_keybind(e_keybind.PROJECT_OPEN, dx, dy)
		draw_keybind(e_keybind.PROJECT_SAVE, dx, dy)
		draw_keybind(e_keybind.PROJECT_SAVE_AS, dx, dy)
		draw_keybind(e_keybind.IMPORT_ASSET, dx, dy)
		dy += 8
		
		tab_collapse_end()
	}
	
	// Edit
	tab_control_switch()
	draw_button_collapse("bindsedit", collapse_map[?"bindsedit"], null, true, "settingscontrolsedit")
	tab_next()
	
	if (collapse_map[?"bindsedit"])
	{
		tab_collapse_start()
		
		draw_keybind(e_keybind.UNDO, dx, dy)
		draw_keybind(e_keybind.REDO, dx, dy)
		draw_keybind(e_keybind.TIMELINE_DELETE, dx, dy)
		draw_keybind(e_keybind.TIMELINE_DUPLICATE, dx, dy)
		draw_keybind(e_keybind.TIMELINE_SELECT, dx, dy)
		draw_keybind(e_keybind.TIMELINE_HIDE, dx, dy)
		draw_keybind(e_keybind.TIMELINE_SHOW_HIDDEN, dx, dy)
		draw_keybind(e_keybind.CREATE_FOLDER, dx, dy)
		draw_keybind(e_keybind.KEYFRAMES_CREATE, dx, dy)
		draw_keybind(e_keybind.KEYFRAMES_COPY, dx, dy)
		draw_keybind(e_keybind.KEYFRAMES_CUT, dx, dy)
		draw_keybind(e_keybind.KEYFRAMES_PASTE, dx, dy)
		draw_keybind(e_keybind.KEYFRAMES_DELETE, dx, dy)
		dy += 8
		
		tab_collapse_end()
	}
	
	// Tools
	tab_control_switch()
	draw_button_collapse("bindstools", collapse_map[?"bindstools"], null, true, "settingscontrolstools")
	tab_next()
	
	if (collapse_map[?"bindstools"])
	{
		tab_collapse_start()
		
		draw_keybind(e_keybind.TOOL_SELECT, dx, dy)
		draw_keybind(e_keybind.TOOL_MOVE, dx, dy)
		draw_keybind(e_keybind.TOOL_ROTATE, dx, dy)
		draw_keybind(e_keybind.TOOL_SCALE, dx, dy)
		draw_keybind(e_keybind.TOOL_BEND, dx, dy)
		draw_keybind(e_keybind.TOOL_TRANSFORM, dx, dy)
		draw_keybind(e_keybind.SNAP, dx, dy)
		dy += 8
		
		tab_collapse_end()
	}
	
	// Viewport
	tab_control_switch()
	draw_button_collapse("bindsviewport", collapse_map[?"bindsviewport"], null, true, "settingscontrolsviewport")
	tab_next()
	
	if (collapse_map[?"bindsviewport"])
	{
		tab_collapse_start()
		
		draw_keybind(e_keybind.RENDER_MODE, dx, dy)
		draw_keybind(e_keybind.SECONDARY_VIEW, dx, dy)
		draw_keybind(e_keybind.PARTICLES_SPAWN, dx, dy)
		draw_keybind(e_keybind.PARTICLES_CLEAR, dx, dy)
		dy += 8
		
		tab_collapse_end()
	}
	
	// Timeline
	tab_control_switch()
	draw_button_collapse("bindstimeline", collapse_map[?"bindstimeline"], null, true, "settingscontrolstimeline")
	tab_next()
	
	if (collapse_map[?"bindstimeline"])
	{
		tab_collapse_start()
		
		draw_keybind(e_keybind.PLAY, dx, dy)
		draw_keybind(e_keybind.PLAY_BEGINNING, dx, dy)
		draw_keybind(e_keybind.MARKER_LEFT, dx, dy)
		draw_keybind(e_keybind.MARKER_RIGHT, dx, dy)
		draw_keybind(e_keybind.FRAME_PREVIOUS, dx, dy)
		draw_keybind(e_keybind.FRAME_NEXT, dx, dy)
		dy += 8
		
		tab_collapse_end()
	}
	
	// Camera
	tab_control_switch()
	draw_button_collapse("bindscamera", collapse_map[?"bindscamera"], null, true, "settingscontrolscamera")
	tab_next()
	
	if (collapse_map[?"bindscamera"])
	{
		tab_collapse_start()
		
		draw_keybind(e_keybind.CAM_FORWARD, dx, dy)
		draw_keybind(e_keybind.CAM_BACK, dx, dy)
		draw_keybind(e_keybind.CAM_LEFT, dx, dy)
		draw_keybind(e_keybind.CAM_RIGHT, dx, dy)
		draw_keybind(e_keybind.CAM_ASCEND, dx, dy)
		draw_keybind(e_keybind.CAM_DESCEND, dx, dy)
		draw_keybind(e_keybind.CAM_ROLL_FORWARD, dx, dy)
		draw_keybind(e_keybind.CAM_ROLL_BACK, dx, dy)
		draw_keybind(e_keybind.CAM_RESET, dx, dy)
		draw_keybind(e_keybind.CAM_ROLL_RESET, dx, dy)
		draw_keybind(e_keybind.CAM_FAST, dx, dy)
		draw_keybind(e_keybind.CAM_SLOW, dx, dy)
		draw_keybind(e_keybind.CAM_VIEW_TIMELINE, dx, dy)
		dy += 8
		
		tab_collapse_end()
	}
	
	tab_control_dragger()
	draw_dragger("settingsmovespeed", dx, dy, dragger_width, setting_move_speed, 0.01, 0, no_limit, 1, 0, tab.controls.tbx_move_speed, action_setting_move_speed)
	tab_next()
	
	tab_control_dragger()
	draw_dragger("settingslooksensitivity", dx, dy, dragger_width, setting_look_sensitivity, 0.01, 0, no_limit, 1, 0, tab.controls.tbx_look_sensitivity, action_setting_look_sensitivity)
	tab_next()
	
	tab_control_dragger()
	draw_dragger("settingsfastmodifier", dx, dy, dragger_width, setting_fast_modifier, 0.01, 0, no_limit, 3, 0, tab.controls.tbx_fast_modifier, action_setting_fast_modifier)
	tab_next()
	
	tab_control_dragger()
	draw_dragger("settingsslowmodifier", dx, dy, dragger_width, setting_slow_modifier, 0.01, 0, no_limit, 0.25, 0, tab.controls.tbx_slow_modifier, action_setting_slow_modifier)
	tab_next()
	
	// Restore controls
	tab_control_button_label()
	draw_button_label("settingscontrolsrestoredefaults", dx + dw/2, dy, null, icons.RESET, e_button.PRIMARY, action_restore_controls, fa_middle)
	tab_next()
}
