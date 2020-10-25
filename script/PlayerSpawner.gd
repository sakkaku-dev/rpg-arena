extends Node2D

class_name PlayerSpawner

export var characters: Array

const PlayerCamera = preload("res://scene/PlayerCamera.tscn")
const PlayerUI = preload("res://scene/PlayerUI.tscn")

func spawn_player(idx: int) -> void:
	if idx < 0 or idx >= characters.size():
		return
	
	var character_scene = characters[idx] as PackedScene
	var new_character = character_scene.instance()
	
	var ctrl = PlayerController.new()
	new_character.add_child(ctrl)
	new_character.ctrl_path = new_character.get_path_to(ctrl)
	
	new_character.add_child(PlayerCamera.instance())
	
	var player_ui = PlayerUI.instance()
	new_character.add_child(player_ui)

	add_child(new_character)
	player_ui.connect_stats(new_character.stats)
