extends RichTextLabel

@export var sec = 0
@export var min = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	set_text(str(min)+ ":" +str(sec))

func _process(delta: float) -> void:
	if sec == 0:
		min -= 1
		sec = 59
	if sec > 9:
		set_text(str(min)+ ":" +str(sec))
	else:
		set_text(str(min)+ ":" + "0" +str(sec))


func _on_timer_timeout() -> void:
	sec -= 1
	if min == 0 && sec == 0:
		GameManager.game_over()
