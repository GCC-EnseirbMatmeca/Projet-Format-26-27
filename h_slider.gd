extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.update_hp.connect(update_value)
	pass # Replace with function body.

func update_value(val : int):
	value = val

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
