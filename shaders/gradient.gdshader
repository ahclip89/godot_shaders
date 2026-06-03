shader_type canvas_item;

uniform vec4 color_start = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec4 color_end = vec4(0.0, 0.0, 1.0, 1.0);

void fragment() {
	
	COLOR = mix(color_start, color_end, UV.x);
}

