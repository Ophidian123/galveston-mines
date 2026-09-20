extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("you DIED!")
	body.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = 0.5
	timer.start()
	

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	Engine.time_scale = 1.0
