class_name PlayerActor
extends CharacterBody3D

var move_speed := 5.0
var rotate_speed := 3.0
var gravity := 9.8

func _process(delta):
	velocity.x = 0
	velocity.z = 0

	var input_dir = Vector3()

	if Input.is_action_pressed("fwd"):
		input_dir.z -= 1
	if Input.is_action_pressed("bwd"):
		input_dir.z += 1

	velocity += transform.basis * (input_dir * move_speed)
	velocity.y -= gravity * delta
	move_and_slide()

	if Input.is_action_pressed("lft"):
		rotate_y(rotate_speed * delta)
	if Input.is_action_pressed("rgt"):
		rotate_y(-rotate_speed * delta)
