shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float wave_frequency : hint_range(0.1, 100.0, 0.1) = 10.0;
uniform float wave_speed : hint_range(0.0, 10.0, 0.01) = 5.0;
uniform float wave_amplitude : hint_range(0.0, 0.1, 0.005) = 0.01;

uniform sampler2D noise_texture;

void fragment() {

	vec2 center = vec2(0.5, 0.5);
	float dist = length(UV - center);

	float wave_screen_x = sin(SCREEN_UV.x * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;
    float wave_screen_x_2 = sin(SCREEN_UV.x * wave_frequency * 2.0 + TIME * wave_speed * -2.0) * 0.01 - 0.01;

	float wave_screen_y = sin(SCREEN_UV.y * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;

	vec2 wave_screen_uv = SCREEN_UV + vec2(wave_screen_x, wave_screen_y);


	COLOR = texture(SCREEN_TEXTURE, wave_screen_uv);
}