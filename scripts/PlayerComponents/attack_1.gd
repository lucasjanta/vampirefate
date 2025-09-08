extends Node2D

@onready var vampire_as = $"../VampireAS"
@onready var vfx = $vfx

@onready var mouse_cursor = $"../Control/CanvasLayer/MouseCursor"
@export var cooldown := 2.5
var timer := cooldown
var base_dmg : float = 0
@export var damage := 0.0
@export var impulse_force := 150.0

var direction : Vector2

func _ready():
	base_dmg = get_parent().base_dmg

func _process(delta):
	mouse_cursor.global_position = get_global_mouse_position()
	direction = (get_global_mouse_position() - global_position).normalized()

func change_animation_direction():
	var dir = (get_global_mouse_position() - global_position).normalized()
	rotation = dir.angle() + deg_to_rad(90)
	vampire_as.rotation = dir.angle() + deg_to_rad(90)



func _on_hit_area_body_entered(body):
	if body is Enemy:
		body.take_damage(base_dmg + damage)
