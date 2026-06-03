shader_type canvas_item;

uniform float color_filter_r : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float color_filter_g : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float color_filter_b : hint_range(0.0, 1.0, 0.01) = 0.0;


void fragment() {
	COLOR = vec4(color_filter_r, color_filter_g, color_filter_b, 1.0);
}