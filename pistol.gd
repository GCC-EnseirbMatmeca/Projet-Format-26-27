extends Node2D

var number_bullet = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	SignalBus.shoot_bullet.emit(number_bullet)
	var bullet_scene : PackedScene = load("res://bullet.tscn")
	if Input.is_action_just_pressed("shoot") and number_bullet > 0:
		var bullet = bullet_scene.instantiate()
		$Node.add_child(bullet)
		bullet.position = global_position
		bullet.velocity.x *= scale.x
		number_bullet -= 1
