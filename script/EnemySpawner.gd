extends Node2D

signal enemies_killed

class_name EnemySpawner

export var enemies: Array
export var enemy_count = 1

var enemies_spawned = true

func spawn_enemies(spawn_area: Rect2) -> void:
	var enemy_index = randi() % enemies.size()
	var enemy_scene = enemies[enemy_index] as PackedScene
	
	var size_x = int(floor(spawn_area.size.x))
	var size_y = int(floor(spawn_area.size.y))
	
	for i in range(0, enemy_count):
		var rand_x = randi() % size_x
		var rand_y = randi() % size_y
		
		var enemy = enemy_scene.instance()
		add_child(enemy)
		enemy.global_position = spawn_area.position + Vector2(rand_x, rand_y)
	
	enemies_spawned = true
	
func _process(delta):
	if get_child_count() == 0 and enemies_spawned:
		emit_signal("enemies_killed")
		enemies_spawned = false
