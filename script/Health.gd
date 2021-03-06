extends Node

class_name Health

signal no_health
signal health_changed(health)
signal max_health_changed(health)

export var max_health = 1 setget set_max_health
onready var health = max_health setget set_health

func set_max_health(hp: int) -> void:
	max_health = hp
	if health != null:
		self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(hp: int) -> void:
	health = max(0, hp)
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
