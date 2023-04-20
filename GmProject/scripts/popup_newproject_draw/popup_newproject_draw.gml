/// popup_newproject_draw()
/// @desc Settings for starting a new project.

function popup_newproject_draw()
{
	var issue = false;
	
	if (popup.folder = "" || directory_exists_lib(setting_project_folder + popup.folder))
		issue = true
	
	// Project name
	tab_control_textfield(true)
	if (draw_textfield("newprojectname", dx, dy, dw, 24, popup.tbx_name, null, popup.folder, "top") || issue)
	{
		popup.folder = filename_get_valid(popup.tbx_name.text)
		
		if (popup.folder = "")
			popup.folder = text_get("newprojectnamedefault")
		
		popup.folder = filename_name(filename_get_unique(setting_project_folder + popup.folder))
	}
	tab_next()
	
	// Project description
	tab_control_textfield(true, 76)
	if (draw_textfield("newprojectdescription", dx, dy, dw, 76, popup.tbx_description, null, "", "top"))
	{
		popup.description = popup.tbx_description.text
	}
	tab_next()
	
	// Project location
	var directory = "../" + directory_name(setting_project_folder) + string_remove_newline(popup.folder);
	
	tab_control(40)
	draw_label_value(dx, dy, dw - 28, 40, text_get("newprojectlocation"), directory, true)
	if (draw_button_icon("newprojectchangefolder", dx + dw - 24, dy + 8, 24, 24, false, icons.FOLDER_EDIT, null, false, "tooltipchangefolder"))
	{
		var fn = file_dialog_save_project(popup.folder)
		if (fn != "")
		{
			popup.folder = filename_name(fn)
			action_setting_project_folder(filename_path(fn))
		}
	}
	tab_next()
	
	// Create
	tab_control_button_label()
	if (draw_button_label("newprojectcreate", dx + dw, dy, null, null, e_button.PRIMARY, null, e_anchor.RIGHT))
	{
		if (window_state = "startup")
			window_state = ""
		
		popup_switch_to = null
		project_create()
	}
	tab_next()
}
