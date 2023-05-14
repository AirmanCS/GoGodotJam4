extends Node3D
class_name ObstacleCreator

@export var objects: Array[Mesh]

@onready var newRigid = RigidBody3D.new()
@onready var mesh_instance = MeshInstance3D.new()
@onready var coll_shape = CollisionShape3D.new()
@onready var physic_material = PhysicsMaterial.new()

# Call and add object to the scene
func _ready() -> void:
	var max_size = objects.size()-1
	var mesh = objects[randi_range(0, max_size)]
	#Add rigid body and setup layers
	add_child(newRigid)
	newRigid.add_to_group("obstacles")
	newRigid.continuous_cd = true
	newRigid.set_collision_layer_value(2, true)
	newRigid.set_collision_layer_value(1, false)
#	newRigid.set_collision_mask_value(1, true)
	newRigid.set_collision_mask_value(3, false)
	newRigid.set_collision_mask_value(4, true)
	
	mesh_instance.mesh = mesh
	newRigid.add_child(mesh_instance)
	coll_shape.shape = mesh.create_convex_shape()
	newRigid.add_child(coll_shape)
	
	#Setting up RigidBodies properties
	physic_material.bounce = 0.1
	physic_material.absorbent = true
	newRigid.physics_material_override = physic_material
	newRigid.gravity_scale = 5
	
