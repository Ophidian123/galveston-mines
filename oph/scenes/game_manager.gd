extends Node

var score = 0
@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func add_point():
	score += 1
	label.text = "SCORE :  " + str(score)
	
