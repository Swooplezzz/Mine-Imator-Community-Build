/// bench_draw_settings(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

function bench_draw_settings(bx, by, bw, bh)
{
	dx = bx
	dy = by
	dw = bw
	dh = bh
	content_x = dx
	content_y = dy
	content_width = dw
	content_height = dh
	
	var prevalpha;
	prevalpha = draw_get_alpha()
	
	bench_settings_ani += test_reduced_motion(1, (0.09 * delta))
	bench_settings_ani = clamp(bench_settings_ani, 0, 1)
	
	var aniease = ease("easeoutcirc", bench_settings_ani);
	draw_set_alpha(aniease * prevalpha)
	dx += -16 + (16 * aniease)
	
	var sy = dy;
	
	// Settings
	if (type_is_timeline(bench_settings.type))
	{
		// Light type
		if (bench_settings.type = e_tl_type.LIGHT_SOURCE)
		{
			draw_sprite(spr_bench_example, (bench_settings.light_type = e_tl_type.POINT_LIGHT) ? 0 : 1, dx, dy)
			dy += 144 + 8
			
			tab_control_togglebutton()
			togglebutton_add("typepointlight", null, e_tl_type.POINT_LIGHT, bench_settings.light_type = e_tl_type.POINT_LIGHT, action_bench_light_type)
			togglebutton_add("typespotlight", null, e_tl_type.SPOT_LIGHT, bench_settings.light_type = e_tl_type.SPOT_LIGHT, action_bench_light_type)
			draw_togglebutton("benchlighttype", dx, dy)
			tab_next()
			
			if (bench_settings.light_type = e_tl_type.POINT_LIGHT)
				draw_tooltip_label("benchpointlighttip", icons.LIGHT_POINT, e_toast.INFO)
			else
				draw_tooltip_label("benchspotlighttip", icons.LIGHT_SPOT, e_toast.INFO)
		}
		
		if (bench_settings.type = e_tl_type.CAMERA)
		{
			draw_sprite(spr_bench_example, 5, dx, dy)
			dy += 144 + 8
			
			draw_tooltip_label("benchcameratip", icons.INFO, e_toast.INFO)
		}
		
		if (bench_settings.type = e_tl_type.BACKGROUND)
		{
			draw_sprite(spr_bench_example, 4, dx, dy)
			dy += 144 + 8
			
			draw_tooltip_label("benchbackgroundtip", icons.INFO, e_toast.INFO)
		}
		
		if (bench_settings.type = e_tl_type.AUDIO)
		{
			draw_sprite(spr_bench_example, 2, dx, dy)
			dy += 144 + 8
			
			draw_tooltip_label("benchaudiotip", icons.INFO, e_toast.INFO)
		}
		
		if (bench_settings.type = e_tl_type.PATH)
		{
			draw_sprite(spr_bench_example, 3, dx, dy)
			dy += 144 + 8
			
			draw_tooltip_label("benchpathtip", icons.INFO, e_toast.INFO)
		}
		
		if (bench_settings.type = e_tl_type.PATH_POINT)
			draw_tooltip_label("benchpathpointtip", icons.INFO, e_toast.INFO)
	}
	else
	{
		// Preview
		preview_draw(bench_settings.preview, dx, dy, dw, 144)
		dy += 144 + 8
		
		// Settings
		menu_bench = true
		
		switch (bench_settings.type)
		{
			case e_temp_type.CHARACTER:
			case e_temp_type.SPECIAL_BLOCK:
			case e_temp_type.BODYPART:
			{
				var labeltext, list, texcap, texmatcap, texnormcap, capwid, part;
				if (bench_settings.type = e_temp_type.CHARACTER)
				{
					labeltext = text_get("benchmodel")
					list = bench_settings.char_list
					texcap = "benchskin"
					texmatcap = "benchskinmaterial"
					texnormcap = "benchskinnormal"
					capwid = text_caption_width(texcap, texmatcap, texnormcap)
					part = bench_settings.model_file
				}
				else if (bench_settings.type = e_temp_type.SPECIAL_BLOCK)
				{
					labeltext = text_get("benchblock")
					list = bench_settings.special_block_list
					texcap = "benchspblocktex"
					texmatcap = "benchspblocktexmaterial"
					texnormcap = "benchspblocktexnormal"
					capwid = text_caption_width(texcap, texmatcap, texnormcap)
					part = bench_settings.model_file
				}
				else if (bench_settings.type = e_temp_type.BODYPART)
				{
					labeltext = text_get("benchmodel")
					list = bench_settings.bodypart_model_list
					texcap = "benchbodypartskin"
					texmatcap = "benchbodypartskinmaterial"
					texnormcap = "benchbodypartskinnormal"
					capwid = text_caption_width("benchbodypart", texcap, texmatcap, texnormcap)
					part = bench_settings.model_part
				}
				
				// List
				tab_control_sortlist(6)
				sortlist_draw(list, dx, dy, dw, tab_control_h, bench_settings.model_name, false, labeltext)
				tab_next()
				
				// States
				var model, statelen;
				model = mc_assets.model_name_map[?bench_settings.model_name];
				statelen = array_length(bench_settings.model_state)
				
				for (var i = 0; i < statelen; i += 2)
				{
					var state = bench_settings.model_state[i];
					capwid = max(capwid, text_caption_width(minecraft_asset_get_name("modelstate", state)))
				}
				
				// Checkboxes
				tab_set_collumns(true, 2)
				
				for (var i = 0; i < statelen; i += 2)
				{
					if (bench_settings.model_state[i + 1] != "true" && bench_settings.model_state[i + 1] != "false")
						continue
					
					var state = bench_settings.model_state[i];
					menu_model_current = model
					menu_model_state_current = model.states_map[?state]
					
					tab_control(ui_small_height)
					
					if (draw_checkbox("modelstate" + state, dx, dy, bench_settings.model_state[i + 1] = "true", null))
					{
						menu_model_state = menu_model_state_current
						
						if (bench_settings.model_state[i + 1] = "true")
							action_bench_model_state("false")
						else
							action_bench_model_state("true")
					}
					
					tab_next()
				}
				
				tab_set_collumns(false)
				
				// Menus
				for (var i = 0; i < statelen; i += 2)
				{
					if (bench_settings.model_state[i + 1] = "true" || bench_settings.model_state[i + 1] = "false")
						continue
					
					var state = bench_settings.model_state[i];
					menu_model_current = model
					menu_model_state_current = model.states_map[?state]
					
					draw_button_menu(state, e_menu.LIST, dx, dy, dw, 24, bench_settings.model_state[i + 1], minecraft_asset_get_name("modelstatevalue", bench_settings.model_state[i + 1]), action_bench_model_state, false, null, null, "", null, null, capwid)
					dy += 32
				}
				menu_model_current = null
				
				// Bodypart
				if (bench_settings.type = e_temp_type.BODYPART && bench_settings.model_file != null)
				{
					draw_button_menu("benchbodypart", e_menu.LIST, dx, dy, dw, 24, bench_settings.model_part_name, minecraft_asset_get_name("modelpart", bench_settings.model_part_name), action_bench_model_part_name, false, null, null, "", null, null, capwid)
					dy += 32
				}
				
				// Skin
				var text, tex;
				text = bench_settings.model_tex.display_name
				with (bench_settings.model_tex)
					tex = res_get_model_texture(model_part_get_texture_name(part, app.bench_settings.model_texture_name_map))
				
				draw_button_menu(texcap, e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model_tex, text, action_bench_model_tex, false, tex, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				if (project_render_material_maps)
				{
					// Skin (Material map)
					text = bench_settings.model_tex_material.display_name
					with (bench_settings.model_tex_material)
						tex = res_get_model_texture_material(model_part_get_texture_material_name(part, app.bench_settings.model_texture_material_name_map))
				
					draw_button_menu(texmatcap, e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model_tex_material, text, action_bench_model_tex_material, false, tex, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				
					// Skin (Normal map)
					text = bench_settings.model_tex_normal.display_name
					with (bench_settings.model_tex_normal)
						tex = res_get_model_tex_normal(model_part_get_tex_normal_name(part, app.bench_settings.model_tex_normal_name_map))
				
					draw_button_menu(texnormcap, e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model_tex_normal, text, action_bench_model_tex_normal, false, tex, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
				
				// Pattern editor
				if (bench_settings.pattern_type != "")
				{
					tab_control_button_label()
					
					if (draw_button_label("benchopeneditor", dx, dy, dw, null, e_button.SECONDARY))
						popup_pattern_editor_show(bench_settings)
					
					tab_next()
					
					if (popup = popup_pattern_editor)
						current_microani.active.value = true
				}
				
				window_scroll_focus = string(list.scroll)
				
				break
			}
			
			case e_temp_type.SCENERY:
			{
				var capwid, text, tex;
				capwid = text_caption_width("benchscenery", "benchblocktex", "benchblocktexmaterial", "benchblocktexnormal")
				
				// Scenery
				text = text_get("listnone")
				if (bench_settings.scenery != null)
					text = bench_settings.scenery.display_name
				
				draw_button_menu("benchscenery", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.scenery, text, action_bench_scenery, false, null, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				// Texture
				draw_button_menu("benchblocktex", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.block_tex, bench_settings.block_tex.display_name, action_bench_block_tex, false, bench_settings.block_tex.block_preview_texture, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				if (project_render_material_maps)
				{
					// Material texture
					draw_button_menu("benchblocktexmaterial", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.block_tex_material, bench_settings.block_tex_material.display_name, action_bench_block_tex_material, false, bench_settings.block_tex_material.block_preview_texture, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
					
					// Normal texture
					draw_button_menu("benchblocktexnormal", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.block_tex_normal, bench_settings.block_tex_normal.display_name, action_bench_block_tex_normal, false, bench_settings.block_tex_normal.block_preview_texture, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
				break
			}
			
			case e_temp_type.ITEM:
			{
				var capwid, res, text, sprite;
				capwid = text_caption_width("typeitem")
				res = bench_settings.item_tex
				if (!res_is_ready(res))
					res = mc_res
				
				draw_label(text_get("typeitem") + ":", dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
				
				if (res.item_sheet_texture != null)
					draw_texture_slot(res.item_sheet_texture, bench_settings.item_slot, dx + capwid, dy + 4, 16, 16, res.item_sheet_size[X], res.item_sheet_size[Y])
				else
				{
					var scale = min(16 / texture_width(res.texture), 16 / texture_height(res.texture));
					draw_texture(res.texture, dx + capwid, dy + 4, scale, scale)
				}
				dy += 32
				
				// Item select
				if (res.item_sheet_texture != null)
				{
					var slots = ((res.type = e_res_type.PACK) ? ds_list_size(mc_assets.item_texture_list) : (res.item_sheet_size[X] * res.item_sheet_size[Y]));
					listh = 162
					draw_texture_picker(bench_settings.item_slot, res.item_sheet_texture, dx, dy, dw, listh, slots, res.item_sheet_size[X], res.item_sheet_size[Y], bench_settings.item_scroll, action_bench_item_slot)
					dy += listh + 8
				}
				
				// Settings
				var sx;
				sx = dx_start
				
				dx_start = dx
				tab_set_collumns(true, 2)
				
				tab_control_checkbox()
				draw_checkbox("benchitem3d", dx, dy, bench_settings.item_3d, action_bench_item_3d)
				tab_next()
				
				tab_control_checkbox()
				draw_checkbox("benchitemfacecamera", dx, dy, bench_settings.item_face_camera, action_bench_item_face_camera)
				tab_next()
				
				tab_control_checkbox()
				draw_checkbox("benchitembounce", dx, dy, bench_settings.item_bounce, action_bench_item_bounce)
				tab_next()
				
				tab_control_checkbox()
				draw_checkbox("benchitemspin", dx, dy, bench_settings.item_spin, action_bench_item_spin)
				tab_next()
				
				tab_set_collumns(false)
				dx_start = sx
				
				// Image
				capwid = text_caption_width("benchitemtex", "benchitemtexmaterial", "benchitemtexnormal")
				var tex = res.block_preview_texture;
				if (tex = null)
					tex = res.texture
				
				draw_button_menu("benchitemtex", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.item_tex, bench_settings.item_tex.display_name, action_bench_item_tex, false, bench_settings.item_tex.block_preview_texture, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				if (project_render_material_maps)
				{
					// Image (Material map)
					var tex = res.block_preview_texture;
					if (tex = null)
						tex = res.texture
					
					draw_button_menu("benchitemtexmaterial", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.item_tex_material, bench_settings.item_tex_material.display_name, action_bench_item_tex_material, false, bench_settings.item_tex_material.block_preview_texture, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
					
					// Image (Normal map)
					tex = res.block_preview_texture;
					if (tex = null)
						tex = res.texture
					
					draw_button_menu("benchitemtexnormal", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.item_tex_normal, bench_settings.item_tex_normal.display_name, action_bench_item_tex_normal, false, bench_settings.item_tex_normal.block_preview_texture, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
				
				window_scroll_focus = string(bench_settings.item_scroll)
				
				break
			}
			
			case e_temp_type.BLOCK:
			{
				draw_set_font(font_label)
				
				var capwid, text, sprite;
				capwid = text_caption_width("benchblocktex", "benchblocktexmaterial", "benchblocktexnormal")
				
				tab_control_sortlist(6)
				sortlist_draw(bench_settings.block_list, dx, dy, dw, tab_control_h, bench_settings.block_name, false, text_get("benchblock"))
				tab_next()
				
				// States
				var block, statelen;
				block = mc_assets.block_name_map[?bench_settings.block_name]
				statelen = array_length(bench_settings.block_state)
				
				for (var i = 0; i < statelen; i += 2)
				{
					var state = bench_settings.block_state[i];
					capwid = max(capwid, text_caption_width(minecraft_asset_get_name("blockstate", state)))
				}
				
				// Checkboxes
				tab_set_collumns(true, 2)
				
				for (var i = 0; i < statelen; i += 2)
				{
					if (bench_settings.block_state[i + 1] != "true" && bench_settings.block_state[i + 1] != "false")
						continue
					
					var state = bench_settings.block_state[i];
					menu_block_current = block
					menu_block_state_current = block.states_map[?state]
					
					tab_control(ui_small_height)
					
					if (draw_checkbox("blockstate" + state, dx, dy, bench_settings.block_state[i + 1] = "true", null))
					{
						menu_block_state = menu_block_state_current
						
						if (bench_settings.block_state[i + 1] = "true")
							action_bench_block_state("false")
						else
							action_bench_block_state("true")
					}
					
					tab_next()
				}
				
				tab_set_collumns(false)
				
				// Menus
				for (var i = 0; i < statelen; i += 2)
				{
					if (bench_settings.block_state[i + 1] = "true" || bench_settings.block_state[i + 1] = "false")
						continue
					
					var state = bench_settings.block_state[i];
					menu_block_current = block
					menu_block_state_current = block.states_map[?state]
					draw_button_menu(state, e_menu.LIST, dx, dy, dw, 24, bench_settings.block_state[i + 1], minecraft_asset_get_name("blockstatevalue", bench_settings.block_state[i + 1]), action_bench_block_state, false, null, null, "", null, null, capwid)
					dy += 32
				}
				
				menu_block_current = null
				
				// Texture
				draw_button_menu("benchblocktex", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.block_tex, bench_settings.block_tex.display_name, action_bench_block_tex, false, bench_settings.block_tex.block_preview_texture, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				if (project_render_material_maps)
				{
					// Material texture
					draw_button_menu("benchblocktexmaterial", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.block_tex_material, bench_settings.block_tex_material.display_name, action_bench_block_tex_material, false, bench_settings.block_tex_material.block_preview_texture, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
					
					// Normal texture
					draw_button_menu("benchblocktexnormal", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.block_tex_normal, bench_settings.block_tex_normal.display_name, action_bench_block_tex_normal, false, bench_settings.block_tex_normal.block_preview_texture, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
			
				window_scroll_focus = string(bench_settings.block_list.scroll)
				break
			}
			
			case e_temp_type.PARTICLE_SPAWNER:
			{
				// Particles
				tab_control_sortlist(6)
				sortlist_draw(bench_settings.particles_list, dx, dy, dw, tab_control_h, bench_settings.particle_preset, false, text_get("benchparticlespreset"))
				tab_next()
				
				window_scroll_focus = string(bench_settings.particles_list.scroll)
				break
			}
			
			case e_temp_type.TEXT:
			{
				var capwid;
				capwid = text_caption_width("benchtextfont")
				
				// Font (Advanced mode only)
				if (setting_advanced_mode)
				{
					draw_button_menu("benchtextfont", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.text_font, bench_settings.text_font.display_name, action_bench_text_font, false, null, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
				
				// 3D / Face camera
				var sx;
				sx = dx_start
				
				dx_start = dx
				
				tab_set_collumns(true, 2)
				
				tab_control_checkbox()
				draw_checkbox("benchtext3d", dx, dy, bench_settings.text_3d, action_bench_text_3d)
				tab_next()
				
				tab_control_checkbox()
				draw_checkbox("benchtextfacecamera", dx, dy, bench_settings.text_face_camera, action_bench_text_face_camera)
				tab_next()
				
				tab_set_collumns(false)
				dx_start = sx
				
				break
			}
			
			case e_tl_type.SHAPE: // Shapes
			{
				var capwid, text;
				capwid = text_caption_width("benchshapetype", "benchshapetex", "benchshapetexmaterial", "benchshapetexnormal")
				
				// Shape
				text = text_get("type" + tl_type_name_list[|e_tl_type.CUBE + bench_settings.shape_type])
				draw_button_menu("benchshapetype", e_menu.LIST, dx, dy, dw, 24, bench_settings.shape_type, text, action_bench_shape_type, false, null, null, "", null, null, capwid)
				dy += 32
				
				// Texture
				var tex;
				text = text_get("listnone")
				tex = null
				if (bench_settings.shape_tex)
				{
					text = bench_settings.shape_tex.display_name
					if (bench_settings.shape_tex.type != e_tl_type.CAMERA)
						tex = bench_settings.shape_tex.texture
				}
				draw_button_menu("benchshapetex", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.shape_tex, text, action_bench_shape_tex, false, tex, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				if (project_render_material_maps)
				{
					// Material texture
					text = text_get("listnone")
					tex = null
					if (bench_settings.shape_tex_material)
					{
						text = bench_settings.shape_tex_material.display_name
						tex = bench_settings.shape_tex_material.texture
					}
					draw_button_menu("benchshapetexmaterial", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.shape_tex_material, text, action_bench_shape_tex_material, false, tex, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
					
					// Normal texture
					text = text_get("listnone")
					tex = null
					if (bench_settings.shape_tex_normal)
					{
						text = bench_settings.shape_tex_normal.display_name
						tex = bench_settings.shape_tex_normal.texture
					}
					draw_button_menu("benchshapetexnormal", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.shape_tex_normal, text, action_bench_shape_tex_normal, false, tex, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
			
				// Is mapped
				if (bench_settings.shape_type = e_shape_type.CUBE || 
					bench_settings.shape_type = e_shape_type.CYLINDER || 
					bench_settings.shape_type = e_shape_type.CONE)
				{
					// Advanced mode only
					if (setting_advanced_mode)
					{
						tab_control_checkbox()
						draw_checkbox("benchshapetexmap", dx, dy, bench_settings.shape_tex_mapped, action_bench_shape_tex_map, "benchshapetexmaptip")
						tab_next()
					}
				}
				else if (bench_settings.shape_type = e_shape_type.SURFACE)
				{
					tab_control_checkbox()
					draw_checkbox("benchshapefacecamera", dx, dy, bench_settings.shape_face_camera, action_bench_shape_face_camera)
					tab_next()
				}
				
				break
			}
			
			case e_temp_type.MODEL:
			{
				var capwid = text_caption_width("benchmodel", "benchmodeltex", "benchmodeltexmaterial", "benchmodeltexnormal");
				
				// Model
				var text;
				if (bench_settings.model != null)
					text = bench_settings.model.display_name
				else
					text = text_get("listnone")
				
				draw_button_menu("benchmodel", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model, text, action_bench_model, false, null, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				// Texture
				var texobj, tex;
				with (bench_settings)
				{
					if (model_file != null && !instance_exists(model_file))
						model_file = null
					
					texobj = temp_get_model_texobj(null)
					tex = temp_get_model_tex_preview(texobj, model_file)
				}
				
				if (texobj != null)
					text = texobj.display_name
				else
					text = text_get("listnone")
				
				// Default
				if (bench_settings.model_tex = null)
					text = text_get("listdefault", text)
				
				draw_button_menu("benchmodeltex", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model_tex, text, action_bench_model_tex, false, tex, null, "", null, null, capwid)
				dy += (ui_large_height + 8)
				
				if (project_render_material_maps)
				{
					// Texture (Material map)
					with (bench_settings)
					{
						texobj = temp_get_model_tex_material_obj(null)
						tex = temp_get_model_tex_material_preview(texobj, model_file)
					}
					
					if (texobj != null)
						text = texobj.display_name
					else
						text = text_get("listnone")
					
					// Default
					if (bench_settings.model_tex_material = null)
						text = text_get("listdefault", text)
					
					draw_button_menu("benchmodeltexmaterial", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model_tex_material, text, action_bench_model_tex_material, false, tex, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
					
					// Texture (Normal map)
					with (bench_settings)
					{
						texobj = temp_get_model_tex_normal_obj(null)
						tex = temp_get_model_tex_normal_preview(texobj, model_file)
					}
					
					if (texobj != null)
						text = texobj.display_name
					else
						text = text_get("listnone")
					
					// Default
					if (bench_settings.model_tex_normal = null)
						text = text_get("listdefault", text)
					
					draw_button_menu("benchmodeltexnormal", e_menu.LIST, dx, dy, dw, ui_large_height, bench_settings.model_tex_normal, text, action_bench_model_tex_normal, false, tex, null, "", null, null, capwid)
					dy += (ui_large_height + 8)
				}
				
				break
			}
		}
		
		menu_bench = false
	}
	
	draw_set_alpha(prevalpha)
	dx = bx
	
	tab_control_button_label()
	tab_next()
	dy += 4
	
	var edit = (bench_settings.type = e_temp_type.PARTICLE_SPAWNER && setting_advanced_mode);
	var wid = (edit ? dw/2 - 4 : dw);
	
	if (draw_button_label("benchcreate", edit ? (dx + wid + 8) : dx, sy + dh - 56, wid, icons.ASSET_ADD))
	{
		action_bench_create()
		bench_show_ani_type = "hide"
	}
	
	// Create & edit
	if (edit)
	{
		if (draw_button_label("benchcreateedit", dx, sy + dh - 56, wid, icons.PENCIL, e_button.SECONDARY))
		{
			action_bench_create(true)
			bench_show_ani_type = "hide"
		}
	}
}
