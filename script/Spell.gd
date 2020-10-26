extends Node2D

signal spell_casted

class_name Spell

enum Type {
	SHOT,
	AREA,
	TARGET,
}

export(Type) var spell_type = Type.SHOT
export var required_mana = 0

func prepare(player) -> bool:
	return true

func cast(player: Player) -> void:
	var hit_area = get_hit_area()
	if hit_area != null:
		hit_area.stats = player.stats
	emit_signal("spell_casted")

func get_hit_area() -> HitArea:
	return null
