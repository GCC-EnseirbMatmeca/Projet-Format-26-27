extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const DASH_SPEED = 3000

var jump_counter = 1
var last_dir = 0

var respawn_pos : Vector2

@export var animation : AnimatedSprite2D

func _ready() -> void:
	respawn_pos = position
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else :
		jump_counter = 1

	# Handle jump.
	if Input.is_action_just_pressed("jump") :
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif jump_counter > 0:
			velocity.y = JUMP_VELOCITY
			jump_counter -= 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED)
		last_dir = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("dash"):
		velocity.x += DASH_SPEED * direction
		
	if Input.is_action_just_pressed("respawn"):
		respawn()
		
	# Handle animations
	if is_on_floor():
		if direction:
			animation.play("Walk")
			if direction > 0:
				animation.flip_h = false
			elif direction < 0:
				animation.flip_h = true
		else:
			animation.play("Idle")
	else:
		animation.play("Jump")
	
	move_and_slide()
	
func respawn():
	position = respawn_pos
