extends CharacterBody2D

@onready var area_fx = $AreaFX


var player_pos := Vector2.ZERO
var dir
var friction := 250.0

func _physics_process(delta):
	move_and_slide()
	if velocity.length() > 0:
		var decel = friction * delta
		if velocity.length() > decel:
			velocity = velocity.move_toward(Vector2.ZERO, decel)
		else:
			velocity = Vector2.ZERO
			area_fx.visible = true
			area_fx.play("default")
	

func _on_area_fx_animation_finished():
	queue_free()
	
func go():
	dir = (player_pos - global_position).normalized()
	velocity = dir * randi_range(75,250)
