extends CanvasLayer

onready var health := $MarginContainer/MarginContainer/HealthUI

func connect_stats(stats: CharacterStats):
	health.set_health(stats.health.health)
	health.set_max_health(stats.health.max_health)
	stats.health.connect("health_changed", health, "set_health")
	stats.health.connect("max_health_changed", health, "set_max_health")
	
	
