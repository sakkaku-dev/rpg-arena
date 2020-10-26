extends Node2D

class_name Projectile

export var speed = 300

onready var hit_area = $HitArea

func _physics_process(delta: float) -> void:
	var dir = Vector2.RIGHT.rotated(global_transform.get_rotation())
	translate(dir * speed * delta)


func on_hit(body):
	hit_area.create_hit_effect(self)
	queue_free()
