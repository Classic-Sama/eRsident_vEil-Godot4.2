extends Node3D

@export var LookAt : PlayerActor
@export var CameraIsStatic := false

func _ready():
	%Camera.current = false

func _process(delta):
	if !CameraIsStatic:
		%Camera.look_at(LookAt.global_transform.origin, Vector3.UP)

func _on_area_3d_body_entered(body):
	if body is PlayerActor:
		print("player entered the ", $".".name, "'s area")
		%Camera.current = true

func _on_area_3d_body_exited(body):
	%Camera.current = false
	print("player left the ", $".".name, "'s area")
