extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var pick_up_trash: Label = $PickUpTrash
@onready var art_left: Label = $ArtLeft
@onready var actual_pick_up_trash: Label = $PickUpTrash/ActualPickUpTrash

var first = false
var amount = 0

func _ready() -> void:
	GameManager.broom_strength_changed.connect(update_bar)
	GameManager.level_trash.connect(update_trash_level)
	GameManager.trash_appeared.connect(update_actual_trash_level)
	GameManager.art_broke.connect(update_art_left)
	GameManager.starting()
	
	progress_bar.value = 22

func update_bar(data):
	progress_bar.value = data

func update_trash_level(trash_level):
	pick_up_trash.text = str(trash_level)
	
func update_actual_trash_level(actual_trash_level):
	actual_pick_up_trash.text = (str(actual_trash_level) + " /")

func update_art_left(art_left_amount):
	if first == false:
		amount = art_left_amount/2
		art_left.text = str(amount)
		first = true
	else:
		if amount >= 0:
			amount -= 1
			art_left.text = str(amount)
