extends Node2D
const SPEED = 60
var direction = 1
@onready var raycast_right: RayCast2D = $raycast_right
@onready var raycast_left: RayCast2D = $raycast_left
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if raycast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta
 
