extends Spell

class_name AreaSpell

export var area_size = 1
export var duration = 1

var spell_area = preload("res://scene/AreaSpellSelect.tscn")
var area: AreaSpellSelect

onready var hit_area = $HitArea

var time = 0

func _ready():
	spell_type = Spell.Type.AREA

func prepare(player: Player) -> bool:
	area = spell_area.instance()
	player.get_tree().current_scene.add_child(area)
	area.global_position = player.global_position
	area.set_size(area_size)
	return true

func get_hit_area() -> HitArea:
	return hit_area

func cast(player: Player) -> void:
	player.add_spell(self)
	global_position = area.global_position
	area.queue_free()
	.cast(player)

func _physics_process(delta):
	time += delta
	if time >= duration:
		queue_free()
