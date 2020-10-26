extends State

signal attack

class_name Attack

export var cast_spell_path: NodePath
onready var cast_spell: State = get_node(cast_spell_path)

func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		emit_signal("attack")
	elif event.is_action_pressed("spell_1"):
		_state_machine.transition_to(cast_spell, {"spell": 0})
	elif event.is_action_pressed("spell_2"):
		_state_machine.transition_to(cast_spell, {"spell": 1})
