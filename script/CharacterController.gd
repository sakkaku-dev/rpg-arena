extends Node2D

class_name CharacterController

func is_attacking() -> bool:
	return false
	
func get_move_direction() -> Vector2:
	return Vector2.ZERO
	
func get_look_direction(character: Node2D) -> Vector2:
	return get_move_direction()
