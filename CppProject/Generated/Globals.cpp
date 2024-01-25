/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2024.01.19 13:27:00 ]
*/

#include "Scripts.hpp"
#include "Asset/Shader.hpp"

namespace CppProject
{
	IntType gmlGlobal::application_surface = IntType(0);
	IntType gmlGlobal::async_load = IntType(0);
	IntType gmlGlobal::current_time = IntType(0);
	IntType gmlGlobal::delta_time = IntType(0);
	IntType gmlGlobal::fps_real = IntType(0);
	IntType gmlGlobal::fps = IntType(0);
	StringType gmlGlobal::game_save_id = "";
	StringType gmlGlobal::GM_runtime_version = "";
	IntType gmlGlobal::instance_count = IntType(0);
	IntType gmlGlobal::keyboard_lastkey = IntType(0);
	StringType gmlGlobal::keyboard_string = "";
	IntType gmlGlobal::mouse_x = IntType(0);
	IntType gmlGlobal::mouse_y = IntType(0);
	IntType gmlGlobal::os_version = IntType(0);
	IntType gmlGlobal::room_speed = IntType(0);
	StringType gmlGlobal::working_directory = "";
	
	app* global::_app = nullptr;
	IntType global::debug_indent = IntType(0);
	IntType global::debug_timer = IntType(0);
	IntType global::collapse_map = IntType(0);
	VarType global::collapse_ani = VarType();
	IntType global::collapse_groups = IntType(0);
	IntType global::list_edit = IntType(0);
	IntType global::list_item_last = IntType(0);
	VarType global::list_item_value = VarType();
	VarType global::list_item_script = VarType();
	VarType global::list_item_script_value = VarType();
	ArrType global::keybinds = ArrType();
	VarType global::keybind_edit = VarType();
	IntType global::value_name_list = IntType(0);
	IntType global::transition_list = IntType(0);
	IntType global::transition_list_order = IntType(0);
	IntType global::temp_type_name_list = IntType(0);
	IntType global::tl_type_name_list = IntType(0);
	IntType global::res_type_name_list = IntType(0);
	IntType global::videotemplate_list = IntType(0);
	IntType global::videoquality_list = IntType(0);
	IntType global::language_english_map = IntType(0);
	IntType global::language_map = IntType(0);
	IntType global::camera_values_list = IntType(0);
	IntType global::camera_values_copy = IntType(0);
	IntType global::camera_use_default_list = IntType(0);
	IntType global::minecraft_pattern_list = IntType(0);
	IntType global::minecraft_pattern_short_list = IntType(0);
	VarType global::minecraft_sherd_map = VarType();
	VarType global::minecraft_armor_trim_pattern_list = VarType();
	VarType global::minecraft_armor_trim_material_list = VarType();
	ArrType global::minecraft_map_color_array = ArrType();
	ArrType global::minecraft_swatch_array = ArrType();
	IntType global::minecraft_swatch_color_map = IntType(0);
	IntType global::minecraft_swatch_dyes = IntType(0);
	IntType global::biome_list = IntType(0);
	IntType global::particle_template_list = IntType(0);
	IntType global::particle_template_map = IntType(0);
	IntType global::blend_mode_list = IntType(0);
	IntType global::blend_mode_map = IntType(0);
	IntType global::timeline_icon_list = IntType(0);
	IntType global::timeline_icon_list_dark = IntType(0);
	IntType global::render_pass_list = IntType(0);
	ArrType global::microani_arr = ArrType();
	IntType global::current_microani = IntType(0);
	IntType global::microani_list = IntType(0);
	IntType global::microani_delete_list = IntType(0);
	IntType global::microanis = IntType(0);
	VarType global::microani_hover = VarType();
	VarType global::microani_click = VarType();
	VarType global::microani_value = VarType();
	StringType global::microani_prefix = "";
	IntType global::theme_light = IntType(0);
	IntType global::theme_dark = IntType(0);
	IntType global::theme_darker = IntType(0);
	VarType global::c_accent = VarType();
	RealType global::a_accent = 0.0;
	IntType global::c_accent_hover = IntType(0);
	RealType global::a_accent_hover = 0.0;
	IntType global::c_accent_pressed = IntType(0);
	RealType global::a_accent_pressed = 0.0;
	VarType global::c_hover = VarType();
	RealType global::a_hover = 0.0;
	VarType global::c_accent_overlay = VarType();
	RealType global::a_accent_overlay = 0.0;
	VarType global::c_text_main = VarType();
	RealType global::a_text_main = 0.0;
	VarType global::c_text_secondary = VarType();
	RealType global::a_text_secondary = 0.0;
	VarType global::c_text_tertiary = VarType();
	RealType global::a_text_tertiary = 0.0;
	VarType global::c_border = VarType();
	RealType global::a_border = 0.0;
	VarType global::c_overlay = VarType();
	RealType global::a_overlay = 0.0;
	RealType global::a_dark_overlay = 0.0;
	VarType global::c_level_top = VarType();
	VarType global::c_level_middle = VarType();
	VarType global::c_level_bottom = VarType();
	VarType global::c_button_text = VarType();
	RealType global::a_button_text = 0.0;
	VarType global::c_viewport_top = VarType();
	VarType global::c_viewport_bottom = VarType();
	VarType global::c_error = VarType();
	VarType global::c_warning = VarType();
	VarType global::c_success = VarType();
	VarType global::c_axisred = VarType();
	VarType global::c_axisgreen = VarType();
	VarType global::c_axisblue = VarType();
	VarType global::c_axiscyan = VarType();
	VarType global::c_axisyellow = VarType();
	VarType global::c_axismagenta = VarType();
	VarType global::c_bend = VarType();
	VarType global::c_control_red = VarType();
	VarType global::c_control_green = VarType();
	VarType global::c_control_blue = VarType();
	VarType global::c_control_cyan = VarType();
	VarType global::c_control_yellow = VarType();
	VarType global::c_control_magenta = VarType();
	VarType global::c_control_white = VarType();
	IntType global::window_list = IntType(0);
	IntType global::window_debug_current = IntType(0);
	RealType global::current_step = 0.0;
	RealType global::minute_steps = 0.0;
	RealType global::delta = 0.0;
	VecType global::cam_from = VecType();
	VecType global::cam_to = VecType();
	VecType global::cam_up = VecType();
	VarType global::cam_fov = VarType();
	RealType global::cam_near = 0.0;
	VarType global::cam_far = VarType();
	VarType global::cam_far_prev = VarType();
	IntType global::cam_window = IntType(0);
	IntType global::cam_render = IntType(0);
	IntType global::cam_frustum = IntType(0);
	VarType global::cam_aspect = VarType();
	IntType global::buffer_current = IntType(0);
	VarType global::history_data = VarType();
	VarType global::json_type_map = VarType();
	IntType global::json_char = IntType(0);
	VarType global::json_value = VarType();
	IntType global::json_value_type = IntType(0);
	IntType global::json_column = IntType(0);
	IntType global::json_line = IntType(0);
	StringType global::json_error = "";
	VarType global::json_filename = VarType();
	IntType global::json_indent = IntType(0);
	BoolType global::json_empty = false;
	BoolType global::json_add_comma = false;
	VarType global::legacy_model_id_05_map = VarType();
	VarType global::legacy_model_id_06_map = VarType();
	VarType global::legacy_model_id_100_demo_map = VarType();
	VarType global::legacy_model_part_map = VarType();
	VarType global::legacy_model_name_map = VarType();
	ArrType global::legacy_block_set = ArrType();
	VarType global::legacy_block_id = VarType();
	ArrType global::legacy_block_obj = ArrType();
	ArrType global::legacy_block_state_vars = ArrType();
	ArrType global::legacy_block_state_id = ArrType();
	ArrType global::legacy_block_mc_id = ArrType();
	VarType global::legacy_block_texture_name_map = VarType();
	VarType global::legacy_block_05_texture_list = VarType();
	VarType global::legacy_block_07_demo_texture_list = VarType();
	VarType global::legacy_block_100_texture_list = VarType();
	VarType global::legacy_item_texture_name_map = VarType();
	VarType global::legacy_biomes_map = VarType();
	IntType global::legacy_biomes_ids_map = IntType(0);
	IntType global::biomes_ids_map = IntType(0);
	VarType global::legacy_model_names_map = VarType();
	VarType global::legacy_model_states_map = VarType();
	VarType global::legacy_model_state_values_map = VarType();
	VarType global::legacy_block_names_map = VarType();
	VarType global::legacy_particles_map = VarType();
	BoolType global::file_copy_temp = false;
	IntType global::lib_open_url = IntType(0);
	IntType global::lib_execute = IntType(0);
	IntType global::lib_unzip = IntType(0);
	IntType global::lib_gzunzip = IntType(0);
	IntType global::lib_file_rename = IntType(0);
	IntType global::lib_file_copy = IntType(0);
	IntType global::lib_file_delete = IntType(0);
	IntType global::lib_file_exists = IntType(0);
	IntType global::lib_json_file_convert_unicode = IntType(0);
	IntType global::lib_directory_create = IntType(0);
	IntType global::lib_directory_exists = IntType(0);
	IntType global::lib_directory_delete = IntType(0);
	IntType global::lib_movie_init = IntType(0);
	IntType global::lib_movie_set = IntType(0);
	IntType global::lib_movie_start = IntType(0);
	IntType global::lib_movie_audio_file_decode = IntType(0);
	IntType global::lib_movie_audio_file_add = IntType(0);
	IntType global::lib_movie_audio_sound_add = IntType(0);
	IntType global::lib_movie_frame = IntType(0);
	IntType global::lib_movie_done = IntType(0);
	IntType global::lib_window_maximize = IntType(0);
	IntType global::lib_window_set_focus = IntType(0);
	IntType global::lib_math_simplex1d = IntType(0);
	IntType global::lib_math_simplex2d = IntType(0);
	IntType global::lib_math_simplex3d = IntType(0);
	IntType global::lib_math_simplex4d = IntType(0);
	IntType global::mc_assets = IntType(0);
	IntType global::mc_builder = IntType(0);
	IntType global::mc_res = IntType(0);
	StringType global::load_assets_stage = "";
	RealType global::load_assets_progress = 0.0;
	RealType global::load_assets_block_index = 0.0;
	IntType global::load_assets_splash = IntType(0);
	VarType global::load_assets_credits = VarType();
	StringType global::load_assets_startup_dir = "";
	StringType global::load_assets_dir = "";
	StringType global::load_assets_file = "";
	StringType global::load_assets_zip_file = "";
	IntType global::load_assets_state_file_map = IntType(0);
	IntType global::load_assets_model_file_map = IntType(0);
	IntType global::load_assets_map = IntType(0);
	IntType global::load_assets_type_map = IntType(0);
	IntType global::load_assets_block_preview_buffer = IntType(0);
	IntType global::load_assets_block_preview_ani_buffer = IntType(0);
	VarType global::pattern_update = VarType();
	ArrType global::armor_update = ArrType();
	ArrType global::block_rendermodels = ArrType();
	ArrType global::block_objs = ArrType();
	VarType global::player_head_vbuffer = VarType();
	IntType global::load_queue = IntType(0);
	VarType global::load_format = VarType();
	StringType global::load_folder = "";
	StringType global::save_folder = "";
	VarType global::temp_edit = VarType();
	VarType global::ptype_edit = VarType();
	IntType global::tl_edit_amount = IntType(0);
	IntType global::tl_edit = IntType(0);
	VarType global::res_edit = VarType();
	VarType global::axis_edit = VarType();
	IntType global::temp_creator = IntType(0);
	IntType global::res_creator = IntType(0);
	IntType global::save_id_seed = IntType(0);
	IntType global::save_id_map = IntType(0);
	IntType global::shape_texture = IntType(0);
	IntType global::render_view_current = IntType(0);
	VarType global::render_width = VarType();
	VarType global::render_height = VarType();
	RealType global::render_ratio = 0.0;
	VarType global::render_camera = VarType();
	RealType global::render_time = 0.0;
	RealType global::render_surface_time = 0.0;
	IntType global::render_prev_color = IntType(0);
	RealType global::render_prev_alpha = 0.0;
	VarType global::render_click_box = VarType();
	IntType global::render_list = IntType(0);
	RealType global::render_lights = 0.0;
	VarType global::render_particles = VarType();
	BoolType global::render_hidden = false;
	RealType global::render_background = 0.0;
	BoolType global::render_watermark = false;
	VecType global::proj_from = VecType();
	MatrixType global::proj_matrix = MatrixType();
	MatrixType global::view_matrix = MatrixType();
	MatrixType global::view_proj_matrix = MatrixType();
	MatrixType global::light_proj_matrix = MatrixType();
	MatrixType global::light_view_matrix = MatrixType();
	MatrixType global::light_view_proj_matrix = MatrixType();
	MatrixType global::spot_proj_matrix = MatrixType();
	MatrixType global::spot_view_matrix = MatrixType();
	MatrixType global::spot_view_proj_matrix = MatrixType();
	RealType global::proj_depth_near = 0.0;
	VarType global::proj_depth_far = VarType();
	VecType global::render_proj_from = VecType();
	VarType global::render_active = VarType();
	VecType global::render_repeat = VecType();
	IntType global::render_world_count = IntType(0);
	BoolType global::point3D_project_error = false;
	VarType global::render_light_from = VarType();
	VecType global::render_light_to = VecType();
	RealType global::render_light_near = 0.0;
	VarType global::render_light_far = VarType();
	VarType global::render_light_fov = VarType();
	VarType global::render_light_color = VarType();
	VarType global::render_light_strength = VarType();
	VarType global::render_light_fade_size = VarType();
	VarType global::render_light_spot_sharpness = VarType();
	MatrixType global::render_shadow_matrix = MatrixType();
	MatrixType global::render_sun_matrix = MatrixType();
	VecType global::render_sun_direction = VecType();
	RealType global::render_sun_near = 0.0;
	RealType global::render_sun_far = 0.0;
	VecType global::render_light_offset = VecType();
	VecType global::render_shadow_from = VecType();
	MatrixType global::render_spot_matrix = MatrixType();
	VarType global::render_light_specular_strength = VarType();
	VarType global::render_light_size = VarType();
	VarType global::render_gobo_texture = VarType();
	RealType global::render_effects = 0.0;
	BoolType global::render_effects_done = false;
	IntType global::render_effects_list = IntType(0);
	IntType global::render_effects_progress = IntType(0);
	BoolType global::render_camera_bloom = false;
	BoolType global::render_camera_dof = false;
	BoolType global::render_glow = false;
	BoolType global::render_glow_falloff = false;
	BoolType global::render_camera_ca = false;
	BoolType global::render_camera_distort = false;
	BoolType global::render_camera_color_correction = false;
	BoolType global::render_camera_grain = false;
	BoolType global::render_camera_vignette = false;
	BoolType global::render_overlay = false;
	BoolType global::render_camera_lens_dirt = false;
	BoolType global::render_camera_lens_dirt_bloom = false;
	BoolType global::render_camera_lens_dirt_glow = false;
	BoolType global::render_ssao = false;
	BoolType global::render_shadows = false;
	BoolType global::render_indirect = false;
	BoolType global::render_reflections = false;
	IntType global::render_quality = IntType(0);
	IntType global::render_pass = IntType(0);
	VarType global::render_tonemapper = VarType();
	VarType global::render_exposure = VarType();
	VarType global::render_gamma = VarType();
	BoolType global::render_depth_normals = false;
	ArrType global::render_matrix = ArrType();
	RealType global::render_samples = 0.0;
	RealType global::render_sample_current = 0.0;
	BoolType global::render_samples_done = false;
	VecType global::render_target_size = VecType();
	VarType global::render_blend_prev = VarType();
	VarType global::render_alpha_prev = VarType();
	VarType global::shader_uniform_color_ext = VarType();
	VarType global::shader_uniform_rgb_add = VarType();
	VarType global::shader_uniform_rgb_sub = VarType();
	VarType global::shader_uniform_hsb_add = VarType();
	VarType global::shader_uniform_hsb_sub = VarType();
	VarType global::shader_uniform_hsb_mul = VarType();
	VarType global::shader_uniform_mix_color = VarType();
	VarType global::shader_uniform_mix_percent = VarType();
	VarType global::shader_uniform_emissive = VarType();
	VarType global::shader_uniform_metallic = VarType();
	VarType global::shader_uniform_roughness = VarType();
	VarType global::shader_uniform_wind = VarType();
	VarType global::shader_uniform_wind_terrain = VarType();
	VarType global::shader_uniform_fog = VarType();
	VarType global::shader_uniform_sss = VarType();
	VarType global::shader_uniform_sss_red = VarType();
	VarType global::shader_uniform_sss_green = VarType();
	VarType global::shader_uniform_sss_blue = VarType();
	VarType global::shader_uniform_sss_color = VarType();
	VarType global::shader_uniform_glow = VarType();
	VarType global::shader_uniform_glow_texture = VarType();
	VarType global::shader_uniform_glow_color = VarType();
	VarType global::shader_uniform_wind_strength = VarType();
	IntType global::render_pass_surf = IntType(0);
	VarType global::render_target = VarType();
	ArrType global::render_surface = ArrType();
	ArrType global::render_surface_hdr = ArrType();
	VarType global::render_surface_depth = VarType();
	VarType global::render_surface_normal = VarType();
	VarType global::render_surface_emissive = VarType();
	VarType global::render_surface_diffuse = VarType();
	VarType global::render_surface_material = VarType();
	VarType global::render_surface_shadows = VarType();
	VarType global::render_surface_specular = VarType();
	VarType global::render_surface_lens = VarType();
	VarType global::render_surface_sample_expo = VarType();
	VarType global::render_surface_sample_dec = VarType();
	VarType global::render_surface_sample_alpha = VarType();
	RealType global::depth_near = 0.0;
	RealType global::depth_far = 0.0;
	RealType global::render_post_index = 0.0;
	MatrixType global::taa_matrix = MatrixType();
	MatrixType global::taa_jitter_matrix = MatrixType();
	VarType global::render_alpha_hash = VarType();
	BoolType global::render_alpha_hash_force = false;
	IntType global::render_sample_noise_texture = IntType(0);
	IntType global::render_sample_noise_size = IntType(0);
	ArrType global::render_sample_noise_texture_array = ArrType();
	IntType global::render_shadowless_point_list = IntType(0);
	ArrType global::render_shadowless_point_data = ArrType();
	IntType global::render_shadowless_point_amount = IntType(0);
	ArrType global::render_surface_sun_buffer = ArrType();
	VarType global::render_surface_spot_buffer = VarType();
	VarType global::render_surface_point_buffer = VarType();
	VarType global::render_surface_point_atlas_buffer = VarType();
	ArrType global::render_ssao_kernel = ArrType();
	VarType global::render_dof_samples = VarType();
	VarType global::render_dof_weight_samples = VarType();
	IntType global::render_dof_sample_amount = IntType(0);
	VarType global::render_grain_noise = VarType();
	RealType global::render_subsurface_size = 0.0;
	ArrType global::render_subsurface_kernel = ArrType();
	ArrType global::render_blur_kernel = ArrType();
	BoolType global::render_samples_clear = false;
	RealType global::render_cascades_count = 0.0;
	ArrType global::render_cascade_ends = ArrType();
	ArrType global::render_cascades = ArrType();
	RealType global::render_cascade_debug = 0.0;
	IntType global::render_mode = IntType(0);
	IntType global::render_mode_shader_map = IntType(0);
	VarType global::render_shader_obj = VarType();
	IntType global::shader_map = IntType(0);
	BoolType global::shader_texture_surface = false;
	VarType global::shader_texture_filter_linear = VarType();
	VarType global::shader_texture_filter_mipmap = VarType();
	BoolType global::shader_check_uniform = false;
	IntType global::shader_texture_width = IntType(0);
	IntType global::shader_texture_height = IntType(0);
	VarType global::shader_blend_color = VarType();
	VarType global::shader_blend_alpha = VarType();
	VarType global::shader_clip_x = VarType();
	VarType global::shader_clip_y = VarType();
	VarType global::shader_clip_width = VarType();
	VarType global::shader_clip_height = VarType();
	BoolType global::shader_clip_active = false;
	RealType global::shader_mask = 0.0;
	RealType global::trial_version = 0.0;
	VarType global::vbuffer_current = VarType();
	IntType global::vertex_format = IntType(0);
	IntType global::vertex_wave = IntType(0);
	VarType global::vertex_wave_zmin = VarType();
	VarType global::vertex_wave_zmax = VarType();
	VarType global::vertex_emissive = VarType();
	VarType global::vertex_subsurface = VarType();
	VarType global::vertex_rgb = VarType();
	RealType global::vertex_alpha = 0.0;
	
}
