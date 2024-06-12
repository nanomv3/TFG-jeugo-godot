extends Node3D

@export var multi_mesh_instance: MultiMeshInstance3D
@export var collision_shape: BoxShape3D

func _ready():
	if not multi_mesh_instance or not collision_shape:
		print("MultiMeshInstance3D o CollisionShape3D no están configurados.")
		return

	var multi_mesh = multi_mesh_instance.multimesh
	if not multi_mesh:
		print("MultiMesh no está configurado en el MultiMeshInstance3D.")
		return

	for i in range(multi_mesh.instance_count):
		var tree_transform = multi_mesh_instance.get_instance_transform(i)

		var collision_shape_instance = CollisionShape3D.new()
		collision_shape_instance.shape = collision_shape.duplicate()

		var static_body = StaticBody3D.new()
		static_body.transform = tree_transform
		static_body.add_child(collision_shape_instance)

		add_child(static_body)

func duplicate_shape(original_shape: Shape3D) -> Shape3D:
	var new_shape = original_shape.duplicate()
	return new_shape
