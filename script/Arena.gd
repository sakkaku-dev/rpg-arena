extends Node2D

class_name Arena

export var player_idx = 0

onready var player_spawner = $Characters/PlayerSpawner

func _ready():
	player_spawner.spawn_player(player_idx)
