extends Node

signal broom_strength_changed(broom_strength)
signal art_broke(art_left)
signal trash_appeared(trash_amount)
signal level_trash(to_be_cleaned)
signal museum_art_preserve(art_amount)

var art_amount = 0
var trash_amount = 0
var to_be_cleaned = 0
var minimum_art = 0

func starting() -> void:
	level_trash.emit(to_be_cleaned)

func count_art() -> int:
	for member in get_tree().get_nodes_in_group("art"):
		art_amount += 1
	minimum_art = art_amount/2
	return art_amount

func broken_art_counter():
	art_amount -= 1
	art_broke.emit(art_amount)
	print(art_amount)
	if art_amount <= minimum_art:
		game_over()

func trash_counter():
	trash_amount += 1
	print(trash_amount)
	trash_appeared.emit(trash_amount)


func cleaning_counter():
	to_be_cleaned -= 1
#	print(to_be_cleaned)
	level_trash.emit(to_be_cleaned)
	if to_be_cleaned == 0:
		you_won()
		
func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
	
func you_won():
	get_tree().change_scene_to_file("res://scenes/you_won.tscn")
