extends Node2D

onready var arena = $Arena
onready var character_select = $CharacterSelect

var selected_character = 0

func _on_CharacterSelect_select_character(idx: int):
	Game.selected_character = idx
	get_tree().change_scene("res://scene/Arena.tscn")
