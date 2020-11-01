extends Node2D

class_name Arena

export var player_idx = 0

onready var player_spawner = $Characters/PlayerSpawner
onready var enemy_spawner = $Characters/EnemySpawner

func _ready():
	randomize()
	player_spawner.spawn_player(player_idx)
	enemy_spawner.spawn_enemies(Rect2(enemy_spawner.global_position, Vector2(400, 250)))


func scene_reload(body):
	get_tree().reload_current_scene()
