extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.shoot_bullet.connect(update_text)
	print("label")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_text(num : int):
	text = "Bullet : " + str(num)
