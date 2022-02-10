extends KinematicBody2D

var SCREEN_WIDTH = 1024
var SCREEN_HEIGHT = 600
var speed: float = 2000
var acceleration: float = 4000
var _slide: float = acceleration / speed
var _velocity: Vector2 = Vector2()

func apply_traction(delta: float) -> void:
	var motion: Vector2 = Vector2()

	# Input phase
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	# Check the borders
	if position.x >= SCREEN_WIDTH:
		position.x = -32
	if position.x <= -33:
		position.x = SCREEN_WIDTH
	if position.y >= SCREEN_HEIGHT:
		position.y = 0
	if position.y <= -1:
		position.y = SCREEN_HEIGHT
		
	motion = motion.normalized()
	_velocity += motion * acceleration * delta
	
func _process(delta: float) -> void:
	apply_traction(delta)
	apply_friction(delta)

func _physics_process(delt: float) -> void:
	_velocity = move_and_slide(_velocity)

func apply_friction(delta: float) -> void:
	_velocity -= _velocity * _slide * delta
