/// background_sky_startup()

function background_sky_startup()
{
	background_image_sphere_vbuffer = null
	background_image_cube_vbuffer = null
	background_image_cube_mapped_vbuffer = null
	
	background_fog_texture = texture_sprite(spr_fog)
	background_fog_vbuffer = null
	
	background_sky_stars_texture = texture_sprite(spr_stars)
	background_sky_stars_vbuffer = null
	background_sky_sun_moon_vbuffer = null
	background_sky_clouds_vbuffer = null
	background_sky_clouds_vbuffer_pos = []
}
