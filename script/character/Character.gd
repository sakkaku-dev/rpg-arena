extends KinematicBody2D

signal skill_1_casted(cooldown)
signal skill_2_casted(cooldown)
signal died

class_name Character

export var stats_path: NodePath
onready var stats := get_node(stats_path)

export var ctrl_path: NodePath
onready var ctrl: CharacterController = get_node(ctrl_path)

onready var body := $Body
onready var hand := $Body/Hand
onready var sprite := $Body/Sprite

var skill_casted  = []

func _ready():
	stats.health.connect("no_health", self, "die")

func move(velocity: Vector2) -> void:
	var look_dir = ctrl.get_look_direction(self)
	var scale_x = 1
	
	if look_dir.x < 0:
		scale_x = -1
		
	body.scale.x = scale_x

	var rot = hand.rotation
	var curr_vec = Vector2.RIGHT.rotated(rot)
	look_dir.x *= scale_x
	var angle = curr_vec.angle_to(look_dir)
	hand.rotation += angle

func die():
	emit_signal("died")
	queue_free()


func set_invincibility(invincible: bool):
	sprite.modulate.a8 = 150 if invincible else 255


func can_cast_skill(idx: int) -> bool:
	return not skill_casted.has(idx)


func casted_skill(idx: int, cooldown: int) -> void:
	if can_cast_skill(idx):
		skill_casted.append(idx)
		if idx == 0:
			emit_signal("skill_1_casted", cooldown)
		elif idx == 1:
			emit_signal("skill_2_casted", cooldown)


func reset_skill(idx: int) -> void:
	skill_casted.erase(idx)
