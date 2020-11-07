extends Control

class_name CharacterStatsUI

export var stats: Resource

onready var strength := $HBoxContainer/Stats/HBoxContainer/Strength
onready var vitality := $HBoxContainer/Stats/HBoxContainer2/Vitality
onready var intelligence := $HBoxContainer/Stats/HBoxContainer3/Intelligence
onready var agility := $HBoxContainer/Stats/HBoxContainer4/Agility

onready var width: int = $HBoxContainer/Stats/HBoxContainer.get_rect().size.x


func _ready():
	render_status_values(stats)


func render_status_values(stat: Stats):
	var max_value = float(get_max_value(stat))
	set_status_value(strength, stat.strength / max_value)
	set_status_value(vitality, stat.vitality / max_value)
	set_status_value(intelligence, stat.intelligence / max_value)
	set_status_value(agility, stat.agility / max_value)


func set_status_value(stat_element: ColorRect, percentage: float) -> void:
	var rel_width = width * percentage
	stat_element.rect_min_size.x = rel_width


func get_max_value(stat: Stats) -> int:
	var max_value = 0
	for v in [stat.strength, stat.vitality, stat.intelligence, stat.agility]:
		max_value = max(v, max_value)
	return max_value
