extends Control

@onready var credits_button: AudioStreamPlayer = $VBoxContainer/Credits/CreditsButton
@onready var back_button: AudioStreamPlayer = $VBoxContainer/Back/BackButton


func _ready():
	$VBoxContainer/Back.grab_focus()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")



func _on_credits_mouse_entered() -> void:
	credits_button.play()


func _on_back_mouse_entered() -> void:
	back_button.play()
