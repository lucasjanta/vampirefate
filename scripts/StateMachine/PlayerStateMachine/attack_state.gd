extends State

@onready var animation_player = $"../../AnimationPlayer"
@onready var timer = $Timer
@onready var attack_1fx = $"../../Attack1FX"

var cooldown : float
var base_dmg : float = 0
var direction : Vector2
@export var damage := 0.0

func enter(): 
	state_machine = get_parent()
	player = get_parent().get_parent()
	base_dmg = player.base_dmg
	update_animation(direction)
	
func physics_update(delta):
	player.move_and_slide()
	player.velocity = attack_1fx.direction * attack_1fx.impulse_force

	
func update_animation(dir):
	attack_1fx.change_animation_direction()
	animation_player.play("attack1")
	
func end_state():
	state_machine.change_state(state_machine.get_node("IdleState"))
