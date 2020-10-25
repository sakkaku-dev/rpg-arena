extends Node

class_name CharacterStats

export var stats: Resource

onready var health: Health = $Health

const speed_base = 100

func _ready():
	_initialize_stats(stats)

func _initialize_stats(stat: Stats) -> void:
	health.max_health = stat.vitality
	health.health = stat.vitality

func damaged(hp: int) -> void:
	health.health -= hp

func get_stats() -> Stats:
	return stats as Stats

func get_speed() -> int:
	return get_stats().agility * speed_base

func get_physical_damage(dmg: int) -> int:
	return get_stats().strength * dmg
