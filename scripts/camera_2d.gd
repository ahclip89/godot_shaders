extends Camera2D

@onready var color_sprite: Sprite2D = $"../Color"

@onready var red: HSlider = $"../Red"
@onready var green: HSlider = $"../Green"
@onready var blue: HSlider = $"../Blue"

@onready var red_grd: Sprite2D = $"../red_grd"
@onready var green_grd: Sprite2D = $"../green_grd"
@onready var blue_grd: Sprite2D = $"../blue_grd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	color_sprite.material.set_shader_parameter("color_filter_r", red.value)
	color_sprite.material.set_shader_parameter("color_filter_g", green.value)
	color_sprite.material.set_shader_parameter("color_filter_b", blue.value)

	red_grd.material.set_shader_parameter("color_start", Vector4(0.0, green.value, blue.value, 1.0))
	green_grd.material.set_shader_parameter("color_start", Vector4(red.value, 0.0, blue.value, 1.0))
	blue_grd.material.set_shader_parameter("color_start", Vector4(red.value, green.value, 0.0, 1.0))

	red_grd.material.set_shader_parameter("color_end", Vector4(1.0, green.value, blue.value, 1.0))
	green_grd.material.set_shader_parameter("color_end", Vector4(red.value, 1.0, blue.value, 1.0))
	blue_grd.material.set_shader_parameter("color_end", Vector4(red.value, green.value, 1.0, 1.0))
