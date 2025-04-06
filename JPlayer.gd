extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = -500
var motion = Vector2.ZERO

onready var animation_player : AnimationPlayer = $AnimationPlayer
onready var sprite: AnimatedSprite = $Sprite

func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		sprite.flip_h = false
		animation_player.play("run")
	elif Input.is_action_pressed('ui_left'):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		sprite.flip_h = true
		animation_player.play("run")
		
		
	else:
		animation_player.play("idle")
		motion.x = lerp(motion.x, 0, 0.2)
	
	if is_on_floor():
		if Input.is_action_pressed('ui_up'):
			motion.y = JUMP_HEIGHT
	else:
		if motion.y < 0:
			animation_player.play("jump")
		else:
			animation_player.play("fall")
	motion = move_and_slide(motion, UP)



	pass
'res://Sprites/Player/Jump1.png'
