extends State

signal attack

class_name Attack

export var cast_spell_path: NodePath
onready var cast_spell: State = get_node(cast_spell_path)

export var player_path: NodePath
onready var player: Character = get_node(player_path)

func unhandled_input(event: InputEvent) -> void:
	if player.ctrl.is_attacking(event):
		emit_signal("attack")
	elif player.ctrl.is_spell_1(event):
		_state_machine.transition_to(cast_spell, {"spell": 0})
	elif player.ctrl.is_spell_2(event):
		_state_machine.transition_to(cast_spell, {"spell": 1})
