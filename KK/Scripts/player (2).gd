extends CharacterBody2D


var current_SPEED = 150.0
const JUMP_VELOCITY = -300.0
const walk_SPEED = 150.0
const sprint_SPEED = 250.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_pressed("sprint"):
		current_SPEED = sprint_SPEED
	else:
		current_SPEED = walk_SPEED


#Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * current_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, current_SPEED)

	if direction > 0:
		animated_sprite_2d.flip_h = false 
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	if direction == 0:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("run")
		
		if not is_on_floor():
			animated_sprite_2d.play("jump")
		
	move_and_slide()
