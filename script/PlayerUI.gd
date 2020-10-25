extends CanvasLayer

export var stats_path: NodePath
onready var stats: CharacterStats = get_node(stats_path)

onready var health := $MarginContainer/MarginContainer/HealthUI

func _ready():
	yield(stats, "ready")
	health.set_health(stats.health.health)
	health.set_max_health(stats.health.max_health)
	stats.health.connect("health_changed", health, "set_health")
	stats.health.connect("max_health_changed", health, "set_max_health")
	
	
