extends CanvasLayer

@onready var pause_menu = $PauseMenu

#func _ready() -> void:
#	set_process_mode(Node.PROCESS_MODE_DISABLED)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel"):
#		pause_menu.visible = true
#		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_resume_button_pressed():
	pause_menu.visible = false
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _on_quit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_pause_button_pressed():
	pause_menu.visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
