shader_type canvas_item;

uniform vec4 color_filter = vec4(0.0, 0.0, 0.0, 1.0);

uniform vec2 wave_start = vec2(0.0, 1.0);
uniform vec2 wave_end = vec2(10.0, 1.0);

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform sampler2D noise_texture : repeat_enable;

void fragment() {
	vec4 wave_color_start = (texture(SCREEN_TEXTURE, (((texture(noise_texture, SCREEN_UV + vec2(0.1, 0.1) * (TIME * wave_start.x)).r * 0.2) * wave_start.y) + SCREEN_UV)));
	vec4 wave_color_end = (texture(SCREEN_TEXTURE, (((texture(noise_texture, SCREEN_UV + vec2(0.1, 0.1) * (TIME * wave_end.x)).r * 0.2) * wave_end.y) + SCREEN_UV)));
	
	vec4 color_start = (color_filter + wave_color_start) / 2.0;
	vec4 color_end = (color_filter + wave_color_end) / 2.0;

	COLOR = mix(color_start, color_end, UV.x);
}