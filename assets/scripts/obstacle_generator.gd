extends Node3D

@export var objects: Array[Mesh]

@onready var newRigid = RigidBody3D.new()
@onready var mesh_instance = MeshInstance3D.new()
@onready var coll_shape = CollisionShape3D.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var max_size = objects.size()-1
	var mesh = objects[randi_range(0, max_size)]
	add_child(newRigid)
	mesh_instance.mesh = mesh
	newRigid.add_child(mesh_instance)
	coll_shape.shape = mesh.create_convex_shape()
	newRigid.add_child(coll_shape)
