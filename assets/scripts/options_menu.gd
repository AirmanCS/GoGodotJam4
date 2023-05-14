extends Control

func _ready():
	$VBoxContainer/Back.grab_focus()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

