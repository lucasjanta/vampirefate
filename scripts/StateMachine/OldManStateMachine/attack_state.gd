extends EnemyState

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

const ONION = preload("res://scenes/onion.tscn")
var chosen_dir := Vector2.ZERO

func enter(): 
	state_machine = get_parent()
	enemy = get_parent().get_parent()
	enemy.velocity = Vector2.ZERO
	attack_player()
	update_animation()
	
func physics_update(delta):
	enemy.move_and_slide()

func attack_player():
	if !enemy.dead:
		var onion = ONION.instantiate()
		
		enemy.get_parent().add_child(onion)
		onion.global_position = enemy.global_position
		onion.player_pos = enemy.target.global_position
		onion.go()
	
	state_machine.change_state(state_machine.get_node("IdleState"))
	
func update_animation():
	if chosen_dir.x > 0:
		animated_sprite_2d.flip_h = false
	elif chosen_dir.x < 0:
		animated_sprite_2d.flip_h = true
	animated_sprite_2d.play("walk")
