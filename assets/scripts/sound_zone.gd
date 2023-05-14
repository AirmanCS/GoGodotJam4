extends Area3D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacles"):
		audio_stream_player.play()
