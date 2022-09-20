extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_hitbox_body_entered(body):
	if body == $player:
		get_tree().change_scene("res://Gameover.tscn") # Replace with function body.
