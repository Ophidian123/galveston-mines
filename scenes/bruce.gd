extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var current_SPEED = 350.0
const sprint_SPEED = 550.0
const walk_SPEED = 350.0
const JUMP_VELOCITY = -400.0

# Slide Settings
const SLIDE_SPEED = 700.0
const SLIDE_DURATION = 0.5

# Slide Jump Settings
const SLIDE_JUMP_BOOST = 1.5
const BOOST_TIME = 0.3

var sliding = false
var slide_timer = 0.0

var boosted = false
var boost_timer = 0.0

var facing = 1


func _physics_process(delta: float) -> void:

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Sprint / Walk
	if Input.is_action_pressed("sprint"):
		current_SPEED = sprint_SPEED
	else:
		current_SPEED = walk_SPEED

	# Movement Input
	var direction := Input.get_axis("move_left", "move_right")

	# Remember facing direction
	if direction != 0:
		facing = sign(direction)

	# Start Slide
	if Input.is_action_just_pressed("slide") and is_on_floor() and !sliding:
		sliding = true
		slide_timer = SLIDE_DURATION

		if abs(velocity.x) > current_SPEED:
			velocity.x *= 1.1
		else:
			velocity.x = facing * SLIDE_SPEED

		animated_sprite_2d.play("slide")

	# Jump / Slide Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():

		velocity.y = JUMP_VELOCITY

		if sliding:
			velocity.x *= SLIDE_JUMP_BOOST

			boosted = true
			boost_timer = BOOST_TIME

			sliding = false

		animated_sprite_2d.play("jump")

	# Sliding Logic
	if sliding:

		slide_timer -= delta

		# Keep slide animation playing
		animated_sprite_2d.play("slide")

		# No friction while sliding
		velocity.x = sign(velocity.x) * abs(velocity.x)

		if slide_timer <= 0:
			sliding = false

	else:

		# Normal Movement
		if direction:
			velocity.x = direction * current_SPEED

			if is_on_floor() and !sliding:
				animated_sprite_2d.play("run")

		else:
			velocity.x = move_toward(
				velocity.x,
				0,
				current_SPEED * delta * 8
			)

	# Boost Timer
	if boosted:
		boost_timer -= delta

		if boost_timer <= 0:
			boosted = false

	# Idle Animation
	if sliding:
		animated_sprite_2d.play("slide")
	elif is_on_floor() and abs(velocity.x) < 5:
		animated_sprite_2d.play("idle")

	# Falling Animation
	if !is_on_floor() and velocity.y > 0:
		animated_sprite_2d.play("fall")

	# Sprite Direction
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	move_and_slide()
