extends Area2D

class_name AreaSpellSelect

signal activate_spell(pos)

onready var collision := $CollisionShape2D
onready var mesh := $MeshInstance2D

func _physics_process(delta: float) -> void:
	global_position = get_global_mouse_position()

func set_size(size: int) -> void:
	var circle = collision.shape as CircleShape2D
	circle.radius = size
	mesh.scale = Vector2(size, size)
