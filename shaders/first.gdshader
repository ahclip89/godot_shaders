shader_type canvas_item;

uniform float color_filter_r : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float color_filter_g : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float color_filter_b : hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float color_filter_a : hint_range(0.0, 1.0, 0.01) = 1.0;

uniform float wave_frequency : hint_range(0.1, 100.0, 0.1) = 10.0;
uniform float wave_speed : hint_range(0.0, 10.0, 0.01) = 5.0;
uniform float wave_amplitude : hint_range(0.0, 0.1, 0.005) = 0.01;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    float wave_screen_x = sin(SCREEN_UV.x * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;
    float wave_screen_x_2 = sin(SCREEN_UV.x * wave_frequency * 2.0 + TIME * wave_speed * -2.0) * 0.01 - 0.01;

    float wave_texture_x = sin(UV.x * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;
    float wave_texture_x_2 = sin(UV.x * wave_frequency * 2.0 + TIME * wave_speed * -2.0) * 0.01 - 0.01;


    float wave_screen_y = sin(SCREEN_UV.y * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;

    float wave_texture_y = sin(UV.y * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;


    float mask = smoothstep(0.01, 0.025, (UV.y / 3.0) + wave_texture_x + wave_texture_x_2);
    float outline = smoothstep(0.01, 0.1, (UV.y / 3.0) + wave_texture_x + wave_texture_x_2);

    vec2 wave_screen_uv = SCREEN_UV + vec2(wave_screen_x, wave_screen_y);
    vec2 wave_texture_uv = UV + vec2(wave_texture_x, wave_texture_y);

    COLOR = (texture(SCREEN_TEXTURE, wave_screen_uv) + texture(TEXTURE, wave_texture_uv) 
    + vec4(color_filter_r, color_filter_g, color_filter_b, color_filter_a)) / 3.00;
    COLOR.rgb /= outline;

    COLOR.a = mask;
}
