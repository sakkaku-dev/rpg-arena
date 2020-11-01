extends Node

class_name State

onready var _state_machine := _get_state_machine(self)

func unhandled_input(ev: InputEvent) -> void:
	pass

func enter(msg: Dictionary = {}) -> void:
	pass

func exit() -> void:
	pass

func physics_process(delta: float):
	pass
	
func transition_state(state: State) -> void:
	_state_machine.transition_to(state)

func _get_state_machine(node: Node) -> Node:
	if node != null and not node.is_in_group("state_machine"):
		return _get_state_machine(node.get_parent())
	return node
