extends StaticBody2D
@onready var sprite_2d = $Sprite2D
@onready var marker_2d = $Marker2D

var triggered := false

const ALDEAO = preload("res://scenes/aldeao.tscn")
const OLD_MAN = preload("res://scenes/old_man.tscn")



func _on_patrol_area_body_entered(body):
	if body is Player:
		triggered = true


func _on_patrol_area_body_exited(body):
	if body is Player:
		triggered = false

func spawn_enemy():
	var enemy = OLD_MAN.instantiate()
	get_parent().add_child(enemy)
	enemy.global_position = marker_2d.global_position

func choose_pattern():
	if !triggered:
		spawn_enemy() if randi_range(1,4) == 1 else print("n foi")
	else:
		spawn_enemy()

func _on_timer_timeout():
	choose_pattern()
