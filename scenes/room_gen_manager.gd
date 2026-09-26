extends Node2D

@export var room_scene: PackedScene 
@export var player: CharacterBody2D

var lastroom_endposition: Vector2 = Vector2.ZERO
var active_room: Array = []
var render_dist_rooms: int = 5

func spawn_room() -> void:
	var new_room = room_scene.instantiate() as Node2D
	add_child(new_room)
	
	if active_room.size() == 0:
		new_room.global_position = -new_room.start_room.position
	else:
		new_room.global_position = lastroom_endposition - new_room.start_room.position
		
	active_room.append(new_room)
	lastroom_endposition = new_room.end_room.global_position
	
func remove_old_rooms() -> void:
	var old_room = active_room.pop_front()
	old_room.queue_free()
	
func _ready() -> void:
	for i in range(render_dist_rooms):
		spawn_room()
func _process(delta: float) -> void:
	if active_room.size() > 0:
		var oldest_room = active_room[0]
		if player.global_position.x > oldest_room.end_room.global_position.x:
			spawn_room()
			remove_old_rooms()
