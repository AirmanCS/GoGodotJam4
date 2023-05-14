extends Area3D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacles"):
#		print("basura al basurero")
		GameManager.cleaning_counter()
		audio_stream_player.play()
		body.queue_free()
