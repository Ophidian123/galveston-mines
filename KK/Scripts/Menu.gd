extends Button




func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	
	


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
	
	


func _on_help_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/help.tscn")
