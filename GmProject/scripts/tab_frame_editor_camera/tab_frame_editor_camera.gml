/// tab_frame_editor_camera()

function tab_frame_editor_camera()
{
	var capwid, text;
	
	context_menu_group_temp = e_context_group.CAMERA
	
	// Camera size (Advanced mode only)
	if (setting_advanced_mode)
	{
		if (tl_edit.value[e_value.CAM_SIZE_USE_PROJECT]) // Use project settings
		{
			tab.camera.video_template = null
			text = text_get("frameeditorcameravideosizeuseproject")
		}
		else
		{
			if (tab.camera.video_template = null)
				tab.camera.video_template = find_videotemplate(tl_edit.value[e_value.CAM_WIDTH], tl_edit.value[e_value.CAM_HEIGHT])
			
			if (tab.camera.video_template > 0) // Use template
				text = text_get("projectvideosizetemplate" + tab.camera.video_template.name) + " (" + string(tab.camera.video_template.width) + "x" + string(tab.camera.video_template.height) + ")"
			else // Use custom
				text = text_get("projectvideosizecustom")
		}
		
		tab_control_menu()
		draw_button_menu("frameeditorcameravideosize", e_menu.LIST, dx, dy, dw, 24, tl_edit.value[e_value.CAM_SIZE_USE_PROJECT] ? null : tab.camera.video_template, text, action_tl_frame_cam_video_template)
		tab_next()
		
		// Custom
		if (tab.camera.video_template = 0)
		{
			textfield_group_add("frameeditorcameravideosizecustomwidth", tl_edit.value[e_value.CAM_WIDTH], 1280, action_tl_frame_cam_width, X, tab.camera.tbx_video_size_custom_width, null, 1)
			textfield_group_add("frameeditorcameravideosizecustomheight", tl_edit.value[e_value.CAM_HEIGHT], 720, action_tl_frame_cam_height, X, tab.camera.tbx_video_size_custom_height, null, 1)
			
			tab_control_textfield_group(false)
			draw_textfield_group("frameeditorcameravideosizecustom", dx, dy, dw, 1, 1, no_limit, 1, false)
			tab_next()
			
			tab_control_switch()
			draw_switch("frameeditorcameravideosizecustomkeepaspectratio", dx, dy, tl_edit.value[e_value.CAM_SIZE_KEEP_ASPECT_RATIO], action_tl_frame_cam_size_keep_aspect_ratio)
			tab_next()
			
			dy += 8
		}
	}
	
	// FOV
	tab_control_meter()
	draw_meter("frameeditorcamerafov", dx, dy, dw, tl_edit.value[e_value.CAM_FOV], 1, 170, 45, 1, tab.camera.tbx_fov, action_tl_frame_cam_fov)
	tab_next()
	
	// Advanced mode only
	if (setting_advanced_mode)
	{
		// Aspect
		tab_control_dragger()
		draw_dragger("frameeditorcameraaspect", dx, dy, dragger_width, tl_edit.value[e_value.CAM_ASPECT], 0.01, 0.0001, 360, 1, 0.0001, tab.camera.tbx_aspect, action_tl_frame_cam_aspect)
		tab_next()
		
		/* Uncomment these if you wanna try fixing camera clipping -mb
		// Clip
		textfield_group_add("frameeditorcameraclipnear", tl_edit.value[e_value.CAM_CLIP_NEAR], tl_edit.value_default[e_value.CAM_CLIP_NEAR], action_tl_frame_cam_clip_near, axis_edit, tab.camera.tbx_clip_near, null, 1, 1, tl_edit.value[e_value.CAM_CLIP_FAR])
		
		textfield_group_add("frameeditorcameraclipfar", tl_edit.value[e_value.CAM_CLIP_FAR], tl_edit.value_default[e_value.CAM_CLIP_FAR], action_tl_frame_cam_clip_far, axis_edit, tab.camera.tbx_clip_far, null, 1, tl_edit.value[e_value.CAM_CLIP_NEAR], app.project_render_distance)
		
		tab_control_textfield(true)
		draw_textfield_group("frameeditorcameraclip", dx, dy, dw, 1, 1, app.project_render_distance, 1, true)
		tab_next()
		*/
		
		// Aperture
		tab_control_switch()
		draw_button_collapse("aperture", collapse_map[?"aperture"], null, true, "frameeditorcameraaperture", "frameeditorcameraaperturetip")
		tab_next()
		
		if (collapse_map[?"aperture"])
		{
			tab_collapse_start()
			
			// Blade amount
			tab_control_meter()
			draw_meter("frameeditorcamerabladeamount", dx, dy, dw, tl_edit.value[e_value.CAM_BLADE_AMOUNT], 0, 16, 0, 1, tab.camera.tbx_blade_amount, action_tl_frame_cam_blade_amount)
			tab_next()
			
			// Blade angle
			tab_control_dragger()
			draw_dragger("frameeditorcamerabladeangle", dx, dy, dragger_width, tl_edit.value[e_value.CAM_BLADE_ANGLE], 0.1, -no_limit, no_limit, 0, 1, tab.camera.tbx_blade_angle, action_tl_frame_cam_blade_angle)
			tab_next()
			
			tab_collapse_end()
		}
	}
	
	// Light management
	tab_control_switch()
	draw_button_collapse("light_management_cam", collapse_map[?"light_management_cam"], action_tl_frame_cam_light_management, tl_edit.value[e_value.CAM_LIGHT_MANAGEMENT], "frameeditorcameralightmanagement")
	tab_next()
	
	if (tl_edit.value[e_value.CAM_LIGHT_MANAGEMENT] && collapse_map[?"light_management_cam"])
	{
		tab_collapse_start()
		
		// Tonemapper
		if (tl_edit.value[e_value.CAM_TONEMAPPER] = e_tonemapper.REINHARD)
			text = text_get("frameeditorcameratonemapperreinhard")
		else if (tl_edit.value[e_value.CAM_TONEMAPPER] = e_tonemapper.ACES)
			text = text_get("frameeditorcameratonemapperaces")
		else
			text = text_get("frameeditorcameratonemappernone")
		
		tab_control_menu()
		draw_button_menu("frameeditorcameratonemapper", e_menu.LIST, dx, dy, dw, 24, tl_edit.value[e_value.CAM_TONEMAPPER], text, action_tl_frame_cam_tonemapper)
		tab_next()
		
		// Exposure
		tab_control_dragger()
		draw_dragger("frameeditorcameraexposure", dx, dy, dragger_width, tl_edit.value[e_value.CAM_EXPOSURE], 0.01, 0, no_limit, 1, 0.01, tab.camera.tbx_exposure, action_tl_frame_cam_exposure)
		tab_next()
		
		// Gamma
		tab_control_dragger()
		draw_dragger("frameeditorcameragamma", dx, dy, dragger_width, tl_edit.value[e_value.CAM_GAMMA], 0.01, 0, no_limit, 2.2, 0.01, tab.camera.tbx_gamma, action_tl_frame_cam_gamma)
		tab_next()
		
		tab_collapse_end()
	}
	
	// Rotate point
	tab_control_switch()
	draw_button_collapse("rotatepoint", collapse_map[?"rotatepoint"], action_tl_frame_cam_rotate, tl_edit.value[e_value.CAM_ROTATE], "frameeditorcamerarotate")
	tab_next()

	if (tl_edit.value[e_value.CAM_ROTATE] && collapse_map[?"rotatepoint"])
	{
		tab_collapse_start()
		
		// XY / Z angle wheels
		var snapval = (dragger_snap ? setting_snap_size_rotation : 0.1);
		
		tab_control_wheel()
		draw_wheel("frameeditorcamerarotateanglexywheel", dx + floor(dw * 0.25), dy + 24, c_aqua, tl_edit.value[e_value.CAM_ROTATE_ANGLE_XY], -no_limit, no_limit, 0, snapval, tab.camera.tbx_rotate_angle_xy, action_tl_frame_cam_rotate_angle_xy)
		draw_wheel("frameeditorcamerarotateanglezwheel", dx + floor(dw * 0.75), dy + 24, c_aqua, tl_edit.value[e_value.CAM_ROTATE_ANGLE_Z], -no_limit, no_limit, 0, snapval, tab.camera.tbx_rotate_angle_z, action_tl_frame_cam_rotate_angle_z)
		tab_next()
		
		// Textboxes
		textfield_group_add("frameeditorcamerarotateanglexy", tl_edit.value[e_value.CAM_ROTATE_ANGLE_XY], 0, action_tl_frame_cam_rotate_angle_xy, axis_edit, tab.camera.tbx_rotate_angle_xy, null, .1, -no_limit, no_limit)
		textfield_group_add("frameeditorcamerarotateanglez", tl_edit.value[e_value.CAM_ROTATE_ANGLE_Z], 0, action_tl_frame_cam_rotate_angle_z, axis_edit, tab.camera.tbx_rotate_angle_z, null, .1, -no_limit, no_limit)
		
		tab_control_textfield_group(false)
		draw_textfield_group("frameeditorcamerarotateangle", dx, dy, dw, 0.1, 0, 0, snapval, false, true)
		tab_next()
		
		// Distance
		tab_control_dragger()
		draw_dragger("frameeditorcamerarotatedistance", dx, dy, dragger_width, tl_edit.value[e_value.CAM_ROTATE_DISTANCE], 1, 1, no_limit, 100, 0, tab.camera.tbx_rotate_distance, action_tl_frame_cam_rotate_distance)
		tab_next()
		
		// Look at
		tab_control_switch()
		draw_switch("frameeditorcamerarotatelookatpoint", dx, dy, tab.camera.look_at_rotate, action_tl_frame_look_at_rotate)
		tab_next()
		
		tab_collapse_end()
	}
	
	// Camera shake (Advanced mode only)
	if (setting_advanced_mode)
	{
		tab_control_switch()
		draw_button_collapse("camshake", collapse_map[?"camshake"], action_tl_frame_cam_shake, tl_edit.value[e_value.CAM_SHAKE], "frameeditorcameracamerashake")
		tab_next()
		
		if (tl_edit.value[e_value.CAM_SHAKE] && collapse_map[?"camshake"])
		{
			tab_collapse_start()
			
			// Mode
			tab_control_togglebutton()
			togglebutton_add("frameeditorcameracamerashakerotational", null, 0, tl_edit.value[e_value.CAM_SHAKE_MODE] = 0, action_tl_frame_cam_shake_mode)
			togglebutton_add("frameeditorcameracamerashakepositional", null, 1, tl_edit.value[e_value.CAM_SHAKE_MODE] = 1, action_tl_frame_cam_shake_mode)
			draw_togglebutton("frameeditorcameracamerashakemode", dx, dy)
			tab_next()
			
			// Strength
			axis_edit = X
			textfield_group_add("frameeditorcameracamerashakestrengthx", round(tl_edit.value[e_value.CAM_SHAKE_STRENGTH_X] * 100), 100, action_tl_frame_cam_shake_strength, axis_edit, tab.camera.tbx_shake_strength_x, null, 1, 0, no_limit)
			axis_edit = (setting_z_is_up ? Y : Z)
			textfield_group_add("frameeditorcameracamerashakestrengthy", round(tl_edit.value[e_value.CAM_SHAKE_STRENGTH_X + axis_edit] * 100), 100, action_tl_frame_cam_shake_strength, axis_edit, tab.camera.tbx_shake_strength_y, null, 1, 0, no_limit)
			axis_edit = (setting_z_is_up ? Z : Y)
			textfield_group_add("frameeditorcameracamerashakestrengthz", round(tl_edit.value[e_value.CAM_SHAKE_STRENGTH_X + axis_edit] * 100), 100, action_tl_frame_cam_shake_strength, axis_edit, tab.camera.tbx_shake_strength_z, null, 1, 0, no_limit)
			
			tab_control_textfield_group()
			draw_textfield_group("frameeditorcameracamerashakestrength", dx, dy, dw, null, null, null, .01, true, false, 1)
			tab_next()
			
			// Speed
			axis_edit = X
			textfield_group_add("frameeditorcameracamerashakespeedx", round(tl_edit.value[e_value.CAM_SHAKE_SPEED_X] * 100), 100, action_tl_frame_cam_shake_speed, axis_edit, tab.camera.tbx_shake_speed_x, null, 1, 0, no_limit)
			axis_edit = (setting_z_is_up ? Y : Z)
			textfield_group_add("frameeditorcameracamerashakespeedy", round(tl_edit.value[e_value.CAM_SHAKE_SPEED_X + axis_edit] * 100), 100, action_tl_frame_cam_shake_speed, axis_edit, tab.camera.tbx_shake_speed_y, null, 1, 0, no_limit)
			axis_edit = (setting_z_is_up ? Z : Y)
			textfield_group_add("frameeditorcameracamerashakespeedz", round(tl_edit.value[e_value.CAM_SHAKE_SPEED_X + axis_edit] * 100), 100, action_tl_frame_cam_shake_speed, axis_edit, tab.camera.tbx_shake_speed_z, null, 1, 0, no_limit)
			
			tab_control_textfield_group()
			draw_textfield_group("frameeditorcameracamerashakespeed", dx, dy, dw, null, null, null, .01, true, false, 1)
			tab_next()
			
			tab_collapse_end()
		}
	}
	
	// Depth of Field
	tab_control_switch()
	draw_button_collapse("dof", collapse_map[?"dof"], action_tl_frame_cam_dof, tl_edit.value[e_value.CAM_DOF], "frameeditorcameradof")
	tab_next()
	
	if (tl_edit.value[e_value.CAM_DOF] && collapse_map[?"dof"])
	{
		tab_collapse_start()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameradofdepth", dx, dy, dragger_width, tl_edit.value[e_value.CAM_DOF_DEPTH], max(0.5, tl_edit.value[e_value.CAM_DOF_DEPTH] / 50), 0, project_render_distance, 0, 0, tab.camera.tbx_dof_depth, action_tl_frame_cam_dof_depth)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameradofrange", dx, dy, dragger_width, tl_edit.value[e_value.CAM_DOF_RANGE], max(0.5, tl_edit.value[e_value.CAM_DOF_RANGE] / 50), 0, no_limit, 200, 0, tab.camera.tbx_dof_range, action_tl_frame_cam_dof_range)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameradoffadesize", dx, dy, dragger_width, tl_edit.value[e_value.CAM_DOF_FADE_SIZE], 2, 0, no_limit, 100, 0, tab.camera.tbx_dof_fade_size, action_tl_frame_cam_dof_fade_size)
		tab_next()
		
		tab_control_meter()
		draw_meter("frameeditorcameradofblursize", dx, dy, dw, tl_edit.value[e_value.CAM_DOF_BLUR_SIZE] * 100, 0, 10, 1, .01, tab.camera.tbx_dof_blur_size, action_tl_frame_cam_dof_blur_size)
		tab_next()
		
		if (setting_advanced_mode)
		{
			tab_control_meter()
			draw_meter("frameeditorcameradofblurratio", dx, dy, dw, round(tl_edit.value[e_value.CAM_DOF_BLUR_RATIO] * 100), 0, 100, 0, 1, tab.camera.tbx_dof_blur_ratio, action_tl_frame_cam_dof_blur_ratio)
			tab_next()
			
			tab_control_meter()
			draw_meter("frameeditorcameradofbias", dx, dy, dw, round(tl_edit.value[e_value.CAM_DOF_BIAS] * 10), 0, 100, 0, 1, tab.camera.tbx_dof_bias, action_tl_frame_cam_dof_bias)
			tab_next()
			
			tab_control_meter()
			draw_meter("frameeditorcameradofgain", dx, dy, dw, round(tl_edit.value[e_value.CAM_DOF_GAIN] * 100), 0, 200, 0, 1, tab.camera.tbx_dof_gain, action_tl_frame_cam_dof_gain)
			tab_next()
			
			tab_control_meter()
			draw_meter("frameeditorcameradofthreshold", dx, dy, dw, round(tl_edit.value[e_value.CAM_DOF_THRESHOLD] * 100), 0, 100, 0, 1, tab.camera.tbx_dof_threshold, action_tl_frame_cam_dof_threshold)
			tab_next()
			
			tab_control_switch()
			draw_button_collapse("dof_fringe", collapse_map[?"dof_fringe"], action_tl_frame_cam_dof_fringe, tl_edit.value[e_value.CAM_DOF_FRINGE], "frameeditorcameradoffringe")
			tab_next()
			
			if (tl_edit.value[e_value.CAM_DOF_FRINGE] && collapse_map[?"dof_fringe"])
			{
				tab_collapse_start()
				
				var snapval, capwid;
				snapval = (dragger_snap ? setting_snap_size_rotation : 0.1)
				
				tab_control_wheel()
				axis_edit = X
				draw_wheel("frameeditorcameradoffringeangleredwheel", floor(dx + dw/6), dy + 24, c_axisred, tl_edit.value[e_value.CAM_DOF_FRINGE_ANGLE_RED], -no_limit, no_limit, tl_edit.value_default[e_value.CAM_DOF_FRINGE_ANGLE_RED], snapval, tab.camera.tbx_dof_fringe_angle_red, action_tl_frame_cam_dof_fringe_angle)
				axis_edit = Y
				draw_wheel("frameeditorcameradoffringeanglegreenwheel", floor(dx + dw/2), dy + 24, c_axisgreen, tl_edit.value[e_value.CAM_DOF_FRINGE_ANGLE_GREEN], -no_limit, no_limit, tl_edit.value_default[e_value.CAM_DOF_FRINGE_ANGLE_GREEN], snapval, tab.camera.tbx_dof_fringe_angle_green, action_tl_frame_cam_dof_fringe_angle)
				axis_edit = Z
				draw_wheel("frameeditorcameradoffringeanglebluewheel", floor(dx + dw - dw/6), dy + 24, c_axisblue, tl_edit.value[e_value.CAM_DOF_FRINGE_ANGLE_BLUE], -no_limit, no_limit, tl_edit.value_default[e_value.CAM_DOF_FRINGE_ANGLE_BLUE], snapval, tab.camera.tbx_dof_fringe_angle_blue, action_tl_frame_cam_dof_fringe_angle)
				tab_next()
				
				// Textboxes
				axis_edit = X
				textfield_group_add("frameeditorcameradoffringeanglered", tl_edit.value[e_value.CAM_DOF_FRINGE_ANGLE_RED], tl_edit.value_default[e_value.CAM_DOF_FRINGE_ANGLE_RED], action_tl_frame_cam_dof_fringe_angle, axis_edit, tab.camera.tbx_dof_fringe_angle_red)
				axis_edit = Y
				textfield_group_add("frameeditorcameradoffringeanglegreen", tl_edit.value[e_value.CAM_DOF_FRINGE_ANGLE_GREEN], tl_edit.value_default[e_value.CAM_DOF_FRINGE_ANGLE_GREEN], action_tl_frame_cam_dof_fringe_angle, axis_edit, tab.camera.tbx_dof_fringe_angle_green)
				axis_edit = Z
				textfield_group_add("frameeditorcameradoffringeangleblue", tl_edit.value[e_value.CAM_DOF_FRINGE_ANGLE_BLUE], tl_edit.value_default[e_value.CAM_DOF_FRINGE_ANGLE_BLUE], action_tl_frame_cam_dof_fringe_angle, axis_edit, tab.camera.tbx_dof_fringe_angle_blue)
				
				tab_control_textfield(false)
				draw_textfield_group("frameeditorcameradoffringeangle", dx, dy, dw, 0.1, -no_limit, no_limit, snapval, false, true, 1)
				tab_next()
				
				// Offset
				textfield_group_add("frameeditorcameradoffringered", round(tl_edit.value[e_value.CAM_DOF_FRINGE_RED] * 100), 100, action_tl_frame_cam_dof_fringe_red, X, tab.camera.tbx_dof_fringe_red)
				textfield_group_add("frameeditorcameradoffringegreen", round(tl_edit.value[e_value.CAM_DOF_FRINGE_GREEN] * 100), 100, action_tl_frame_cam_dof_fringe_green, X, tab.camera.tbx_dof_fringe_green)
				textfield_group_add("frameeditorcameradoffringeblue", round(tl_edit.value[e_value.CAM_DOF_FRINGE_BLUE] * 100), 100, action_tl_frame_cam_dof_fringe_blue, X, tab.camera.tbx_dof_fringe_blue)
				
				tab_control_textfield_group()
				draw_textfield_group("frameeditorcameradoffringeoffset", dx, dy, dw, 1, 0, no_limit, 1, true, true, 3)
				tab_next()
				
				tab_collapse_end(false)
			}
		}
		
		tab_collapse_end()
	}
	
	// Bloom
	tab_control_switch()
	draw_button_collapse("bloom", collapse_map[?"bloom"], action_tl_frame_cam_bloom, tl_edit.value[e_value.CAM_BLOOM], "frameeditorcamerabloom")
	tab_next()
	
	if (tl_edit.value[e_value.CAM_BLOOM] && collapse_map[?"bloom"])
	{
		tab_collapse_start()
		
		tab_control_dragger()
		draw_dragger("frameeditorcamerabloomthreshold", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_BLOOM_THRESHOLD] * 100), .1, 0, 100, 85, 1, tab.camera.tbx_bloom_threshold, action_tl_frame_cam_bloom_threshold)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcamerabloomradius", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_BLOOM_RADIUS] * 100), .1, 0, no_limit, 100, 1, tab.camera.tbx_bloom_radius, action_tl_frame_cam_bloom_radius)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcamerabloomintensity", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_BLOOM_INTENSITY] * 100), .1, 0, no_limit, 40, 1, tab.camera.tbx_bloom_intensity, action_tl_frame_cam_bloom_intensity)
		tab_next()
		
		// Advanced mode only
		if (setting_advanced_mode)
		{
			tab_control_meter()
			draw_meter("frameeditorcamerabloomratio", dx, dy, dw, round(tl_edit.value[e_value.CAM_BLOOM_RATIO] * 100), 0, 100, 0, 1, tab.camera.tbx_bloom_ratio, action_tl_frame_cam_bloom_ratio)
			tab_next()
			
			tab_control_color()
			draw_button_color("frameeditorcamerabloomblend", dx, dy, floor(dw/2), tl_edit.value[e_value.CAM_BLOOM_BLEND], c_white, false, action_tl_frame_cam_bloom_blend)
			tab_next()
		}
		
		tab_collapse_end()
	}
	
	// Lens dirt (Advanced mode only)
	if (setting_advanced_mode)
	{
		tab_control_switch()
		draw_button_collapse("lensdirt", collapse_map[?"lensdirt"], action_tl_frame_cam_lens_dirt, tl_edit.value[e_value.CAM_LENS_DIRT], "frameeditorcameralensdirt")
		tab_next()
		
		if (tl_edit.value[e_value.CAM_LENS_DIRT] && collapse_map[?"lensdirt"])
		{
			tab_collapse_start()
			
			// Lens dirt texture(TEXTURE_OBJ)
			var texobj, tex;
			texobj = tl_edit.value[e_value.TEXTURE_OBJ]
			tex = null
			
			var text;
			
			if (texobj != null)
				text = texobj.display_name
			else
				text = text_get("listnone")
			
			if (texobj = null)
				text = text_get("listdefault", text)
			
			if (texobj != null && texobj.type != e_tl_type.CAMERA) // Don't preview cameras
				tex = texobj.texture
			
			tab_control_menu(ui_large_height)
			draw_button_menu("frameeditorcameralensdirttexture", e_menu.LIST, dx, dy, dw, ui_large_height, tl_edit.value[e_value.TEXTURE_OBJ], text, action_tl_frame_texture_obj, false, tex)
			tab_next()
			
			// Affected by bloom
			tab_control_switch()
			draw_switch("frameeditorcameralensdirtbloom", dx, dy, tl_edit.value[e_value.CAM_LENS_DIRT_BLOOM], action_tl_frame_cam_lens_dirt_bloom)
			tab_next()
			
			// Affected by glow
			tab_control_switch()
			draw_switch("frameeditorcameralensdirtglow", dx, dy, tl_edit.value[e_value.CAM_LENS_DIRT_GLOW], action_tl_frame_cam_lens_dirt_glow)
			tab_next()
			
			// Radius
			tab_control_meter()
			draw_meter("frameeditorcameralensdirtradius", dx, dy, dw, round(tl_edit.value[e_value.CAM_LENS_DIRT_RADIUS] * 100), 0, 300, 50, 1, tab.camera.tbx_lens_dirt_radius, action_tl_frame_cam_lens_dirt_radius)
			tab_next()
			
			// Intensity
			tab_control_meter()
			draw_meter("frameeditorcameralensdirtintensity", dx, dy, dw, round(tl_edit.value[e_value.CAM_LENS_DIRT_INTENSITY] * 100), 0, 200, 80, 1, tab.camera.tbx_lens_dirt_intensity, action_tl_frame_cam_lens_dirt_intensity)
			tab_next()
			
			// Power
			tab_control_meter()
			draw_meter("frameeditorcameralensdirtpower", dx, dy, dw, round(tl_edit.value[e_value.CAM_LENS_DIRT_POWER] * 100), 100, 500, 150, 1, tab.camera.tbx_lens_dirt_power, action_tl_frame_cam_lens_dirt_power)
			tab_next()
			
			tab_collapse_end()
		}
	}
	
	// Color correction
	tab_control_switch()
	draw_button_collapse("clrcor", collapse_map[?"clrcor"], action_tl_frame_cam_clrcor, tl_edit.value[e_value.CAM_COLOR_CORRECTION], "frameeditorcameracolorcorrection")
	tab_next()
	
	if (tl_edit.value[e_value.CAM_COLOR_CORRECTION] && collapse_map[?"clrcor"])
	{
		tab_collapse_start()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameracolorcorrectioncontrast", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_CONTRAST] * 100), .1, 0, no_limit * 100, 0, 1, tab.camera.tbx_contrast, action_tl_frame_cam_clrcor_contrast)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameracolorcorrectionbrightness", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_BRIGHTNESS] * 100), .1, -no_limit * 100, no_limit * 100, 0, 1, tab.camera.tbx_brightness, action_tl_frame_cam_clrcor_brightness)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameracolorcorrectionsaturation", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_SATURATION] * 100), .1, 0, no_limit * 100, 100, 1, tab.camera.tbx_saturation, action_tl_frame_cam_clrcor_saturation)
		tab_next()
		
		tab_control_dragger()
		draw_dragger("frameeditorcameracolorcorrectionvibrance", dx, dy, dragger_width, round(tl_edit.value[e_value.CAM_VIBRANCE] * 100), .1, 0, no_limit * 100, 0, 1, tab.camera.tbx_vibrance, action_tl_frame_cam_clrcor_vibrance)
		tab_next()
		
		tab_control_color()
		draw_button_color("frameeditorcameracolorcorrectioncolorburn", dx, dy, dw/2, tl_edit.value[e_value.CAM_COLOR_BURN], c_white, false, action_tl_frame_cam_clrcor_color_burn)
		tab_next()
		
		tab_collapse_end()
	}
	
	// Film grain (Advanced mode only)
	if (setting_advanced_mode)
	{
		tab_control_switch()
		draw_button_collapse("grain", collapse_map[?"grain"], action_tl_frame_cam_grain, tl_edit.value[e_value.CAM_GRAIN], "frameeditorcameragrain")
		tab_next()
		
		if (tl_edit.value[e_value.CAM_GRAIN] && collapse_map[?"grain"])
		{
			tab_collapse_start()
			
			tab_control_meter()
			draw_meter("frameeditorcameragrainstrength", dx, dy, dw, round(tl_edit.value[e_value.CAM_GRAIN_STRENGTH] * 100), -100, 100, 10, 1, tab.camera.tbx_grain_strength, action_tl_frame_cam_grain_strength)
			tab_next()
			
			tab_control_meter()
			draw_meter("frameeditorcameragrainsaturation", dx, dy, dw, round(tl_edit.value[e_value.CAM_GRAIN_SATURATION] * 100), 0, 100, 10, 1, tab.camera.tbx_grain_saturation, action_tl_frame_cam_grain_saturation)
			tab_next()
			
			tab_control_meter()
			draw_meter("frameeditorcameragrainsize", dx, dy, dw, tl_edit.value[e_value.CAM_GRAIN_SIZE], 1, 10, 1, 1, tab.camera.tbx_grain_size, action_tl_frame_cam_grain_size)
			tab_next()
			
			tab_collapse_end()
		}
	}
	
	// Vignette
	tab_control_switch()
	draw_button_collapse("vignette", collapse_map[?"vignette"], action_tl_frame_cam_vignette, tl_edit.value[e_value.CAM_VIGNETTE], "frameeditorcameravignette")
	tab_next()
	
	if (tl_edit.value[e_value.CAM_VIGNETTE] && collapse_map[?"vignette"])
	{
		tab_collapse_start()
		
		tab_control_meter()
		draw_meter("frameeditorcameravignetteradius", dx, dy, dw, round(tl_edit.value[e_value.CAM_VIGNETTE_RADIUS] * 100), 0, 100, 100, 1, tab.camera.tbx_vignette_radius, action_tl_frame_cam_vignette_radius)
		tab_next()
		
		tab_control_meter()
		draw_meter("frameeditorcameravignettesoftness", dx, dy, dw, round(tl_edit.value[e_value.CAM_VIGNETTE_SOFTNESS] * 100), 0, 100, 50, 1, tab.camera.tbx_vignette_softness, action_tl_frame_cam_vignette_softness)
		tab_next()
		
		tab_control_meter()
		draw_meter("frameeditorcameravignettestrength", dx, dy, dw, round(tl_edit.value[e_value.CAM_VIGNETTE_STRENGTH] * 100), 0, 100, 100, 1, tab.camera.tbx_vignette_strength, action_tl_frame_cam_vignette_strength)
		tab_next()
		
		tab_control_color()
		draw_button_color("frameeditorcameravignettecolor", dx, dy, dw, tl_edit.value[e_value.CAM_VIGNETTE_COLOR], c_black, false, action_tl_frame_cam_vignette_color)
		tab_next()
		
		tab_collapse_end()
	}
	
	// Chromatic aberration (Advanced mode only)
	if (setting_advanced_mode)
	{
		tab_control_switch()
		draw_button_collapse("ca", collapse_map[?"ca"], action_tl_frame_cam_ca, tl_edit.value[e_value.CAM_CA], "frameeditorcameraca")
		tab_next()
		
		if (tl_edit.value[e_value.CAM_CA] && collapse_map[?"ca"])
		{
			tab_collapse_start()
			
			tab_control_meter()
			draw_meter("frameeditorcameracabluramount", dx, dy, dw, round(tl_edit.value[e_value.CAM_CA_BLUR_AMOUNT] * 100), 0, 100, 5, 1, tab.camera.tbx_ca_blur_amount, action_tl_frame_cam_ca_blur_amount)
			tab_next()
			
			tab_control_switch()
			draw_switch("frameeditorcameracadistortchannels", dx, dy, tl_edit.value[e_value.CAM_CA_DISTORT_CHANNELS], action_tl_frame_cam_ca_distort_channels)
			tab_next()
			
			textfield_group_add("frameeditorcameracaredoffset", round(tl_edit.value[e_value.CAM_CA_RED_OFFSET] * 100), 12, action_tl_frame_cam_ca_red_offset, X, tab.camera.tbx_ca_red_offset)
			textfield_group_add("frameeditorcameracagreenoffset", round(tl_edit.value[e_value.CAM_CA_GREEN_OFFSET] * 100), 8, action_tl_frame_cam_ca_green_offset, X, tab.camera.tbx_ca_green_offset)
			textfield_group_add("frameeditorcameracablueoffset", round(tl_edit.value[e_value.CAM_CA_BLUE_OFFSET] * 100), 4, action_tl_frame_cam_ca_blue_offset, X, tab.camera.tbx_ca_blue_offset)
			
			tab_control_textfield_group()
			draw_textfield_group("frameeditorcameracaoffset", dx, dy, dw, 1, 0, no_limit, 1, true, true, 3)
			tab_next()
			
			tab_collapse_end()
		}
	}
	
	// Distort (Advanced mode only)
	if (setting_advanced_mode)
	{
		tab_control_switch()
		draw_button_collapse("distort", collapse_map[?"distort"], action_tl_frame_cam_distort, tl_edit.value[e_value.CAM_DISTORT], "frameeditorcameradistort")
		tab_next()
		
		if (tl_edit.value[e_value.CAM_DISTORT] && collapse_map[?"distort"])
		{
			tab_collapse_start()
			
			tab_control_switch()
			draw_switch("frameeditorcameradistortrepeat", dx, dy, tl_edit.value[e_value.CAM_DISTORT_REPEAT], action_tl_frame_cam_distort_repeat)
			tab_next()
			
			tab_control_dragger()
			draw_dragger("frameeditorcameradistortzoom", dx, dy, dragger_width, tl_edit.value[e_value.CAM_DISTORT_ZOOM_AMOUNT] * 100, 1, snap_min, no_limit, 100, .01, tab.camera.tbx_distort_zoom_amount, action_tl_frame_cam_distort_zoom_amount)
			tab_next()
			
			tab_control_dragger()
			draw_dragger("frameeditorcameradistortamount", dx, dy, dragger_width, tl_edit.value[e_value.CAM_DISTORT_AMOUNT] * 100, .1, -no_limit * 100, no_limit * 100, 5, 0.01, tab.camera.tbx_distort_amount, action_tl_frame_cam_distort_amount)
			tab_next()
			
			tab_collapse_end(false)
		}
	}
	
	context_menu_group_temp = null
}
