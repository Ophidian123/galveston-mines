extends Control



func _on_oph_pressed() -> void:
	ProjectSettings.load_resource_pack("res://levels/oph.pck")
	get_tree().change_scene_to_file("res://main_menu.tscn") 


func _on_kk_pressed() -> void:
	ProjectSettings.load_resource_pack("res://levels/kk.pck")
	get_tree().change_scene_to_file("res://main_menu.tscn") 

#func _ready():
	## 1. Attempt to load the first pack
	#var success_oph = ProjectSettings.load_resource_pack("res://levels/oph.pck")
	#print("OPH Pack Loaded Successfully?: ", success_oph)
	#
	## 2. Attempt to load the second pack
	#var success_kk = ProjectSettings.load_resource_pack("res://levels/kk.pck")
	#print("KK Pack Loaded Successfully?: ", success_kk)
