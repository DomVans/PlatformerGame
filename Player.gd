extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = -500
var motion = Vector2.ZERO

func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play('Run')
	elif Input.is_action_pressed('ui_left'):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play('Run')
		
	else:
		$Sprite.play('Idle')
		motion.x = lerp(motion.x, 0, 0.2)
	
	if is_on_floor():
		if Input.is_action_pressed('ui_up'):
			motion.y = JUMP_HEIGHT
	else:
		if motion.y < 0:
			$Sprite.play('Jump')
		else:
			$Sprite.play('FallDown')
	motion = move_and_slide(motion, UP)



	pass
'res://Sprites/Player/Jump1.png'
