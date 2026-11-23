extends Area2D

@export var degat : int = 20

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(degat)
		#body.respawn()
	pass # Replace with function body.
