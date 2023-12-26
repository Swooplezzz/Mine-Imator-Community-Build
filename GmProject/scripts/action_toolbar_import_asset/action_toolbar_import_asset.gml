/// action_toolbar_import_asset()

function action_toolbar_import_asset()
{
	var fn = file_dialog_open_asset();

	show_debug_message(fn)
	asset_load(fn)
}