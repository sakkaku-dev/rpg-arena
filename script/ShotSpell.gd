extends Spell

class_name ShotSpell

export var speed = 300

onready var hit_area = $HitArea

func _ready():
	spell_type = Spell.Type.SHOT

func _physics_process(delta: float) -> void:
	var dir = Vector2.RIGHT.rotated(global_transform.get_rotation())
	translate(dir * speed * delta)


func on_hit(body):
	if not body is HurtArea:
		hit_area.create_hit_effect(self)
	queue_free()


func prepare(player: Player) -> bool:
	return false


func get_hit_area() -> HitArea:
	return hit_area


func cast(player: Player):
	var dir = player.global_position.direction_to(player.get_global_mouse_position())
	rotate(Vector2.RIGHT.angle_to(dir))
	player.add_spell(self)
	global_position = player.global_position
	.cast(player)
