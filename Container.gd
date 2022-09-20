extends HBoxContainer

enum MODES {simple, empty, partial}

var heart_full = preload("res://platformer-art-complete-pack-0/Base pack/HUD/hud_heartFull.png")


export (MODES) var mode = MODES.simple

func update_health(value):
	match mode:
		MODES.simple:
			update_simple(value)

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i
