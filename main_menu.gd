extends Control

signal game_start

func _on_btn_play_pressed() -> void:
	game_start.emit()
	queue_free()
	


func _on_btn_quit_pressed() -> void:
	get_tree().quit()
