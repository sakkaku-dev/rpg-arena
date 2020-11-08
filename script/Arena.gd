extends Node2D

class_name Arena

onready var player_spawner = $Characters/PlayerSpawner
onready var enemy_spawner = $Characters/EnemySpawner
onready var gameover_ui = $CanvasLayer/GameOver

var gameover = false

func _ready():
	randomize()
	spawn(Game.selected_character)

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://scene/Game.tscn")


func spawn(idx: int) -> void:
	player_spawner.spawn_player(idx)
	enemy_spawner.spawn_enemies(Rect2(enemy_spawner.global_position, Vector2(400, 250)))


func scene_reload(body):
	get_tree().reload_current_scene()


func _on_PlayerSpawner_died():
	gameover = true
	gameover_ui.show()
