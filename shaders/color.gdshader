shader_type canvas_item;

uniform vec4 color_filter = vec4(0.0, 0.0, 0.0, 1.0);

uniform float wave_frequency : hint_range(0.1, 100.0, 0.1);
uniform float wave_speed : hint_range(0.0, 10.0, 0.01);
uniform float wave_amplitude : hint_range(0.0, 1.0, 0.1);

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform sampler2D noise_texture : repeat_enable;


void fragment() {
	
	vec4 wave_color = (texture(SCREEN_TEXTURE, (((texture(noise_texture, SCREEN_UV + vec2(0.1, 0.1) * (TIME * wave_speed)).r * 0.2) * wave_amplitude) + SCREEN_UV)));

	COLOR = (color_filter + wave_color + (texture(noise_texture, SCREEN_UV + vec2(0.1, 0.1) * (TIME * wave_speed)) * 0.5)) / 2.5;
}