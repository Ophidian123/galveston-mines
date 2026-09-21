extends CharacterBody2D


const SPEED = 110.0
const JUMP_VELOCITY = -270.0

var jumps : int = 0
var DASH_SPEED = 4
var is_dashing = false

func jump()->void:
	jumps += 1
	velocity.y = JUMP_VELOCITY

func can_jump()->bool:
	if is_on_floor():
		return true
		
	if jumps >0 and jumps < 2:
		return true
		
	return false
	
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		jumps = 0
	else:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and can_jump():
		jump()
		

# get the input direction: -1,0,1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		if is_dashing:
			velocity.x = direction * SPEED * DASH_SPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
