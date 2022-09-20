extends Node2D





func _on_Level1_body_entered(body):
	if body == $player:
		$Camera2D.position.y = -2
		$Camera2D.position.x = 2 # Replace with function body.



func _on_level2_body_entered(body):
	if body == $player:
		$Camera2D.position.y = -1
		$Camera2D.position.x = 540.5 # Replace with function body.
		$CanvasLayer/Label.hide()
