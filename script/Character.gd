extends KinematicBody2D

class_name Character

export var move_anim_path: NodePath
onready var move_anim: AnimationPlayer = get_node(move_anim_path)

export var attack_anim_path: NodePath
onready var attack_anim: AnimationPlayer = get_node(attack_anim_path)

export var ctrl_path: NodePath
onready var ctrl: PlayerController = get_node(ctrl_path)

onready var body := $Body
onready var hand := $Body/Hand

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

func attack() -> void:
	attack_anim.play("Attack")

func _physics_process(delta):
	if ctrl.attack():
		attack()
