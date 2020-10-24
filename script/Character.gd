extends KinematicBody2D

class_name Character

signal attack

export var ctrl_path: NodePath
onready var ctrl: CharacterController = get_node(ctrl_path)

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

func _physics_process(delta):
	if ctrl.is_attacking():
		emit_signal("attack")
		
func die():
	queue_free()
