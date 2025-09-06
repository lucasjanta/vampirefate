extends State

@onready var vampire_as = $"../../VampireAS"
@onready var animation_player = $"../../AnimationPlayer"


func enter():
	state_machine = get_parent()
	player = get_parent().get_parent()
	player.velocity = Vector2.ZERO
	update_animation()

func handle_input(event): 
	player.move_and_slide()
	var input_vector = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	if input_vector.length() > 0:
		state_machine.change_state(state_machine.get_node("WalkState"))
		
	if Input.is_action_just_pressed("attack1"):
		state_machine.change_state(state_machine.get_node("AttackState"))
	#if event.is_action_pressed("up"):
		#print("show")

func update_animation():
	if player.looking_right:
		vampire_as.flip_h = true
	else:
		vampire_as.flip_h = false
	animation_player.play("idle")
