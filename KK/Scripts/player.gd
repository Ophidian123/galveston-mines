extends CharacterBody2D


var current_SPEED = 150.0
const JUMP_VELOCITY = -300.0
const walk_SPEED = 250.0
const sprint_SPEED = 450.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_pressed("sprint"):
		current_SPEED = sprint_SPEED
	else:
		current_SPEED = walk_SPEED
	
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * current_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, current_SPEED)



	move_and_slide()


func _on_killzone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
