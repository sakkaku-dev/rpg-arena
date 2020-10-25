extends Area2D

class_name HitArea

export var damage = 1
export var knockback_force = 1

export var stats_path: NodePath
onready var stats: CharacterStats = get_node(stats_path)

const knockback_multiplier = 100

func _on_HitArea_area_entered(area: HurtArea):
	var overlap = get_overlapping_areas()
	if overlap.size() > 0 and area is HurtArea:
		var overlap_area = overlap[0] as Node2D
		var dir = global_position.direction_to(overlap_area.global_position).normalized()
		var dmg = stats.get_physical_damage(damage)
		area.damage(dmg, dir * knockback_force * knockback_multiplier)
