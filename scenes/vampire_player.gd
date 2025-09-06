extends CharacterBody2D
class_name Player

var speed := 75.0
@export var base_dmg := 20.0
var cursor_pos : Vector2
var looking_right = true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	cursor_pos = get_global_mouse_position()
	update_player_side()
	
func update_player_side():
	if cursor_pos.x > global_position.x:
		looking_right = true
	elif cursor_pos.x < global_position.x:
		looking_right = false
	
