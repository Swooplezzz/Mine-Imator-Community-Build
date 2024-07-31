/// shader_high_light_point_shadowless_set()

function shader_high_light_point_shadowless_set()
{
	render_set_uniform_int("uIsSky", 0)
	render_set_uniform_int("uLightAmount", render_shadowless_point_amount)
	render_set_uniform("uLightData", render_shadowless_point_data)
	render_set_uniform("uEmissive", 0)

	render_light_specular_strength = 1
	render_set_uniform("uLightSpecular", render_light_specular_strength)
	render_set_uniform("uLightGroup", -1)
}
