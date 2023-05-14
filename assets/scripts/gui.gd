extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var pick_up_trash: Label = $PickUpTrash
@onready var art_left: Label = $ArtLeft
@onready var actual_pick_up_trash: Label = $PickUpTrash/ActualPickUpTrash
@onready var art_left_min: Label = $ArtLeft/ArtLeftMin



func _ready() -> void:
	GameManager.broom_strength_changed.connect(update_bar)
	GameManager.level_trash.connect(update_trash_level)
	GameManager.trash_appeared.connect(update_actual_trash_level)
	art_left.text = (str(GameManager.count_art())  + " /")
	art_left_min.text = str(GameManager.minimum_art)
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
	art_left.text = (str(art_left_amount) + " /")
