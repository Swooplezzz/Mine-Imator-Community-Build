/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.03.04 17:45:23 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void action_tl_texture_blur_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, ObjType(obj_timeline, tl)->texture_blur, nval);
		
		ObjType(obj_timeline, tl)->texture_blur = nval;
		for (IntType i = IntType(0); i < ds_list_size(ObjType(obj_timeline, tl)->tree_list); i++)
			if (!(ObjType(obj_timeline, DsList(ObjType(obj_timeline, tl)->tree_list).Value(i))->selected > 0))
				action_tl_texture_blur_tree(DsList(ObjType(obj_timeline, tl)->tree_list).Value(i), nval, hobj);
	}
	
	void action_tl_texture_filtering(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(texture_filtering) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(texture_filtering) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_texture_filtering, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_texture_filtering_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_texture_filtering_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, ObjType(obj_timeline, tl)->texture_filtering, nval);
		
		ObjType(obj_timeline, tl)->texture_filtering = nval;
		for (IntType i = IntType(0); i < ds_list_size(ObjType(obj_timeline, tl)->tree_list); i++)
			if (!(ObjType(obj_timeline, DsList(ObjType(obj_timeline, tl)->tree_list).Value(i))->selected > 0))
				action_tl_texture_filtering_tree(DsList(ObjType(obj_timeline, tl)->tree_list).Value(i), nval, hobj);
	}
	
	void action_tl_wind(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(wind) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(wind) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_wind, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->wind, enable);
					
					self->wind = enable;
				}
				
			}
		
		
	}
	
	void action_tl_wind_terrain(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(wind_terrain) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(wind_terrain) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_wind_terrain, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->wind_terrain, enable);
					
					self->wind_terrain = enable;
				}
				
			}
		
		
	}
	
	void action_toolbar_exportimage_high_quality(ScopeAny self)
	{
		ObjType(obj_popup, sInt(popup_exportimage))->high_quality = !(ObjType(obj_popup, sInt(popup_exportimage))->high_quality > 0);
	}
	
	void action_toolbar_exportimage_include_hidden(ScopeAny self)
	{
		ObjType(obj_popup, sInt(popup_exportimage))->include_hidden = !ObjType(obj_popup, sInt(popup_exportimage))->include_hidden;
	}
	
	void action_toolbar_exportimage_remove_background(ScopeAny self)
	{
		ObjType(obj_popup, sInt(popup_exportimage))->remove_background = !ObjType(obj_popup, sInt(popup_exportimage))->remove_background;
	}
	
	RealType action_toolbar_exportimage_save(ScopeAny self)
	{
		StringType fn;
		fn = file_dialog_save_image(sVar(project_name));
		if (fn == /*""*/ STR(0))
			return IntType(0);
		sStr(export_filename) = fn;
		log({ /*"Export image"*/ STR(50), sStr(export_filename) });
		global::render_hidden = ObjType(obj_popup, sInt(popup_exportimage))->include_hidden;
		global::render_background = !ObjType(obj_popup, sInt(popup_exportimage))->remove_background;
		global::render_watermark = ObjType(obj_popup, sInt(popup_exportimage))->watermark;
		log({ /*"Hidden"*/ STR(51), yesno(global::render_hidden) });
		log({ /*"Render background"*/ STR(52), yesno(global::render_background) });
		log({ /*"Watermark"*/ STR(53), yesno(global::render_watermark) });
		log({ /*"High Quality"*/ STR(54), yesno(ObjType(obj_popup, sInt(popup_exportimage))->high_quality) });
		log({ /*"Size"*/ STR(55), sVar(project_video_width), sVar(project_video_height) });
		sStr(window_state) = /*"export_image"*/ STR(56);
		sReal(exportmovie_frame) = IntType(0);
		sReal(export_sample) = IntType(0);
		sVar(exportmovie_start) = current_time();
		global::render_samples = -IntType(1);
		if (ObjType(obj_view, sInt(view_main))->quality == e_view_mode_RENDER)
			ObjType(obj_view, sInt(view_main))->quality = e_view_mode_SHADED;
		if (ObjType(obj_view, sInt(view_second))->quality == e_view_mode_RENDER)
			ObjType(obj_view, sInt(view_second))->quality = e_view_mode_SHADED;
		return 0.0;
	}
	
	void action_toolbar_exportimage_watermark(ScopeAny self)
	{
		if (global::trial_version > 0)
		{
			popup_switch(self, sInt(popup_upgrade));
			ObjType(obj_popup, sInt(popup_upgrade))->page = IntType(0);
		}
		else
			ObjType(obj_popup, sInt(popup_exportimage))->watermark = !ObjType(obj_popup, sInt(popup_exportimage))->watermark;
		
	}
	
	void action_toolbar_exportmovie_bit_rate(ScopeAny self, VarType val, VarType add)
	{
		idReal(sInt(popup), bit_rate) = add * idReal(sInt(popup), bit_rate) + val;
	}
	
	void action_toolbar_exportmovie_format(ScopeAny self, VarType format)
	{
		idStr(sInt(popup), format) = format.Str();
	}
	
	void action_toolbar_exportmovie_frame_rate(ScopeAny self, VarType value)
	{
		idReal(sInt(popup), frame_rate) = value;
	}
	
	void action_toolbar_exportmovie_high_quality(ScopeAny self)
	{
		idReal(sInt(popup), high_quality) = !(idReal(sInt(popup), high_quality) > 0);
	}
	
	void action_toolbar_exportmovie_include_audio(ScopeAny self)
	{
		idBool(sInt(popup), include_audio) = !idBool(sInt(popup), include_audio);
	}
	
	void action_toolbar_exportmovie_include_hidden(ScopeAny self)
	{
		idBool(sInt(popup), include_hidden) = !idBool(sInt(popup), include_hidden);
	}
	
	void action_toolbar_exportmovie_remove_background(ScopeAny self)
	{
		idBool(sInt(popup), remove_background) = !idBool(sInt(popup), remove_background);
	}
	
	RealType action_toolbar_exportmovie_save(ScopeAny self)
	{
		StringType fn;
		switch (StringType(ObjType(obj_popup, sInt(popup_exportmovie))->format).id)
		{
			case 57: // mp4
			{
				fn = file_dialog_save_movie_mp4(self, sVar(project_name));
				break;
			}
			case 58: // mov
			{
				fn = file_dialog_save_movie_mov(self, sVar(project_name));
				break;
			}
			case 59: // wmv
			{
				fn = file_dialog_save_movie_wmv(self, sVar(project_name));
				break;
			}
			default:
				fn = file_dialog_save_movie_png(self, sVar(project_name));
				break;
		}
		
		if (fn == /*""*/ STR(0))
			return IntType(0);
		sStr(export_filename) = fn;
		sVar(exportmovie_marker_previous) = sVar(timeline_marker);
		sStr(exportmovie_format) = ObjType(obj_popup, sInt(popup_exportmovie))->format;
		sReal(exportmovie_frame_rate) = ObjType(obj_popup, sInt(popup_exportmovie))->frame_rate;
		sReal(exportmovie_high_quality) = ObjType(obj_popup, sInt(popup_exportmovie))->high_quality;
		sInt(exportmovie_current_sound) = null_;
		if (sVar(timeline_region_start) != null_)
		{
			sVar(exportmovie_marker_start) = sVar(timeline_region_start);
			sVar(exportmovie_marker_end) = sVar(timeline_region_end);
		}
		else
		{
			sVar(exportmovie_marker_start) = IntType(0);
			sVar(exportmovie_marker_end) = sVar(timeline_length);
		}
		
		if (sStr(exportmovie_format) != /*"png"*/ STR(60))
		{
			StringType fmt = ObjType(obj_popup, sInt(popup_exportmovie))->format;
			if (fmt == /*"wmv"*/ STR(59))
				fmt = /*"asf"*/ STR(61);
			log({ /*"Export movie"*/ STR(62), fn });
			log({ /*"Format"*/ STR(63), sStr(exportmovie_format) });
			log({ /*"Bitrate"*/ STR(64), ObjType(obj_popup, sInt(popup_exportmovie))->bit_rate });
			log({ /*"Framerate"*/ STR(65), sReal(exportmovie_frame_rate) });
			log({ /*"Audio"*/ STR(66), yesno(ObjType(obj_popup, sInt(popup_exportmovie))->include_audio) });
			log({ /*"High Quality"*/ STR(54), yesno(sReal(exportmovie_high_quality)) });
			log({ /*"Size"*/ STR(55), sVar(project_video_width), sVar(project_video_height) });
			movie_set(sVar(project_video_width), sVar(project_video_height), ObjType(obj_popup, sInt(popup_exportmovie))->bit_rate, sReal(exportmovie_frame_rate), ObjType(obj_popup, sInt(popup_exportmovie))->include_audio);
			VarType err = movie_start(fn, fmt);
			if (err < IntType(0))
			{
				log({ /*"Error when exporting, error code"*/ STR(67), err });
				error(/*"errorexportmovie"*/ STR(68));
				global::render_hidden = false;
				global::render_watermark = false;
				return IntType(0);
			}
			if (ObjType(obj_popup, sInt(popup_exportmovie))->include_audio)
			{
				withAll (obj_resource, self->id)
				{
					if (self->type == e_res_type_SOUND && self->ready)
					{
						if (!is_cpp())
						{
							if (self->sound_buffer != null_)
								buffer_save(self->sound_buffer, temp_file);
						}
						else
							global::_app->exportmovie_current_sound = self->sound_index;
						
						self->sound_file_id = movie_audio_file_add(temp_file);
						if (self->sound_file_id < IntType(0))
						{
							movie_done();
							log({ /*"Error adding audio file, error code"*/ STR(69), self->sound_file_id });
							error(/*"errorexportmovie"*/ STR(68));
							return IntType(0);
						}
					}
				}
				
				withAll (obj_timeline, self->id)
				{
					if (self->type != e_tl_type_AUDIO || (self->hide > 0 && !global::render_hidden))
						continue;
					for (IntType k = IntType(0); k < ds_list_size(self->keyframe_list); k++)
					{
						withOne (obj_keyframe, DsList(self->keyframe_list).Value(k), self->id)
						{
							if (self->value.Value(e_value_SOUND_OBJ) != null_ && idBool(self->value.Value(e_value_SOUND_OBJ), ready) && self->value.Value(e_value_SOUND_VOLUME) > IntType(0) && tl_keyframe_length(self->id) > IntType(0) && self->position < global::_app->exportmovie_marker_end && self->position + tl_keyframe_length(self->id) >= global::_app->exportmovie_marker_start)
							{
								VarType ret = movie_audio_sound_add(idVar(self->value.Value(e_value_SOUND_OBJ), sound_file_id), max({ IntType(0), self->position - global::_app->exportmovie_marker_start }) / global::_app->project_tempo, self->value.Value(e_value_SOUND_VOLUME), self->value.Value(e_value_SOUND_START) + max({ IntType(0), global::_app->exportmovie_marker_start - self->position }) / global::_app->project_tempo, self->value.Value(e_value_SOUND_END));
								if (ret < IntType(0))
								{
									movie_done();
									log({ /*"Error adding sound, error code"*/ STR(70), ret });
									error(/*"errorexportmovie"*/ STR(68));
									return IntType(0);
								}
							}
						}
						
					}
				}
				
			}
			if (!is_cpp())
				sInt(exportmovie_buffer) = buffer_create((IntType)(sVar(project_video_width) * sVar(project_video_height) * IntType(4)), buffer_fixed, IntType(4));
			global::render_background = true;
		}
		else
		{
			log({ /*"Export image sequence"*/ STR(71), fn });
			log({ /*"Framerate"*/ STR(65), sReal(exportmovie_frame_rate) });
			log({ /*"High Quality"*/ STR(54), yesno(sReal(exportmovie_high_quality)) });
			log({ /*"Size"*/ STR(55), sVar(project_video_width), sVar(project_video_height) });
			global::render_background = !ObjType(obj_popup, sInt(popup_exportmovie))->remove_background;
		}
		
		global::render_hidden = ObjType(obj_popup, sInt(popup_exportmovie))->include_hidden;
		global::render_watermark = ObjType(obj_popup, sInt(popup_exportmovie))->watermark;
		sStr(window_state) = /*"export_movie"*/ STR(49);
		sReal(exportmovie_frame) = IntType(0);
		sReal(export_sample) = IntType(0);
		sVar(exportmovie_start) = current_time();
		global::render_samples = -IntType(1);
		if (ObjType(obj_view, sInt(view_main))->quality == e_view_mode_RENDER)
			ObjType(obj_view, sInt(view_main))->quality = e_view_mode_SHADED;
		if (ObjType(obj_view, sInt(view_second))->quality == e_view_mode_RENDER)
			ObjType(obj_view, sInt(view_second))->quality = e_view_mode_SHADED;
		sVar(timeline_marker) = sVar(exportmovie_marker_start);
		action_tl_play_start();
		return 0.0;
	}
	
	void action_toolbar_exportmovie_video_quality(ScopeAny self, VarType videoquality)
	{
		idInt(sInt(popup), video_quality) = videoquality;
		if (idInt(sInt(popup), video_quality) > IntType(0))
			idReal(sInt(popup), bit_rate) = ObjType(obj_videoquality, idInt(sInt(popup), video_quality))->bit_rate;
	}
	
	void action_toolbar_exportmovie_watermark(ScopeAny self)
	{
		if (global::trial_version > 0)
		{
			popup_switch(self, sInt(popup_upgrade));
			ObjType(obj_popup, sInt(popup_upgrade))->page = IntType(0);
		}
		else
			idBool(sInt(popup), watermark) = !idBool(sInt(popup), watermark);
		
	}
	
	void action_toolbar_export_image(ScopeAny self)
	{
		popup_show(self, sInt(popup_exportimage));
	}
	
	void action_toolbar_export_movie(ScopeAny self)
	{
		popup_show(self, sInt(popup_exportmovie));
	}
	
	void action_toolbar_importimage_type(ScopeAny self, VarType type)
	{
		ObjType(obj_popup, sInt(popup_importimage))->type = type;
	}
	
	void action_toolbar_importitemsheet_is_sheet(ScopeAny self, VarType enable)
	{
		ObjType(obj_popup, sInt(popup_importitemsheet))->is_sheet = enable;
	}
	
	void action_toolbar_importitemsheet_sheet_size(ScopeAny self, VarType val, VarType add)
	{
		ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size.Real(global::axis_edit) = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size.Real(global::axis_edit) * add + val;
	}
	
	void action_toolbar_import_asset(ScopeAny self)
	{
		asset_load(self);
	}
	
	void action_toolbar_new(ScopeAny self)
	{
		if (sInt(project_changed) > 0)
		{
			IntType res = show_message_ext(/*"Mine-imator"*/ STR(19), text_get({ /*"questionconfirmnew"*/ STR(72), sVar(project_name) }), text_get({ /*"questionsave"*/ STR(21) }), text_get({ /*"questiondontsave"*/ STR(22) }), text_get({ /*"questioncancel"*/ STR(23) }));
			if (res == IntType(0))
				project_save(self);
			else
				if (res != IntType(1))
					return;
			
		}
		popup_newproject_clear(self);
		popup_show(self, sInt(popup_newproject));
	}
	
	RealType action_toolbar_open(ScopeAny self, VarArgs argument)
	{
		IntType argument_count = argument.Size();
		if (argument_count > IntType(0) && !file_exists_lib(argument[IntType(0)]))
		{
			error(/*"erroropenprojectexists"*/ STR(73));
			return IntType(0);
		}
		if (sInt(project_changed) > 0)
		{
			IntType res = show_message_ext(/*"Mine-imator"*/ STR(19), text_get({ /*"questionconfirmopen"*/ STR(20), sVar(project_name) }), text_get({ /*"questionsave"*/ STR(21) }), text_get({ /*"questiondontsave"*/ STR(22) }), text_get({ /*"questioncancel"*/ STR(23) }));
			if (res == IntType(0))
				project_save(self);
			else
				if (res != IntType(1))
					return IntType(0);
			
		}
		if (argument_count > IntType(0))
			project_load(self, { argument[IntType(0)] });
		else
			project_load(self);
		
		return 0.0;
	}
	
	void action_toolbar_open_folder(ScopeAny self)
	{
		open_url(sStr(project_folder));
	}
	
	RealType action_toolbar_open_last_backup(ScopeAny self)
	{
		StringType fn = sStr(project_folder) + /*"/"*/ STR(16) + filename_name(sStr(project_folder)) + /*".backup1"*/ STR(74);
		if (!file_exists(fn))
			return IntType(0);
		action_toolbar_open(self, { fn });
		return 0.0;
	}
	
	RealType action_toolbar_redo(ScopeAny self)
	{
		if (sReal(history_pos) == IntType(0))
			return IntType(0);
		action_tl_play_break(self);
		sReal(history_pos)--;
		global::history_data = sArr(history).Value(sReal(history_pos));
		global::temp_edit = save_id_find(ObjType(obj_history, global::history_data)->save_temp_edit);
		global::ptype_edit = save_id_find(ObjType(obj_history, global::history_data)->save_ptype_edit);
		global::tl_edit = save_id_find(ObjType(obj_history, global::history_data)->save_tl_edit);
		global::res_edit = save_id_find(ObjType(obj_history, global::history_data)->save_res_edit);
		global::axis_edit = ObjType(obj_history, global::history_data)->save_axis_edit;
		global::save_id_seed = ObjType(obj_history, global::history_data)->save_save_id_seed;
		log({ /*"Redo"*/ STR(75), script_get_name((IntType)(ObjType(obj_history, global::history_data)->script)) });
		sReal(history_redo) = true;
		if (ObjType(obj_history, global::history_data)->save_set_var)
			script_execute(self, { ObjType(obj_history, global::history_data)->script, ObjType(obj_history, global::history_data)->new_value, false });
		else
			script_execute(self, { ObjType(obj_history, global::history_data)->script });
		
		sReal(history_redo) = false;
		sBool(history_resource_update) = true;
		global::render_samples = -IntType(1);
		return 0.0;
	}
	
	void action_toolbar_save(ScopeAny self)
	{
		project_save(self);
		toast_new(self, e_toast_POSITIVE, text_get({ /*"alertprojectsaved"*/ STR(76) }));
	}
	
	void action_toolbar_save_as(ScopeAny self)
	{
		popup_saveas_clear(self);
		popup_show(self, sInt(popup_saveas));
	}
	
	void action_toolbar_settings(ScopeAny self)
	{
		tab_toggle(self, sInt(settings));
	}
	
	RealType action_toolbar_undo(ScopeAny self)
	{
		if (sReal(history_pos) == sReal(history_amount))
			return IntType(0);
		action_tl_play_break(self);
		global::history_data = sArr(history).Value(sReal(history_pos));
		global::temp_edit = save_id_find(ObjType(obj_history, global::history_data)->save_temp_edit);
		global::ptype_edit = save_id_find(ObjType(obj_history, global::history_data)->save_ptype_edit);
		global::tl_edit = save_id_find(ObjType(obj_history, global::history_data)->save_tl_edit);
		global::res_edit = save_id_find(ObjType(obj_history, global::history_data)->save_res_edit);
		global::axis_edit = ObjType(obj_history, global::history_data)->save_axis_edit;
		global::save_id_seed = ObjType(obj_history, global::history_data)->save_save_id_seed;
		log({ /*"Undo"*/ STR(77), script_get_name((IntType)(ObjType(obj_history, global::history_data)->script)) });
		sReal(history_undo) = true;
		if (ObjType(obj_history, global::history_data)->save_set_var)
			script_execute(self, { ObjType(obj_history, global::history_data)->script, ObjType(obj_history, global::history_data)->old_value, false });
		else
			script_execute(self, { ObjType(obj_history, global::history_data)->script });
		
		sReal(history_undo) = false;
		sReal(history_pos)++;
		sBool(history_resource_update) = true;
		global::render_samples = -IntType(1);
		return 0.0;
	}
	
	void action_tools_disable_all(ScopeAny self)
	{
		sBool(setting_tool_select) = false;
		sVar(setting_tool_move) = false;
		sBool(setting_tool_rotate) = false;
		sBool(setting_tool_scale) = false;
		sBool(setting_tool_bend) = false;
		sBool(setting_tool_transform) = false;
	}
	
	void action_value_copy(ScopeAny self)
	{
		sVar(context_menu_copy_type) = sVar(context_menu_value_type);
		sVar(context_menu_copy) = global::list_item_value;
	}
	
	void action_value_cut(ScopeAny self)
	{
		action_value_copy(self);
		action_value_reset(self);
	}
	
	void action_value_paste(ScopeAny self)
	{
		script_execute(self, { sVar(context_menu_value_script), sVar(context_menu_copy), false });
	}
	
	void action_value_reset(ScopeAny self)
	{
		script_execute(self, { sVar(context_menu_value_script), sVar(context_menu_value_default), false });
	}
	
	void action_view_camera(ScopeAny self, VarType cam)
	{
		ObjType(obj_view, sInt(settings_menu_view))->camera = cam;
	}
	
	RealType angle_difference_fix(RealType angle1, VarType angle2)
	{
		return (mod(((mod((angle1 - angle2), IntType(360))) + IntType(540)), IntType(360))) - IntType(180);
	}
	
	void app_event_create(ScopeAny self)
	{
		global::debug_indent = IntType(0);
		sBool(debug_info) = dev_mode;
		randomize();
		gml_release_mode(true);
		if (!app_startup(self))
			game_end();
	}
	
	void app_event_draw(ScopeAny self)
	{
		global::delta = clamp((RealType)gmlGlobal::delta_time / (1000000.0 / 60.0), 0.5, 1.5);
		draw_set_font(sInt(font_label));
		draw_set_color((IntType)(global::c_text_main));
		window_draw(self);
	}
	
	BoolType app_event_game_end(ScopeAny self)
	{
		if (sVar(startup_error) > 0)
			return true;
		audio_stop_all();
		if (sStr(window_state) != /*"new_assets"*/ STR(78) && sStr(window_state) != /*"load_assets"*/ STR(79))
		{
			if (sInt(project_changed) > 0)
			{
				IntType res = show_message_ext(/*"Mine-imator"*/ STR(19), text_get({ /*"questionconfirmexit"*/ STR(80), sVar(project_name) }), text_get({ /*"questionsave"*/ STR(21) }), text_get({ /*"questiondontsave"*/ STR(22) }), text_get({ /*"questioncancel"*/ STR(23) }));
				if (res == IntType(0))
					project_save(self);
				else
					if (res != IntType(1))
						return false;
				
			}
			settings_save(self);
		}
		log({ /*"Closing..."*/ STR(81) });
		return true;
	}
	
	BoolType app_event_http(ScopeAny self)
	{
		if (DsMap(gmlGlobal::async_load)[/*"id"*/ STR(82)] == sInt(http_assets) && DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] < IntType(1) && (!dev_mode || dev_mode_check_assets))
		{
			sInt(http_assets) = null_;
			if (DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] == IntType(0) && DsMap(gmlGlobal::async_load)[/*"http_status"*/ STR(84)] == http_ok)
			{
				IntType decodedmap = json_decode(DsMap(gmlGlobal::async_load)[/*"result"*/ STR(85)]);
				if (ds_map_valid(decodedmap))
				{
					VarType versionslist = DsMap(decodedmap).Value(/*"versions"*/ STR(86));
					if (ds_list_valid(versionslist))
					{
						VarType newversionmap = DsList(versionslist).Value(ds_list_size((IntType)(versionslist)) - IntType(1));
						if (ds_map_valid(newversionmap) && !file_exists_lib(minecraft_directory + DsMap(newversionmap).Value(/*"version"*/ STR(87)) + /*".zip"*/ STR(5)))
						{
							if (DsMap(newversionmap).Value(/*"format"*/ STR(88)) >= minecraft_assets_format)
							{
								sVar(setting_minecraft_assets_new_version) = DsMap(newversionmap).Value(/*"version"*/ STR(87));
								sVar(setting_minecraft_assets_new_format) = DsMap(newversionmap).Value(/*"format"*/ STR(88));
								sVar(setting_minecraft_assets_new_changes) = DsMap(newversionmap).Value(/*"changes"*/ STR(89));
								if (is_string(DsMap(newversionmap).Value(/*"image"*/ STR(90))))
								{
									sStr(setting_minecraft_assets_new_image) = mc_file_directory + DsMap(newversionmap).Value(/*"image"*/ STR(90));
									sInt(assets_http_image) = http_get_file(link_assets + DsMap(newversionmap).Value(/*"image"*/ STR(90)), sStr(setting_minecraft_assets_new_image));
								}
								else
									sStr(setting_minecraft_assets_new_image) = /*""*/ STR(0);
								
								toast_new(self, e_toast_INFO, text_get({ /*"alertnewassets"*/ STR(91), sVar(setting_minecraft_assets_new_version) }));
								ObjType(obj_toast, sInt(toast_last))->dismiss_time = no_limit;
								log({ /*"New assets found"*/ STR(92), sVar(setting_minecraft_assets_new_version) });
							}
						}
						else
							log({ /*"Using the latest assets"*/ STR(93) });
						
					}
					ds_map_destroy(decodedmap);
				}
			}
		}
		else
			if (DsMap(gmlGlobal::async_load)[/*"id"*/ STR(82)] == sInt(http_download_assets_file))
			{
				if (DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] == IntType(1))
					sReal(new_assets_download_progress) = ((RealType)DsMap(gmlGlobal::async_load)[/*"sizeDownloaded"*/ STR(94)] / DsMap(gmlGlobal::async_load)[/*"contentLength"*/ STR(95)]) * 0.25;
				else
				{
					sInt(http_download_assets_file) = null_;
					sInt(http_download_assets_zip) = http_get_file(link_assets + sStr(new_assets_version) + /*".zip"*/ STR(5), mc_file_directory + sStr(new_assets_version) + /*".zip"*/ STR(5));
				}
				
			}
			else
				if (DsMap(gmlGlobal::async_load)[/*"id"*/ STR(82)] == sInt(http_download_assets_zip))
				{
					if (DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] == IntType(1))
						sReal(new_assets_download_progress) = 0.25 + ((RealType)DsMap(gmlGlobal::async_load)[/*"sizeDownloaded"*/ STR(94)] / DsMap(gmlGlobal::async_load)[/*"contentLength"*/ STR(95)]) * 0.75;
					else
					{
						sInt(http_download_assets_zip) = null_;
						sStr(setting_minecraft_assets_version) = sStr(new_assets_version);
						sVar(setting_minecraft_assets_new_version) = /*""*/ STR(0);
						file_copy_lib(mc_file_directory + sStr(new_assets_version) + /*".midata"*/ STR(96), minecraft_directory + sStr(new_assets_version) + /*".midata"*/ STR(96));
						file_copy_lib(mc_file_directory + sStr(new_assets_version) + /*".zip"*/ STR(5), minecraft_directory + sStr(new_assets_version) + /*".zip"*/ STR(5));
						file_delete_lib(mc_file_directory + sStr(new_assets_version) + /*".midata"*/ STR(96));
						file_delete_lib(mc_file_directory + sStr(new_assets_version) + /*".zip"*/ STR(5));
						if (sVar(new_assets_image) != /*""*/ STR(0))
							file_delete_lib(mc_file_directory + sVar(new_assets_image));
						if (!minecraft_assets_load_startup(self))
						{
							error(/*"errorloadassets"*/ STR(97));
							game_end();
							return false;
						}
					}
					
				}
				else
					if (DsMap(gmlGlobal::async_load)[/*"id"*/ STR(82)] == sInt(http_alert_news) && DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] < IntType(1))
					{
						sInt(http_alert_news) = null_;
						if (DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] == IntType(0) && DsMap(gmlGlobal::async_load)[/*"http_status"*/ STR(84)] == http_ok)
						{
							IntType decodedmap = json_decode(DsMap(gmlGlobal::async_load)[/*"result"*/ STR(85)]);
							if (ds_map_valid(decodedmap))
							{
								VarType newslist = DsMap(decodedmap).Value(/*"default"*/ STR(98));
								for (IntType n = IntType(0); n < ds_list_size((IntType)(newslist)); n++)
								{
									VarType newsmap, title, text, icon, button, buttonurl, iid;
									newsmap = DsList(newslist).Value(n);
									if (ds_map_valid(newsmap))
									{
										text = DsMap(newsmap).Value(/*"text"*/ STR(99));
										icon = DsMap(newsmap).Value(/*"icon"*/ STR(100));
										switch (StringType(icon).id)
										{
											case 101: // website
											{
												icon = icons_WORLD;
												break;
											}
											case 102: // forums
											{
												icon = icons_COMMENT;
												break;
											}
											case 103: // save
											{
												icon = icons_SAVE;
												break;
											}
											case 104: // download
											{
												icon = icons_DOWNLOAD;
												break;
											}
											case 105: // cake
											{
												icon = icons_BIRTHDAY;
												break;
											}
											case 106: // upgrade
											{
												icon = icons_KEY;
												break;
											}
											case 9: // render
											{
												icon = (ObjType(obj_theme, sInt(setting_theme))->dark ? icons_SPHERE_MATERIAL__DARK : icons_SPHERE_MATERIAL);
												break;
											}
											default:
												icon = null_;
												break;
										}
										
										button = DsMap(newsmap).Value(/*"button"*/ STR(107));
										buttonurl = DsMap(newsmap).Value(/*"buttonurl"*/ STR(108));
										if (!is_undefined(DsMap(newsmap).Value(/*"saveclose"*/ STR(109))))
											iid = DsMap(newsmap).Value(/*"id"*/ STR(82));
										else
											iid = null_;
										
										if (!(iid > 0) || ds_list_find_index(sInt(closed_toast_list), iid) < IntType(0))
										{
											toast_new(self, e_toast_INFO, title);
											toast_add_action(self, button, ID_popup_open_url, buttonurl);
											ObjType(obj_toast, sInt(toast_last))->dismiss_time = no_limit;
											ObjType(obj_toast, sInt(toast_last))->iid = iid;
										}
									}
								}
								ds_map_destroy(decodedmap);
							}
							else
								log({ /*"Failed to decode"*/ STR(110) });
							
						}
					}
					else
						if (DsMap(gmlGlobal::async_load)[/*"id"*/ STR(82)] == sInt(http_downloadskin) && DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] < IntType(1))
						{
							sInt(http_downloadskin) = null_;
							if (sInt(popup) == sInt(popup_downloadskin))
							{
								ObjType(obj_popup, sInt(popup_downloadskin))->fail_message = text_get({ /*"errordownloadskininternet"*/ STR(111) });
								if (ObjType(obj_popup, sInt(popup_downloadskin))->texture > 0)
								{
									texture_free(ObjType(obj_popup, sInt(popup_downloadskin))->texture);
									ObjType(obj_popup, sInt(popup_downloadskin))->texture = null_;
								}
							}
							else
							{
								ObjType(obj_builder, global::mc_builder)->block_skull_texture = null_;
								ObjType(obj_builder, global::mc_builder)->block_skull_texture_fail = false;
							}
							
							if (DsMap(gmlGlobal::async_load)[/*"status"*/ STR(83)] == IntType(0))
							{
								if (sInt(popup) == sInt(popup_downloadskin))
									ObjType(obj_popup, sInt(popup_downloadskin))->fail_message = text_get({ /*"errordownloadskinuser"*/ STR(112), string_remove_newline(ObjType(obj_popup, sInt(popup_downloadskin))->username) });
								else
									ObjType(obj_builder, global::mc_builder)->block_skull_texture_fail = true;
								
								if (DsMap(gmlGlobal::async_load)[/*"http_status"*/ STR(84)] == http_ok && file_exists_lib(download_image_file))
								{
									if (sInt(popup) == sInt(popup_downloadskin))
									{
										ObjType(obj_popup, sInt(popup_downloadskin))->texture = texture_create(download_image_file);
										ObjType(obj_popup, sInt(popup_downloadskin))->fail_message = /*""*/ STR(0);
									}
									else
									{
										ObjType(obj_builder, global::mc_builder)->block_skull_texture = texture_create(download_image_file);
										ObjType(obj_builder, global::mc_builder)->block_skull_texture_fail = false;
									}
									
								}
							}
						}
				
			
		
		
		return false;
	}
	
	RealType app_event_step(ScopeAny self)
	{
		if (dev_mode && !is_cpp())
		{
			if (keyboard_check_pressed(vk_f1))
				global::window_debug_current = e_window_MAIN;
			if (keyboard_check_pressed(vk_f2) && ds_list_size(global::window_list) > IntType(0))
				global::window_debug_current = DsList(global::window_list).Value(IntType(0));
			if (keyboard_check_pressed(vk_f3) && ds_list_size(global::window_list) > IntType(1))
				global::window_debug_current = DsList(global::window_list).Value(IntType(1));
			if (keyboard_check_pressed(vk_f4) && ds_list_size(global::window_list) > IntType(2))
				global::window_debug_current = DsList(global::window_list).Value(IntType(2));
		}
		app_update_window();
		if (window_mouse_is_active(window_get_current()))
			app_update_mouse();
		if (window_get_current() == e_window_MAIN || (window_get_current() != e_window_MAIN && dev_mode && !is_cpp()))
		{
			sStr(textbox_input) = gmlGlobal::keyboard_string;
			gmlGlobal::keyboard_string = /*""*/ STR(0);
			app_update_micro_animations();
			if (sStr(window_state) == /*"load_assets"*/ STR(79))
				return IntType(0);
			if (sStr(window_state) == /*"new_assets"*/ STR(78) || sStr(window_state) == /*"export_movie"*/ STR(49) || sStr(window_state) == /*"export_image"*/ STR(56))
				return IntType(0);
			app_update_place(self);
			app_update_keybinds();
			app_update_keyboard(self);
			app_update_play();
			app_update_animate(self);
			app_update_previews();
			app_update_backup(self);
			app_update_recent(self);
			app_update_work_camera(self);
			if (window_get_current() == e_window_MAIN)
				app_update_caption();
			app_update_toasts();
			app_update_interface(self);
			app_update_lists(self);
			app_update_minecraft_resources();
			global::current_step += 60.0 / gmlGlobal::room_speed;
		}
		return 0.0;
	}
	
	BoolType app_mouse_box(ScopeAny self, VarType xx, VarType yy, VarType w, VarType h, StringType busy)
	{
		return (gmlGlobal::mouse_x >= xx && gmlGlobal::mouse_y >= yy && gmlGlobal::mouse_x < xx + w && gmlGlobal::mouse_y < yy + h && (sVar(window_busy) == /*""*/ STR(0) || sVar(window_busy) == busy) && sStr(popup_ani_type) == /*""*/ STR(0));
	}
	
	void app_mouse_clear(ScopeAny self)
	{
		sBool(mouse_left) = false;
		sBool(mouse_left_pressed) = false;
		sBool(mouse_left_double_pressed) = false;
		sBool(mouse_left_released) = false;
		sBool(mouse_right) = false;
		sBool(mouse_right_pressed) = false;
		sBool(mouse_right_released) = false;
		sBool(mouse_middle) = false;
		sBool(mouse_middle_pressed) = false;
		sInt(mouse_click_count) = IntType(0);
		mouse_clear(mb_left);
		mouse_clear(mb_right);
		mouse_clear(mb_middle);
	}
	
	RealType app_mouse_wrap(VarType xx, VarType yy, VarType w, VarType h)
	{
		if (!window_mouse_get_permission())
			return IntType(0);
		VarType setx, sety;
		RealType size;
		setx = gmlGlobal::mouse_x;
		sety = gmlGlobal::mouse_y;
		size = IntType(8);
		if ((gmlGlobal::mouse_x - (size / 2.0)) < xx)
		{
			setx = xx + w - size;
			global::_app->mouse_wrap_x--;
		}
		if ((gmlGlobal::mouse_y - (size / 2.0)) < yy)
		{
			sety = yy + h - size;
			global::_app->mouse_wrap_y--;
		}
		if (gmlGlobal::mouse_x > (xx + w - (size / 2.0)) || (display_mouse_get_x() > (window_get_x() + window_get_width()) - (size / 2.0)))
		{
			setx = xx + size;
			global::_app->mouse_wrap_x++;
		}
		if (gmlGlobal::mouse_y > (yy + h - (size / 2.0)) || (display_mouse_get_y() > (window_get_y() + window_get_height()) - (size / 2.0)))
		{
			sety = yy + size;
			global::_app->mouse_wrap_y++;
		}
		if (setx != gmlGlobal::mouse_x || sety != gmlGlobal::mouse_y)
		{
			window_mouse_set((IntType)(setx), (IntType)(sety));
			global::_app->mouse_current_x = setx;
			global::_app->mouse_current_y = sety;
		}
		return 0.0;
	}
	
	void app_start_place(ScopeAny self, IntType tl, BoolType spawn)
	{
		sVar(window_busy) = /*"place"*/ STR(113);
		sInt(place_tl) = tl;
		sBool(place_tl_render) = false;
		sBool(place_spawn) = spawn;
		ObjType(obj_view, sInt(view_main))->update_depth = true;
		ObjType(obj_view, sInt(view_main))->surface_depth_value = 0.995;
		ObjType(obj_view, sInt(view_second))->update_depth = true;
		ObjType(obj_view, sInt(view_second))->surface_depth_value = 0.995;
		withOne (obj_timeline, sInt(place_tl), self->id)
			tl_mark_placed(ScopeAny(self), true);
		
	}
	
	void app_stop_place()
	{
		withOne (obj_timeline, global::_app->place_tl, global::_app->id)
			tl_mark_placed(ScopeAny(self), false);
		
		global::_app->place_tl = null_;
		global::_app->window_busy = /*""*/ STR(0);
		mouse_clear(mb_left);
	}
	
	RealType app_update_place(ScopeAny self)
	{
		if (sVar(window_busy) != /*"place"*/ STR(113))
			return IntType(0);
		sInt(mouse_cursor) = cr_drag;
		if (vec3_length(vec3_sub(sVec(cam_work_from), sVec(place_cam_work_from))) > IntType(1) || sVar(place_cam_work_angle_look_xy) != sVar(cam_work_angle_look_xy) || sVar(place_cam_work_angle_look_z) != sVar(cam_work_angle_look_z))
		{
			ObjType(obj_view, sInt(view_main))->update_depth = true;
			ObjType(obj_view, sInt(view_second))->update_depth = true;
			sVec(place_cam_work_from) = sVec(cam_work_from);
			sVar(place_cam_work_angle_look_xy) = sVar(cam_work_angle_look_xy);
			sVar(place_cam_work_angle_look_z) = sVar(cam_work_angle_look_z);
		}
		if (sVar(place_view_pos) != null_)
		{
			RealType snappos = sReal(setting_snap);
			if (keyboard_check(vk_shift))
				snappos = !(snappos > 0);
			if (snappos > 0)
			{
				sVar(place_view_pos)[X_] = snap(sVar(place_view_pos).Value(X_), sReal(setting_snap_size_position));
				sVar(place_view_pos)[Y_] = snap(sVar(place_view_pos).Value(Y_), sReal(setting_snap_size_position));
				sVar(place_view_pos)[Z_] = snap(sVar(place_view_pos).Value(Z_), sReal(setting_snap_size_position));
			}
			withOne (obj_timeline, sInt(place_tl), global::_app->id)
			{
				self->value[e_value_POS_X] = global::_app->place_view_pos.Value(X_);
				self->value[e_value_POS_Y] = global::_app->place_view_pos.Value(Y_);
				self->value[e_value_POS_Z] = global::_app->place_view_pos.Value(Z_);
				if (global::_app->place_spawn)
				{
					self->value_default[e_value_POS_X] = self->value.Value(e_value_POS_X);
					self->value_default[e_value_POS_Y] = self->value.Value(e_value_POS_Y);
					self->value_default[e_value_POS_Z] = self->value.Value(e_value_POS_Z);
				}
				self->update_matrix = true;
			}
			
			tl_update_matrix(self);
			withOne (obj_history, sArr(history).Value(IntType(0)), global::_app->id)
			{
				self->value_default[e_value_POS_X] = global::_app->place_view_pos.Value(X_);
				self->value_default[e_value_POS_Y] = global::_app->place_view_pos.Value(Y_);
				self->value_default[e_value_POS_Z] = global::_app->place_view_pos.Value(Z_);
			}
			
			sVar(place_view_pos) = null_;
		}
		if (sInt(place_view_mouse) == null_ && sBool(mouse_left_pressed))
			app_stop_place();
		if (keyboard_check_pressed(vk_escape))
		{
		}
		sInt(place_view_mouse) = null_;
		return 0.0;
	}
	
}
