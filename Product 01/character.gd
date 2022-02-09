# Created by OrionSR           -Performance 03: Jumper-
#variables
extends KinematicBody2D

export var gravity_acceleration = 1500
export var jump_impulse = 700
export var speed = 300.0
var _velocity = Vector2.ZERO
var h_input = 0
var jump_input: float

# Input phase
func _unhandled_input(event):
	h_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	jump_input = Input.is_action_just_pressed("ui_select") #space_bar
	
	if Input.is_action_just_pressed("ui_right"):
		$Sprite.flip_h = false
	elif Input.is_action_just_pressed("ui_left"):
		$Sprite.flip_h = true

func _physics_process(delta):
	# velocity
	_velocity.x = h_input * speed

	#jumping logic
	if jump_input and is_on_floor():
		_velocity.y = -jump_impulse
		#$AnimationPlayer.play("Jump")

	#gravity
	_velocity.y += gravity_acceleration * delta
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	#Animations
	if is_on_floor():
		if h_input == 0.0:
			$AnimationPlayer.play("Idle")
		else:
			$AnimationPlayer.play("Run")
	else:
		if _velocity.y > 0.0:
			$AnimationPlayer.play("Falling")
		else:
			$AnimationPlayer.play("Jump")
			
	if Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("Crouch")
			
 
