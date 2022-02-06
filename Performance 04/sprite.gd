# Created by OrionSR           -Performance 04: Sprites-
extends KinematicBody2D

# Animations
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimationPlayer.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("run")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("ui_up"):
		$AnimationPlayer.play("jump")
	elif Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("crouch")
	else:
		$AnimationPlayer.play("idle")
