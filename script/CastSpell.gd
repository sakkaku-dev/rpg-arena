extends State

export var spells: Array

export var player_path: NodePath
onready var player: Character = get_node(player_path)

export var attack_path: NodePath
onready var attack: State = get_node(attack_path)

var spell: Spell
var spell_index: int

func unhandled_input(event: InputEvent) -> void:
	if player.ctrl.is_attacking(event):
		spell.cast(player)

func enter(msg: Dictionary = {}) -> void:
	spell = get_spell(msg.spell)
	spell_index = msg.spell
	
	if spell == null or not _can_cast_spell():
		_state_machine.transition_to(attack)
		return
		
	spell.connect("spell_casted", self, "_after_spell")
	if not spell.prepare(player):
		spell.cast(player)

func get_spell(spell_index: int) -> Spell:
	if spell_index >= spells.size() or spell_index < 0 or spells[spell_index] == null:
		print("Spell " + str(spell_index) + " does not exist")
		return null
	
	return spells[spell_index].instance()

func _can_cast_spell() -> bool:
	return player.can_cast_skill(spell_index)

func _after_spell() -> void:
	_state_machine.transition_to(attack)
	player.casted_skill(spell_index, spell.cooldown)
