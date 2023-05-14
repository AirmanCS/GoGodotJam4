extends CharacterBody3D

const smooth_speed = 22

var export_direction = Vector3.ZERO

@export var run_speed = 5.0

@onready var speed = run_speed
@onready var walk_speed = run_speed/2
@onready var animation_player: AnimationPlayer = $visuals/main_character/AnimationPlayer
@onready var visuals: Node3D = $visuals

var walking = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("walk"):
		speed = walk_speed
	if Input.is_action_just_released("walk"):
		speed = run_speed


func _ready() -> void:
	animation_player.set_blend_time("Idle", "Run", 0.2)
	animation_player.set_blend_time( "Run", "Idle", 0.1)


func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():w
#		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	export_direction = direction
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		_orient_visuals(direction, delta)
#		visuals.look_at(direction + position)
		
		if !walking:
			walking = true
			animation_player.play("Run")
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
		if walking:
			walking = false
			animation_player.play("Idle")
	
	move_and_slide()

func _orient_visuals(direction, delta):
	#Rotates Character to look at front in the direction of the camera
	#Main function is the looking at that works with 3D transfroms, then I use a second
	#line to avoid changing rotations too fast
	var alignment: Transform3D = visuals.transform.looking_at(direction, Vector3.UP)
	visuals.transform = visuals.transform.interpolate_with(alignment, delta * smooth_speed)
