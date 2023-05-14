extends Node

signal broom_strength_changed(broom_strength)
signal art_broke(art_left)
signal trash_appeared(trash_amount)

var art_amount = 0
var trash_amount = 0
var cleaned_amount = 0
var minimum_art = 0

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
		print("game over")

func trash_counter():
	trash_amount += 1
	print(trash_amount)
	trash_appeared.emit(trash_amount)
	
func cleaning_counter():
	cleaned_amount -= 1
	print(cleaned_amount)
	if cleaned_amount == 0:
		print("you won")
