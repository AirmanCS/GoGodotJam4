extends Control

func _ready():
	$VBoxContainer/Back.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")