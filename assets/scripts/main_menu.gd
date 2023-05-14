extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	GameManager.art_amount = 0
	GameManager.trash_amount = 0
	GameManager.to_be_cleaned = 0
	GameManager.minimum_art = 0

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")


func _on_quit_game_button_pressed():
	get_tree().quit()
