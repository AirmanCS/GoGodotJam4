extends CanvasLayer

@onready var pause_menu = $PauseMenu


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		pause_menu.visible = true
		get_tree().paused = true
		print("Escape")
	
func _on_resume_button_pressed():
	pause_menu.visible = false
	get_tree().paused = false
	print("resumepressed")

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	print("quitpressed")

func _on_pause_button_pressed():
	get_tree().paused = true
	pause_menu.visible = true
	print("pausedpressed")
