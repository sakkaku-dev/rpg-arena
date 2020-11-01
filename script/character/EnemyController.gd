extends CharacterController

class_name EnemyController

export var wander_ctrl_path: NodePath
onready var wander_ctrl: WanderController = get_node(wander_ctrl_path)

export var vision_path: NodePath
onready var vision: VisionArea = get_node(vision_path)

func get_move_direction():
	if vision.player_position != null:
		return global_position.direction_to(vision.player_position).normalized()
	
	return wander_ctrl.get_move_direction()
	
func get_look_direction(node: Node2D):
	if vision.player_position != null:
		return get_move_direction()
	
	return wander_ctrl.get_look_direction(node)
