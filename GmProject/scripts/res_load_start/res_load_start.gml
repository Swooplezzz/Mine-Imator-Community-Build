/// res_load_start()
/// @desc Starts loading the resource.

function res_load_start()
{
	switch (type)
	{
		case e_res_type.SCENERY:
		case e_res_type.FROM_WORLD:
		{
			load_stage = "open"
			with (app)
			{
				popup_loading.text = text_get("loadsceneryopen")
				popup_loading.load_script = res_load_scenery
			}
			break
		}
		
		case e_res_type.SOUND:
		{
			load_stage = "open"
			with (app)
			{
				popup_loading.text = text_get("loadaudioread")
				popup_loading.caption = other.filename
				popup_loading.load_script = res_load_audio
			}
			break
		}
		
		case e_res_type.PACK:
		case e_res_type.PACK_UNZIPPED:
		{
			load_stage = "unzip"
			with (app)
			{
				popup_loading.text = text_get("loadpackunzip")
				popup_loading.caption = other.filename
				popup_loading.load_script = res_load_pack
			}
			break
		}
	}
}
