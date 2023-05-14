extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacles"):
#		print("basura al basurero")
		GameManager.cleaning_counter()
		body.queue_free()
