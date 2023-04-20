/// action_project_render_export([fn])
/// @arg [fn]

function action_project_render_export(fn = "")
{
	if (fn = "")
		fn = file_dialog_save_render("")
	
	if (fn = "")
		return 0
	
	project_save_start(fn, false)
	project_save_render()
	project_save_done()
	
	log("Saved render settings", fn)
	toast_new(e_toast.POSITIVE, text_get("alertrendersaved"))
}