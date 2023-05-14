extends Area3D

const max_strength = 32
const min_strength = 15

@onready var arrow_back: MeshInstance3D = $"../ArrowBack"
@onready var arrow_front: MeshInstance3D = $"../ArrowFront"
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


var body_state: PhysicsDirectBodyState3D
var force_strength = 22
var collision_normal = Vector3.ZERO
var player: CharacterBody3D
var scroll_value:int = 0


func _ready() -> void:
	player = $"../.."
	collision_normal = player.export_direction


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("scroll_up"):
		scroll_value = abs(force_strength)
		if scroll_value <= max_strength:
			scroll_value += 1
			force_strength = clampi(scroll_value,15,32)
			GameManager.broom_strength_changed.emit(force_strength)

	if Input.is_action_just_pressed("scroll_down"):
		scroll_value = abs(force_strength)
		if scroll_value >= min_strength:
			scroll_value -= 1
			force_strength = clampi(scroll_value,15,32)
			GameManager.broom_strength_changed.emit(force_strength)
			
			
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reverse_force"):
		force_strength = -force_strength
#		print("inverted")
		arrow_back.visible = !arrow_back.visible
		arrow_front.visible = !arrow_front.visible
		
		
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacles"):
		var rigidbody = body as RigidBody3D
		var collision_normal = player.export_direction
		rigidbody.apply_impulse(collision_normal * force_strength, Vector3.ZERO)
		audio_stream_player.play()
