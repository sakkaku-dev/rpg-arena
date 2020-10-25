extends Area2D

signal on_hit(area)

class_name HitArea

enum Type {
	PHYSICAL,
	MAGICAL
}

export var damage = 1
export var knockback_force = 1.0

export var stats_path: NodePath
onready var stats: CharacterStats = get_node(stats_path)

export var hit_effect: PackedScene
export(Type) var attack_type = Type.PHYSICAL

const knockback_multiplier = 100

func _on_HitArea_area_entered(area: HurtArea):
	var hit_node = _get_hit_node()
	if hit_node != null and area is HurtArea:
		var dir = global_position.direction_to(hit_node.global_position).normalized()
		var dmg = stats.get_physical_damage(damage) if attack_type == Type.PHYSICAL else stats.get_magical_damage(damage)
		area.damage(dmg, dir * knockback_force * knockback_multiplier)
		create_hit_effect(hit_node)
		emit_signal("on_hit", area)

func create_hit_effect(node: Node) -> void:
	if node == null or hit_effect == null:
		return
	var pos = node.global_position
	var effect = hit_effect.instance() as Node2D
	get_tree().current_scene.add_child(effect)
	effect.global_position = pos


func _get_hit_node() -> Node2D:
	var overlaps = get_overlapping_areas()
	if overlaps.size() > 0:
		return overlaps[0] as Node2D
	return null

