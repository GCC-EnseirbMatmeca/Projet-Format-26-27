extends Node2D

var velocity : Vector2 = Vector2(2000, 0)
var timer = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta
	timer -= delta
	if timer < 0:
		queue_free()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	pass # Replace with function body.
