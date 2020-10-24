extends CanvasLayer

onready var health := $MarginContainer/MarginContainer/HealthUI

func set_health(hp: int) -> void:
	health.set_health(hp)

func set_max_health(hp: int) -> void:
	health.set_max_health(hp)
