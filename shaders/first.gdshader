shader_type canvas_item;

uniform float color_filter_r : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float color_filter_g : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float color_filter_b : hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float color_filter_a : hint_range(0.0, 1.0, 0.01) = 1.0;

uniform float wave_frequency : hint_range(0.1, 100.0, 0.1) = 10.0;
uniform float wave_speed : hint_range(0.0, 10.0, 0.01) = 5.0;
uniform float wave_amplitude : hint_range(0.0, 0.1, 0.005) = 0.01;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform sampler2D noise_texture : repeat_enable;

void fragment() {

    float mask = smoothstep(0.0, 0.2, UV.y);

    COLOR = (texture(SCREEN_TEXTURE, ((texture(noise_texture, SCREEN_UV + vec2(0.1, 0.1) * TIME).r * 0.2) + SCREEN_UV)))
    + texture(TEXTURE, ((texture(noise_texture, SCREEN_UV + vec2(0.1, 0.1) * TIME).r * 0.2) + SCREEN_UV)) / 2.0;

    COLOR.a = mask - 0.1;
}
