extends Node2D
@onready var end_room: Marker2D = $end_room
@onready var start_room: Marker2D = $start_room

func _ready() -> void:
	print(name, " start_room.position: ", start_room.position)
	print(name, " end_room.position: ", end_room.position)
