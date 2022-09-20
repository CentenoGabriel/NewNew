extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Level1_body_entered(body):
	if body == $player:
		position.x = 2 # Replace with function body.
		position.y = -0.5

func _on_level2_body_entered(body):
	if body == $player:
		position.x = 538
		position.y = 14# Replace with function body.
