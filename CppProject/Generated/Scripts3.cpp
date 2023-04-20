/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.03.04 17:45:23 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void action_bench_item_3d(ScopeAny self, VarType enable)
	{
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->item_3d = enable;
			render_generate_item(ScopeAny(self));
		}
		
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	void action_bench_item_bounce(ScopeAny self, VarType enable)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->item_bounce = enable;
	}
	
	void action_bench_item_face_camera(ScopeAny self, VarType enable)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->item_face_camera = enable;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	void action_bench_item_slot(ScopeAny self, VarType index)
	{
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->item_slot = index;
			render_generate_item(ScopeAny(self));
		}
		
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	void action_bench_item_spin(ScopeAny self, VarType enable)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->item_spin = enable;
	}
	
	RealType action_bench_item_tex(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				VarType fn = /*""*/ STR(0);
				switch ((IntType)res)
				{
					case e_option_BROWSE:
					{
						fn = file_dialog_open_image_pack();
						if (!file_exists_lib(fn))
							return IntType(0);
						if (filename_ext(fn) == /*".zip"*/ STR(5))
						{
							res = new_res(self, fn, e_res_type_PACK);
							withOne (Object, res, self->id)
								res_load(self);
							
						}
						else
							popup_importitemsheet_show(self, fn, ID_action_bench_item_tex);
						
						return IntType(0);
					}
					
					case e_option_IMPORT_ITEM_SHEET_DONE:
					{
						fn = ObjType(obj_popup, sInt(popup_importitemsheet))->filename;
						if (ObjType(obj_popup, sInt(popup_importitemsheet))->is_sheet)
						{
							res = new_res(self, fn, e_res_type_ITEM_SHEET);
							idVar(res, item_sheet_size) = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size;
						}
						else
							res = new_res(self, fn, e_res_type_TEXTURE);
						
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
				}
				
				IntType hobj = history_set_res(self, ID_action_bench_item_tex, fn, ObjType(obj_bench_settings, sInt(bench_settings))->item_tex, res);
				ObjType(obj_history, hobj)->item_sheet_size = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size;
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->item_tex = res;
			render_generate_item(ScopeAny(self));
		}
		
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	RealType action_bench_item_tex_material(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				VarType fn = /*""*/ STR(0);
				switch ((IntType)res)
				{
					case e_option_BROWSE:
					{
						fn = file_dialog_open_image_pack();
						if (!file_exists_lib(fn))
							return IntType(0);
						if (filename_ext(fn) == /*".zip"*/ STR(5))
						{
							res = new_res(self, fn, e_res_type_PACK);
							withOne (Object, res, self->id)
								res_load(self);
							
						}
						else
							popup_importitemsheet_show(self, fn, ID_action_bench_item_tex_material);
						
						return IntType(0);
					}
					
					case e_option_IMPORT_ITEM_SHEET_DONE:
					{
						fn = ObjType(obj_popup, sInt(popup_importitemsheet))->filename;
						if (ObjType(obj_popup, sInt(popup_importitemsheet))->is_sheet)
						{
							res = new_res(self, fn, e_res_type_ITEM_SHEET);
							idVar(res, item_sheet_size) = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size;
						}
						else
							res = new_res(self, fn, e_res_type_TEXTURE);
						
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
				}
				
				IntType hobj = history_set_res(self, ID_action_bench_item_tex_material, fn, ObjType(obj_bench_settings, sInt(bench_settings))->item_tex_material, res);
				ObjType(obj_history, hobj)->item_sheet_size = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size;
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->item_tex_material = res;
			render_generate_item(ScopeAny(self));
		}
		
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	RealType action_bench_item_tex_normal(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				VarType fn = /*""*/ STR(0);
				switch ((IntType)res)
				{
					case e_option_BROWSE:
					{
						fn = file_dialog_open_image_pack();
						if (!file_exists_lib(fn))
							return IntType(0);
						if (filename_ext(fn) == /*".zip"*/ STR(5))
						{
							res = new_res(self, fn, e_res_type_PACK);
							withOne (Object, res, self->id)
								res_load(self);
							
						}
						else
							popup_importitemsheet_show(self, fn, ID_action_bench_item_tex_normal);
						
						return IntType(0);
					}
					
					case e_option_IMPORT_ITEM_SHEET_DONE:
					{
						fn = ObjType(obj_popup, sInt(popup_importitemsheet))->filename;
						if (ObjType(obj_popup, sInt(popup_importitemsheet))->is_sheet)
						{
							res = new_res(self, fn, e_res_type_ITEM_SHEET);
							idVar(res, item_sheet_size) = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size;
						}
						else
							res = new_res(self, fn, e_res_type_TEXTURE);
						
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
				}
				
				IntType hobj = history_set_res(self, ID_action_bench_item_tex_normal, fn, ObjType(obj_bench_settings, sInt(bench_settings))->item_tex_normal, res);
				ObjType(obj_history, hobj)->item_sheet_size = ObjType(obj_popup, sInt(popup_importitemsheet))->sheet_size;
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->item_tex_normal = res;
			render_generate_item(ScopeAny(self));
		}
		
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	void action_bench_light_type(ScopeAny self, VarType type)
	{
		if (!(sReal(history_undo) > 0) && !(sReal(history_redo) > 0))
			history_set_var(self, ID_action_bench_light_type, ObjType(obj_bench_settings, sInt(bench_settings))->light_type, type, true);
		ObjType(obj_bench_settings, sInt(bench_settings))->light_type = type;
	}
	
	RealType action_bench_model(ScopeAny self, IntType res)
	{
		StringType fn = /*""*/ STR(0);
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				if (res == e_option_BROWSE)
				{
					fn = file_dialog_open_model();
					if (!file_exists_lib(fn))
						return IntType(0);
					if (filename_ext(fn) == /*".zip"*/ STR(5))
					{
						fn = unzip_model(fn);
						if (!file_exists_lib(fn))
							return IntType(0);
					}
					res = new_res(self, fn, e_res_type_MODEL);
					if (idBool(res, replaced))
					{
						global::res_edit = res;
						action_res_replace(self, { fn });
					}
					else
						withOne (Object, res, self->id)
							res_load(self);
					
					
				}
				history_set_res(self, ID_action_bench_model, fn, ObjType(obj_bench_settings, sInt(bench_settings))->model, res);
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->model = res;
			temp_update_model(ScopeAny(self));
			temp_update_model_shape(ScopeAny(self));
			withOne (obj_preview, self->preview, self->id)
			{
				preview_reset_view(ScopeAny(self));
				self->update = true;
			}
			
		}
		
		return 0.0;
	}
	
	RealType action_bench_model_name(ScopeAny self, VarType name)
	{
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			if (self->model_name == name)
				return IntType(0);
			self->model_name = name;
			self->model_state = array_copy_1d(ObjType(obj_model, DsMap(ObjType(obj_minecraft_assets, global::mc_assets)->model_name_map).Value(sVar(model_name)))->default_state);
			temp_update_model(ScopeAny(self));
			if (self->type == e_temp_type_BODYPART)
				temp_update_model_part(ScopeAny(self));
			temp_update_model_shape(ScopeAny(self));
			model_shape_update_color(ScopeAny(self));
			if (self->pattern_type != /*""*/ STR(0))
				array_add(VarType::CreateRef(global::pattern_update), self->id);
			withOne (obj_preview, self->preview, self->id)
			{
				preview_reset_view(ScopeAny(self));
				self->update = true;
			}
			
		}
		
		return 0.0;
	}
	
	RealType action_bench_model_part_name(ScopeAny self, VarType name)
	{
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			if (self->model_part_name == name)
				return IntType(0);
			self->model_part_name = name;
			temp_update_model_part(ScopeAny(self));
			temp_update_model_shape(ScopeAny(self));
			model_shape_update_color(ScopeAny(self));
			withOne (obj_preview, self->preview, self->id)
				self->update = true;
			
		}
		
		return 0.0;
	}
	
	RealType action_bench_model_state(ScopeAny self, StringType val)
	{
		VarType state = idVar(sInt(menu_model_state), name);
		withOne (obj_bench_settings, sInt(bench_settings), global::_app->id)
		{
			if (state_vars_get_value(self->model_state, state) == val)
				return IntType(0);
			state_vars_set_value(VarType::CreateRef(self->model_state), state, val);
			temp_update_model(ScopeAny(self));
			temp_update_model_part(ScopeAny(self));
			temp_update_model_shape(ScopeAny(self));
			model_shape_update_color(ScopeAny(self));
			withOne (obj_preview, self->preview, self->id)
				self->update = true;
			
		}
		
		return 0.0;
	}
	
	RealType action_bench_model_tex(ScopeAny self, IntType res)
	{
		StringType fn = /*""*/ STR(0);
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				switch ((IntType)res)
				{
					case e_option_BROWSE:
					{
						fn = file_dialog_open_image_pack();
						if (!file_exists_lib(fn))
							return IntType(0);
						IntType type = e_res_type_SKIN;
						if (ObjType(obj_bench_settings, sInt(bench_settings))->type == e_tl_type_MODEL && ObjType(obj_bench_settings, sInt(bench_settings))->model != null_ && idInt(ObjType(obj_bench_settings, sInt(bench_settings))->model, model_format) == e_model_format_BLOCK)
							type = e_res_type_BLOCK_SHEET;
						res = new_res(self, fn, type);
						if (ObjType(obj_bench_settings, sInt(bench_settings))->model_file != null_)
							idVar(res, player_skin) = idVar(ObjType(obj_bench_settings, sInt(bench_settings))->model_file, player_skin);
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
					case e_option_DOWNLOAD_SKIN:
					{
						popup_downloadskin_show(self, ID_action_bench_model_tex);
						return IntType(0);
					}
					
					case e_option_DOWNLOAD_SKIN_DONE:
					{
						directory_create_lib(skins_directory_get());
						fn = skins_directory_get() + ObjType(obj_popup, sInt(popup_downloadskin))->username + /*".png"*/ STR(6);
						file_copy_lib(download_image_file, fn);
						res = new_res(self, fn, e_res_type_DOWNLOADED_SKIN);
						idVar(res, player_skin) = true;
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
				}
				
				history_set_res(self, ID_action_bench_model_tex, fn, ObjType(obj_bench_settings, sInt(bench_settings))->model_tex, res);
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->model_tex = res;
			temp_update_model_shape(ScopeAny(self));
			withOne (obj_preview, self->preview, self->id)
				self->update = true;
			
			if (self->pattern_type != /*""*/ STR(0))
				array_add(VarType::CreateRef(global::pattern_update), self->id);
		}
		
		return 0.0;
	}
	
	RealType action_bench_model_tex_material(ScopeAny self, IntType res)
	{
		StringType fn = /*""*/ STR(0);
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				switch ((IntType)res)
				{
					case e_option_BROWSE:
					{
						fn = file_dialog_open_image_pack();
						if (!file_exists_lib(fn))
							return IntType(0);
						IntType type = e_res_type_SKIN;
						if (ObjType(obj_bench_settings, sInt(bench_settings))->type == e_tl_type_MODEL && ObjType(obj_bench_settings, sInt(bench_settings))->model != null_ && idInt(ObjType(obj_bench_settings, sInt(bench_settings))->model, model_format) == e_model_format_BLOCK)
							type = e_res_type_BLOCK_SHEET;
						res = new_res(self, fn, type);
						if (ObjType(obj_bench_settings, sInt(bench_settings))->model_file != null_)
							idVar(res, player_skin) = idVar(ObjType(obj_bench_settings, sInt(bench_settings))->model_file, player_skin);
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
				}
				
				history_set_res(self, ID_action_bench_model_tex_material, fn, ObjType(obj_bench_settings, sInt(bench_settings))->model_tex_material, res);
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->model_tex_material = res;
			withOne (obj_preview, self->preview, self->id)
				self->update = true;
			
		}
		
		return 0.0;
	}
	
	RealType action_bench_model_tex_normal(ScopeAny self, IntType res)
	{
		StringType fn = /*""*/ STR(0);
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				switch ((IntType)res)
				{
					case e_option_BROWSE:
					{
						fn = file_dialog_open_image_pack();
						if (!file_exists_lib(fn))
							return IntType(0);
						IntType type = e_res_type_SKIN;
						if (ObjType(obj_bench_settings, sInt(bench_settings))->type == e_tl_type_MODEL && ObjType(obj_bench_settings, sInt(bench_settings))->model != null_ && idInt(ObjType(obj_bench_settings, sInt(bench_settings))->model, model_format) == e_model_format_BLOCK)
							type = e_res_type_BLOCK_SHEET;
						res = new_res(self, fn, type);
						if (ObjType(obj_bench_settings, sInt(bench_settings))->model_file != null_)
							idVar(res, player_skin) = idVar(ObjType(obj_bench_settings, sInt(bench_settings))->model_file, player_skin);
						withOne (Object, res, self->id)
							res_load(self);
						
						break;
					}
					
				}
				
				history_set_res(self, ID_action_bench_model_tex_normal, fn, ObjType(obj_bench_settings, sInt(bench_settings))->model_tex_normal, res);
			}
		
		
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->model_tex_normal = res;
			withOne (obj_preview, self->preview, self->id)
				self->update = true;
			
		}
		
		return 0.0;
	}
	
	RealType action_bench_particles(ScopeAny self, StringType fn)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->particle_preset = fn;
		if (fn == /*""*/ STR(0))
			return IntType(0);
		global::temp_creator = sInt(bench_settings);
		bench_clear();
		particles_load(self, fn, sInt(bench_settings));
		global::temp_creator = global::_app->id;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->fire = true;
		return 0.0;
	}
	
	RealType action_bench_scenery(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				StringType fn = /*""*/ STR(0);
				if (res == e_option_IMPORT_WORLD)
				{
					world_import_begin(self, false);
					return IntType(0);
				}
				else
					if (res == e_option_BROWSE)
					{
						fn = file_dialog_open_scenery();
						if (!file_exists_lib(fn))
							return IntType(0);
						res = new_res(self, fn, e_res_type_SCENERY);
						if (idBool(res, replaced))
						{
							global::res_edit = res;
							action_res_replace(self, { fn });
						}
						else
							withOne (Object, res, self->id)
								res_load(self);
						
						
					}
				
				history_set_res(self, ID_action_bench_scenery, fn, ObjType(obj_bench_settings, sInt(bench_settings))->scenery, res);
			}
		
		
		ObjType(obj_bench_settings, sInt(bench_settings))->scenery = res;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	void action_bench_shape_face_camera(ScopeAny self, VarType enable)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->shape_face_camera = enable;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	RealType action_bench_shape_tex(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				StringType fn = /*""*/ STR(0);
				if (res == e_option_BROWSE)
				{
					StringType fn = file_dialog_open_image();
					if (!file_exists_lib(fn))
						return IntType(0);
					res = new_res(self, fn, e_res_type_TEXTURE);
					withOne (Object, res, self->id)
						res_load(self);
					
				}
				history_set_res(self, ID_action_bench_shape_tex, fn, ObjType(obj_bench_settings, sInt(bench_settings))->shape_tex, res);
			}
		
		
		ObjType(obj_bench_settings, sInt(bench_settings))->shape_tex = res;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	void action_bench_shape_tex_map(ScopeAny self, VarType enable)
	{
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
		{
			self->shape_tex_mapped = enable;
			temp_update_shape(ScopeAny(self));
		}
		
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	RealType action_bench_shape_tex_material(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				StringType fn = /*""*/ STR(0);
				if (res == e_option_BROWSE)
				{
					StringType fn = file_dialog_open_image();
					if (!file_exists_lib(fn))
						return IntType(0);
					res = new_res(self, fn, e_res_type_TEXTURE);
					withOne (Object, res, self->id)
						res_load(self);
					
				}
				history_set_res(self, ID_action_bench_shape_tex_material, fn, ObjType(obj_bench_settings, sInt(bench_settings))->shape_tex_material, res);
			}
		
		
		ObjType(obj_bench_settings, sInt(bench_settings))->shape_tex_material = res;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	RealType action_bench_shape_tex_normal(ScopeAny self, IntType res)
	{
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				StringType fn = /*""*/ STR(0);
				if (res == e_option_BROWSE)
				{
					StringType fn = file_dialog_open_image();
					if (!file_exists_lib(fn))
						return IntType(0);
					res = new_res(self, fn, e_res_type_TEXTURE);
					withOne (Object, res, self->id)
						res_load(self);
					
				}
				history_set_res(self, ID_action_bench_shape_tex_normal, fn, ObjType(obj_bench_settings, sInt(bench_settings))->shape_tex_normal, res);
			}
		
		
		ObjType(obj_bench_settings, sInt(bench_settings))->shape_tex_normal = res;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	void action_bench_shape_type(ScopeAny self, VarType type)
	{
		if (!(sReal(history_undo) > 0) && !(sReal(history_redo) > 0))
			history_set_var(self, ID_action_bench_shape_type, ObjType(obj_bench_settings, sInt(bench_settings))->shape_type, type, true);
		ObjType(obj_bench_settings, sInt(bench_settings))->shape_type = type;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		withOne (obj_bench_settings, sInt(bench_settings), self->id)
			temp_update_shape(ScopeAny(self));
		
	}
	
	void action_bench_text_3d(ScopeAny self, VarType enable)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->text_3d = enable;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	void action_bench_text_face_camera(ScopeAny self, VarType enable)
	{
		ObjType(obj_bench_settings, sInt(bench_settings))->text_face_camera = enable;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
	}
	
	RealType action_bench_text_font(ScopeAny self, IntType res)
	{
		StringType fn = /*""*/ STR(0);
		if (sReal(history_undo) > 0)
			res = history_undo_res();
		else
			if (sReal(history_redo) > 0)
				res = history_redo_res(self);
			else
			{
				if (res == e_option_BROWSE)
				{
					fn = file_dialog_open_font();
					if (!file_exists_lib(fn))
						return IntType(0);
					res = new_res(self, fn, e_res_type_FONT);
					withOne (Object, res, self->id)
						res_load(self);
					
				}
				history_set_res(self, ID_action_bench_text_font, fn, ObjType(obj_bench_settings, sInt(bench_settings))->text_font, res);
			}
		
		
		ObjType(obj_bench_settings, sInt(bench_settings))->text_font = res;
		ObjType(obj_preview, ObjType(obj_bench_settings, sInt(bench_settings))->preview)->update = true;
		return 0.0;
	}
	
	void action_collapse(StringType name, BoolType open)
	{
		DsMap(global::collapse_map)[name] = open;
	}
	
	void action_group_bend_sliders(ScopeAny self)
	{
		ObjType(obj_category, ObjType(obj_tab, sInt(frame_editor))->transform)->bend_sliders = !(ObjType(obj_category, ObjType(obj_tab, sInt(frame_editor))->transform)->bend_sliders > 0);
	}
	
	void action_group_combine_scale(ScopeAny self)
	{
		ObjType(obj_category, ObjType(obj_tab, sInt(frame_editor))->transform)->scale_all = !(ObjType(obj_category, ObjType(obj_tab, sInt(frame_editor))->transform)->scale_all > 0);
	}
	
	void action_group_copy(ScopeAny self)
	{
		IntType group = sInt(context_menu_group);
		switch ((IntType)group)
		{
			case e_context_group_ROT_POINT:
			{
				DsList(sInt(context_group_copy_list))[group] = array_copy_1d(idVar(global::tl_edit, rot_point));
				return;
			}
			
			case e_context_group_POSITION:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_POS_X), idVar(global::tl_edit, value).Value(e_value_POS_Y), idVar(global::tl_edit, value).Value(e_value_POS_Z) });
				return;
			}
			
			case e_context_group_ROTATION:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_ROT_X), idVar(global::tl_edit, value).Value(e_value_ROT_Y), idVar(global::tl_edit, value).Value(e_value_ROT_Z) });
				return;
			}
			
			case e_context_group_SCALE:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_SCA_X), idVar(global::tl_edit, value).Value(e_value_SCA_Y), idVar(global::tl_edit, value).Value(e_value_SCA_Z) });
				return;
			}
			
			case e_context_group_BEND:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_BEND_ANGLE_X), idVar(global::tl_edit, value).Value(e_value_BEND_ANGLE_Y), idVar(global::tl_edit, value).Value(e_value_BEND_ANGLE_Z) });
				return;
			}
			
			case e_context_group_LIGHT:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_LIGHT_COLOR), idVar(global::tl_edit, value).Value(e_value_LIGHT_STRENGTH), idVar(global::tl_edit, value).Value(e_value_LIGHT_SPECULAR_STRENGTH), idVar(global::tl_edit, value).Value(e_value_LIGHT_SIZE), idVar(global::tl_edit, value).Value(e_value_LIGHT_RANGE), idVar(global::tl_edit, value).Value(e_value_LIGHT_FADE_SIZE), idVar(global::tl_edit, value).Value(e_value_LIGHT_SPOT_RADIUS), idVar(global::tl_edit, value).Value(e_value_LIGHT_SPOT_SHARPNESS) });
				return;
			}
			
			case e_context_group_COLOR:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_ALPHA), idVar(global::tl_edit, value).Value(e_value_RGB_ADD), idVar(global::tl_edit, value).Value(e_value_RGB_SUB), idVar(global::tl_edit, value).Value(e_value_RGB_MUL), idVar(global::tl_edit, value).Value(e_value_HSB_ADD), idVar(global::tl_edit, value).Value(e_value_HSB_SUB), idVar(global::tl_edit, value).Value(e_value_HSB_MUL), idVar(global::tl_edit, value).Value(e_value_GLOW_COLOR), idVar(global::tl_edit, value).Value(e_value_MIX_COLOR), idVar(global::tl_edit, value).Value(e_value_MIX_PERCENT), idVar(global::tl_edit, value).Value(e_value_EMISSIVE) });
				return;
			}
			
			case e_context_group_CAMERA:
			{
				ArrType arr = array_create({ ds_list_size(global::camera_values_list), null_ });
				for (IntType i = IntType(0); i < ds_list_size(global::camera_values_list); i++)
				{
					VarType vid = DsList(global::camera_values_list).Value(i);
					arr[i] = idVar(global::tl_edit, value).Value(vid);
				}
				DsList(sInt(context_group_copy_list))[group] = arr;
				return;
			}
			
			case e_context_group_EASE:
			{
				DsList(sInt(context_group_copy_list))[group] = ArrType::From({ idVar(global::tl_edit, value).Value(e_value_EASE_IN_X), idVar(global::tl_edit, value).Value(e_value_EASE_IN_Y), idVar(global::tl_edit, value).Value(e_value_EASE_OUT_X), idVar(global::tl_edit, value).Value(e_value_EASE_OUT_Y) });
				return;
			}
			
		}
		
	}
	
	void action_group_copy_global(ScopeAny self)
	{
		DsList(sInt(context_group_copy_list))[e_context_group_POSITION] = array_copy_1d(idVar(global::tl_edit, world_pos));
	}
	
	RealType action_group_paste(ScopeAny self)
	{
		IntType group;
		VarType copy;
		group = sInt(context_menu_group);
		copy = DsList(sInt(context_group_copy_list)).Value(group);
		switch ((IntType)group)
		{
			case e_context_group_ROT_POINT:
			{
				action_tl_rotpoint_all(self, copy);
				return IntType(0);
			}
			case e_context_group_POSITION:
			{
				action_tl_frame_pos_xyz(self, copy);
				return IntType(0);
			}
			case e_context_group_ROTATION:
			{
				action_tl_frame_rot_xyz(self, copy);
				return IntType(0);
			}
			case e_context_group_SCALE:
			{
				action_tl_frame_scale_xyz(self, copy);
				return IntType(0);
			}
			case e_context_group_BEND:
			{
				action_tl_frame_bend_angle_xyz(self, copy);
				return IntType(0);
			}
			case e_context_group_LIGHT:
			{
				action_tl_frame_set_light(self, copy.Value(IntType(0)), copy.Value(IntType(1)), copy.Value(IntType(2)), copy.Value(IntType(3)), copy.Value(IntType(4)), copy.Value(IntType(5)), copy.Value(IntType(6)), copy.Value(IntType(7)));
				return IntType(0);
			}
			case e_context_group_COLOR:
			{
				action_tl_frame_set_colors(self, copy.Value(IntType(0)), copy.Value(IntType(1)), copy.Value(IntType(2)), copy.Value(IntType(3)), copy.Value(IntType(4)), copy.Value(IntType(5)), copy.Value(IntType(6)), copy.Value(IntType(7)), copy.Value(IntType(8)), copy.Value(IntType(9)));
				return IntType(0);
			}
			case e_context_group_CAMERA:
			{
				action_tl_frame_set_camera(self, { copy });
				return IntType(0);
			}
			case e_context_group_EASE:
			{
				action_tl_frame_ease_set_all(self, copy, false);
				return IntType(0);
			}
		}
		
		return 0.0;
	}
	
	void action_group_reset(ScopeAny self)
	{
		VarType def;
		switch ((IntType)sInt(context_menu_group))
		{
			case e_context_group_ROT_POINT:
			{
				if (idVar(global::tl_edit, part_of) == null_ && idVar(global::tl_edit, temp) != null_)
					def = idVar(idVar(global::tl_edit, temp), rot_point);
				else
					def = point3D(IntType(0), IntType(0), IntType(0));
				
				action_tl_rotpoint_all(self, def);
				return;
			}
			
			case e_context_group_POSITION:
			{
				if (idVar(global::tl_edit, part_of) == null_)
					def = point3D(IntType(0), IntType(0), IntType(0));
				else
					def = point3D(idArr(global::tl_edit, value_default).Value(e_value_POS_X), idArr(global::tl_edit, value_default).Value(e_value_POS_Y), idArr(global::tl_edit, value_default).Value(e_value_POS_Z));
				
				action_tl_frame_pos_xyz(self, def);
				return;
			}
			
			case e_context_group_ROTATION:
			{
				if (idVar(global::tl_edit, type) == e_tl_type_CAMERA)
					def = ArrType::From({ IntType(0), IntType(0), IntType(0) });
				else
					def = point3D(idArr(global::tl_edit, value_default).Value(e_value_ROT_X), idArr(global::tl_edit, value_default).Value(e_value_ROT_Y), idArr(global::tl_edit, value_default).Value(e_value_ROT_Z));
				
				action_tl_frame_rot_xyz(self, def);
				return;
			}
			
			case e_context_group_SCALE:
			{
				action_tl_frame_scale_xyz(self, vec3(IntType(1)));
				return;
			}
			
			case e_context_group_BEND:
			{
				action_tl_frame_bend_angle_xyz(self, idVec(idVar(global::tl_edit, model_part), bend_default_angle));
				return;
			}
			
			case e_context_group_LIGHT:
			{
				action_tl_frame_set_light(self, c_white, IntType(1), IntType(1), IntType(2), IntType(250), 0.5, IntType(50), 0.5);
				return;
			}
			
			case e_context_group_COLOR:
			{
				action_tl_frame_set_colors(self, IntType(1), c_black, c_black, c_white, c_black, c_black, c_white, c_black, c_black, IntType(0));
				return;
			}
			
			case e_context_group_CAMERA:
			{
				action_tl_frame_set_camera(self, { global::camera_use_default_list, true });
				return;
			}
			
			case e_context_group_EASE:
			{
				action_tl_frame_ease_set_all(self, ArrType::From({ IntType(1), IntType(0), IntType(0), IntType(1) }), false);
				return;
			}
			
		}
		
	}
	
	void action_lib_animate(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (Object, save_id_find(ObjType(obj_history, global::history_data)->tl_save_id), self->id)
				tl_remove_clean(self);
			
			withAll (obj_timeline, self->id)
				if (self->delete_ready)
					instance_destroy(ScopeAny(self));
			
		}
		else
		{
			IntType hobj, tl;
			hobj = null_;
			if (!(sReal(history_redo) > 0))
				hobj = history_set(self, ID_action_lib_animate);
			withOne (Object, global::temp_edit, self->id)
				tl = temp_animate(self);
			
			withOne (obj_history, hobj, self->id)
				self->tl_save_id = save_id_get(tl);
			
		}
		
		tl_update_list(self);
		tl_update_matrix(self);
	}
	
	void action_lib_block_name(ScopeAny self, VarType name)
	{
		ArrType state;
		if (!(sReal(history_undo) > 0) && !(sReal(history_redo) > 0))
		{
			withOne (obj_history, history_set_var(self, ID_action_lib_block_name, idVar(global::temp_edit, block_name), name, false), self->id)
				ObjType(obj_history, self->id)->state = array_copy_1d(idArr(global::temp_edit, block_state));
			
			state = array_copy_1d(ObjType(obj_block, DsMap(ObjType(obj_minecraft_assets, global::mc_assets)->block_name_map).Value(name))->default_state);
		}
		else
			state = array_copy_1d(ObjType(obj_history, global::history_data)->state);
		
		withOne (Object, global::temp_edit, self->id)
		{
			sVar(block_name) = name;
			sArr(block_state) = state;
			temp_update_block(self);
			temp_update_display_name(self);
		}
		
		ObjType(obj_preview, sInt(lib_preview))->update = true;
	}
	
}
