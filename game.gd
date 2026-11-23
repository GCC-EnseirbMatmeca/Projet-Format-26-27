extends Node

@export var level : PackedScene


func _on_control_game_start() -> void:
	var lvl = level.instantiate()
	add_child(lvl)
	pass # Replace with function body.
