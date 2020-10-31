extends Node2D

class_name PlayerSpawner

export var characters: Array

const PlayerCamera = preload("res://scene/PlayerCamera.tscn")
const PlayerUI = preload("res://scene/PlayerUI.tscn")

func spawn_player(idx: int) -> void:
	if idx < 0 or idx >= characters.size():
		return
	
	var character_scene = characters[idx] as PackedScene
	var new_character = character_scene.instance() as Player
	
	var ctrl = PlayerController.new()
	new_character.add_child(ctrl)
	new_character.ctrl_path = new_character.get_path_to(ctrl)
	
	new_character.add_child(PlayerCamera.instance())
	
	var player_ui = PlayerUI.instance()
	new_character.add_child(player_ui)

	add_child(new_character)
	player_ui.connect_stats(new_character.stats)
	
	if new_character.skill_1_ui != null:
		player_ui.set_first_skill(new_character.skill_1_ui)
		new_character.connect("skill_1_casted", player_ui.skill_1, "start_cooldown")
		player_ui.skill_1.connect("cooldown_ended", new_character, "reset_skill", [0])
	
	if new_character.skill_2_ui != null:
		player_ui.set_second_skill(new_character.skill_2_ui)
		new_character.connect("skill_2_casted", player_ui.skill_2, "start_cooldown")
		player_ui.skill_2.connect("cooldown_ended", new_character, "reset_skill", [1])
		
	if new_character.attack_ui != null:
		player_ui.set_attack(new_character.attack_ui)
