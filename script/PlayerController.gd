extends CharacterController

class_name PlayerController

func is_attacking() -> bool:
	return Input.is_action_just_pressed("attack")

func get_move_direction() -> Vector2:
	return Vector2(_right_action() - _left_action(), _down_action() - _up_action())

func _left_action() -> float:
	return Input.get_action_strength("move_left")

func _right_action() -> float:
	return Input.get_action_strength("move_right")
	
func _up_action() -> float:
	return Input.get_action_strength("move_up")
	
func _down_action() -> float:
	return Input.get_action_strength("move_down")

func get_look_direction(node: Node2D) -> Vector2:
	var mouse_pos = node.get_global_mouse_position()
	return node.global_position.direction_to(mouse_pos).normalized()
