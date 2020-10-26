extends State

export var spells: Array

export var player_path: NodePath
onready var player: Character = get_node(player_path)

#export var player_stats_path: NodePath
#onready var player_stats: PlayerStat = get_node(player_stats_path)

export var attack_path: NodePath
onready var attack: State = get_node(attack_path)

var spell: Spell

func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		spell.cast(player)

func enter(msg: Dictionary = {}) -> void:
	spell = get_spell(msg.spell)
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
	return true
#	return spell != null and player_stats.mana.value >= spell.required_mana

func _after_spell() -> void:
#	player_stats.consume_mana(spell.required_mana)
	_state_machine.transition_to(attack)
