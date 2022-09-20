extends KinematicBody2D

var velocity = Vector2.ZERO
var move
export (PackedScene) var enemybullet
export var speed = 287
export (int) var gravity = 725
export (float, 0, 1.0) var  friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
# Declare member variables here. Examples:
func _physics_process(delta):
	var move = 0
	var dir = 0
	if velocity.x > 0:
		dir += 1
	if velocity.x < 0:
		dir -= 1
	if velocity.x > 0:
		transform.x.x = 1
	if velocity.x < 0:
		transform.x.x = -1
	if velocity.x != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, acceleration)
	velocity.y += gravity * delta
	if position.x <= 1169:
		velocity.x = speed
	if position.x >= 1619:
		velocity.x = -speed
	if velocity.x < speed:
		if velocity.x > -speed:
			if position.x > 1169.000001:
				if position.x < 1619.000001:
					if transform.x.x == 1:
						velocity.x = speed
					if transform.x.x == -1:
						velocity.x = -speed
	velocity = move_and_slide(velocity, Vector2.UP)
	


# Called when the node enters the scene tree for the first time.
func _Enemy_Area_body_entered(body):
	shoot()
	
func shoot():
	var b = enemybullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform


 # Replace with function body.
