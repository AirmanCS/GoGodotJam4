extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	GameManager.art_amount = 0
	GameManager.trash_amount = 0
	GameManager.to_be_cleaned = 0
	GameManager.minimum_art = 0

func _on_start_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_quit_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
