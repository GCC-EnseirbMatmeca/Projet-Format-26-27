extends Node2D


func _on_tete_body_entered(body: Node2D) -> void:
	if body is Player:
		queue_free()
	pass # Replace with function body.
