extends Enemy

var speed := 75.0
@export var full_hp := 20.0
var hp : float
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var death_anim = $DeathAnim
@onready var dmg_label = $DMGLabel
@onready var hit_animation = $HitAnimation
var target : Player = null
var dead = false


func _ready():
	hp = full_hp

func take_damage(dmg):
	hp -= dmg
	show_dmg(dmg)
	if hp <= 0:
		die()
		
func die():
	dead = true
	death_anim.visible = true
	death_anim.play("default")
	animated_sprite_2d.visible = false
	


func _on_death_anim_animation_finished():
	queue_free()

func show_dmg(dmg):
	dmg_label.text = "-" + str(dmg)
	hit_animation.play("hit")


func _on_detection_area_body_entered(body):
	if body is Player:
		target = body
		


func _on_detection_area_body_exited(body):
	if body is Player:
		target = null
