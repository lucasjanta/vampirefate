extends Node

@export var initial_state_path: NodePath
var current_state: State

func _ready():
	current_state = get_node(initial_state_path)
	current_state.enter()

func _unhandled_input(event):
	if current_state:
		current_state.handle_input(event)

func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state: Node):
	if current_state == new_state:
		return
	current_state.exit()
	current_state = new_state
	current_state.enter()
