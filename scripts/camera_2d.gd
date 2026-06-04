extends Camera2D

@onready var color_sprite: Sprite2D = $"../Color"

@onready var red: HSlider = $"../Red"
@onready var green: HSlider = $"../Green"
@onready var blue: HSlider = $"../Blue"
@onready var alpha: HSlider = $"../Alpha"
@onready var wave_speed: HSlider = $"../Wave Speed"
@onready var wave_amplitude: HSlider = $"../Wave Amplitude"

@onready var red_grd: Sprite2D = $"../red_grd"
@onready var green_grd: Sprite2D = $"../green_grd"
@onready var blue_grd: Sprite2D = $"../blue_grd"
@onready var alpha_grd: Sprite2D = $"../alpha_grd"
@onready var wave_speed_grd: Sprite2D = $"../wave_speed_grd"
@onready var wave_amp_grd: Sprite2D = $"../wave_amp_grd"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	color_sprite.material.set_shader_parameter("color_filter", Vector4(red.value, green.value, blue.value, alpha.value))
	color_sprite.material.set_shader_parameter("wave_speed", wave_speed.value)
	color_sprite.material.set_shader_parameter("wave_amplitude", wave_amplitude.value)
	wave_speed_grd.material.set_shader_parameter("color_filter", Vector4(red.value, green.value, blue.value, alpha.value))
	wave_amp_grd.material.set_shader_parameter("color_filter", Vector4(red.value, green.value, blue.value, alpha.value))

	red_grd.material.set_shader_parameter("color_start", Vector4(0.0, green.value, blue.value, alpha.value))
	green_grd.material.set_shader_parameter("color_start", Vector4(red.value, 0.0, blue.value, alpha.value))
	blue_grd.material.set_shader_parameter("color_start", Vector4(red.value, green.value, 0.0, alpha.value))
	alpha_grd.material.set_shader_parameter("color_start", Vector4(red.value, green.value, blue.value, 0.0))
	
	wave_speed_grd.material.set_shader_parameter("wave_start", Vector2(0.0, wave_amplitude.value))
	wave_amp_grd.material.set_shader_parameter("wave_start", Vector2(wave_speed.value, 0.0))

	red_grd.material.set_shader_parameter("color_end", Vector4(1.0, green.value, blue.value, alpha.value))
	green_grd.material.set_shader_parameter("color_end", Vector4(red.value, 1.0, blue.value, alpha.value))
	blue_grd.material.set_shader_parameter("color_end", Vector4(red.value, green.value, 1.0, alpha.value))
	alpha_grd.material.set_shader_parameter("color_end", Vector4(red.value, green.value, blue.value, 1.0))

	wave_speed_grd.material.set_shader_parameter("wave_end", Vector2(10.0, wave_amplitude.value))
	wave_amp_grd.material.set_shader_parameter("wave_end", Vector2(wave_speed.value, 1.0))
