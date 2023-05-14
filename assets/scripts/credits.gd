extends CanvasLayer


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_game_button_pressed():
	get_tree().quit()
