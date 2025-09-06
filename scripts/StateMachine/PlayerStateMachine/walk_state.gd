extends State

@onready var vampire_as = $"../../VampireAS"
@onready var animation_player = $"../../AnimationPlayer"

var input_vector := Vector2.ZERO

func enter(): 
	state_machine = get_parent()
	player = get_parent().get_parent()

func physics_update(delta):
	input_vector = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	player.move_and_slide()
	update_animation(input_vector)
	
	if input_vector.length() > 0:
		player.velocity = input_vector * player.speed
	else:
		state_machine.change_state(state_machine.get_node("IdleState"))
		
	if Input.is_action_just_pressed("attack1"):
		state_machine.change_state(state_machine.get_node("AttackState"))
	
func update_animation(dir):
	if player.looking_right:
		vampire_as.flip_h = true
	else:
		vampire_as.flip_h = false
	animation_player.play("walk")
