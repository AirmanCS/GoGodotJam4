extends Control

@onready var start_button: AudioStreamPlayer = $VBoxContainer/StartButton/StartButton
@onready var options_button: AudioStreamPlayer = $VBoxContainer/OptionsButton/OptionsButton
@onready var quit_button: AudioStreamPlayer = $VBoxContainer/QuitGameButton/QuitButton
@onready var music: AudioStreamPlayer = $Music


func _ready():
	$VBoxContainer/StartButton.grab_focus()
	GameManager.art_amount = 0
	GameManager.trash_amount = 0
	GameManager.to_be_cleaned = 0
	GameManager.minimum_art = 0
	play_music()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")


func _on_quit_game_button_pressed():
	get_tree().quit()


func _on_start_button_mouse_entered() -> void:
	start_button.play()


func _on_options_button_mouse_entered() -> void:
	options_button.play()


func _on_quit_game_button_mouse_entered() -> void:
	quit_button.play()
	
func play_music():
	await get_tree().create_timer(2).timeout
	music.play()
	
