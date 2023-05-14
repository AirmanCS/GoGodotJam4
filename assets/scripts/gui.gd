extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	GameManager.broom_strength_changed.connect(update_bar)
	progress_bar.value = 22

func update_bar(data):
	progress_bar.value = data
