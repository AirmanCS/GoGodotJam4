extends Node3D

var obstacle = preload("res://scenes/obstacle.tscn")
var timer_is_running = false
var max_trash = false
@export var level_trash_amount = 10

func _ready() -> void:
	GameManager.trash_appeared.connect(stop_spawn)
	GameManager.to_be_cleaned = level_trash_amount
#	GameManager.level_trash.emit(level_trash_amount)

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if !timer_is_running && max_trash == false:
		spawn_timer()


func spawn_new_obstacle():
	var local_obstacle = obstacle.instantiate()
	add_child(local_obstacle)
	local_obstacle.global_position = Vector3(randi_range(-7, 7),\
	+ 5,randi_range(-10, 10))
	local_obstacle.rotate(Vector3(1, 0, 0), randf_range(0, 35))
	local_obstacle.rotate(Vector3(0, 0, 1), randf_range(0, 35))
	GameManager.trash_counter()


func spawn_timer():
#	print("CalledTimer")
	timer_is_running = true
	spawn_new_obstacle()
	await get_tree().create_timer(randi_range(2, 6)).timeout
	timer_is_running = false
	
func stop_spawn(trash_amount):
	if trash_amount == level_trash_amount:
		max_trash = true
#	print(str(trash_amount) + " game manager" + str(level_trash_amount) + " level trash" + str(max_trash))
	
