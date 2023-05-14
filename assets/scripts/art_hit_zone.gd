extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacles"):
		GameManager.broken_art_counter()
		queue_free()
