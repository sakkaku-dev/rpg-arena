extends Area2D

class_name HitArea

export var damage = 1
export var knockback_force = 1

func _on_HitArea_area_entered(area: HurtArea):
	var overlap = get_overlapping_areas()
	if overlap.size() > 0:
		var overlap_area = overlap[0] as Node2D
		var dir = global_position.direction_to(overlap_area.global_position).normalized()
		area.damage(damage, dir * knockback_force)
