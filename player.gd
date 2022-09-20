extends KinematicBody2D

export var speed = 180
export (int) var jump_speed = -350
export (int) var gravity = 875
export (float, 0, 1.0) var  friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
export (PackedScene) var Bullet

var velocity = Vector2.ZERO

func get_input():
	var dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
	if Input.is_action_pressed("left"):
		dir -= 1
	if dir > 0:
		transform.x.x = 1
	if dir < 0:
		transform.x.x = -1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, acceleration)
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("crouch"):
		transform.y.y = 0.5
	if Input.is_action_just_released("crouch"):
		transform.y.y = 1
		
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
# Declare member variables here. Examples:
# var a = 2
# var b = "text" is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func die():
	$explosion.show()
	$explosion.play("explode")
	$Sprite.hide()
	set_process(false)
	 # hides the player
#	get_tree().reload_current_scene() # restarts
#	get_tree().quit() # close the progame


func _on_portal_entered(body):
		if body == self:
			get_tree().change_scene("\res://level2.tscn")

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.global_transform = $muzzle.global_transform


func _on_explosion_animation_finished():
	get_tree().change_scene("res://GAMEOVER.tscn")
	
