extends Area3D

@onready var animation_player: AnimationPlayer = $Painting/AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacles"):
		GameManager.broken_art_counter()
		audio_stream_player.play()
		animation_player.play("fall")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
