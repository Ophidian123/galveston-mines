extends Node2D




func _on_body_entered(body: Node2D) -> void:
	print('+1 Coin!') # Replace with function body.
	queue_free()
