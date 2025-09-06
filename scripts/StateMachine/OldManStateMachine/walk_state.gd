extends EnemyState


@onready var timer = $Timer
@onready var animated_sprite_2d = $"../../AnimatedSprite2D"
var chosen_dir := Vector2.ZERO

func enter(): 
	state_machine = get_parent()
	enemy = get_parent().get_parent()
	decide_behavior()
	update_animation()
	
func physics_update(delta):
	enemy.velocity = chosen_dir * enemy.speed
	enemy.move_and_slide()

func decide_behavior():
	chosen_dir = Vector2(randf_range(0,1), randf_range(0,1))
	timer.start()
	#animated_sprite_2d.flip_h = true if randi_range(0, 1) == 0 else false
	#var start_walking = true if randi_range(1,3) == 1 else false
	#if start_walking:
		#state_machine.change_state(state_machine.get_node("IdleState"))
	
func update_animation():
	if chosen_dir.x > 0:
		animated_sprite_2d.flip_h = false
	elif chosen_dir.x < 0:
		animated_sprite_2d.flip_h = true
	animated_sprite_2d.play("walk")


func _on_timer_timeout():
	state_machine.change_state(state_machine.get_node("IdleState"))
