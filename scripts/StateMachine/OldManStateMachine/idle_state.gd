extends EnemyState

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

func enter(): 
	state_machine = get_parent()
	enemy = get_parent().get_parent()
	update_animation()
		
func decide_behavior():
	animated_sprite_2d.flip_h = true if randi_range(0, 1) == 0 else false
	var start_walking = true if randi_range(1,2) == 1 else false
	if start_walking:
		state_machine.change_state(state_machine.get_node("WalkState"))
	if enemy.target != null and randi_range(1, 2) == 1:
		state_machine.change_state(state_machine.get_node("AttackState"))
	
func update_animation():
	animated_sprite_2d.play("idle")

func _on_timer_timeout():
	decide_behavior()
