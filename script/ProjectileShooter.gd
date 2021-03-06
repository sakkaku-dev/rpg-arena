extends Node2D

class_name ProjectileShooter

signal shot_projectile(cooldown)

export var fire_rate = 1.0

export var spawn_pos_path: NodePath
onready var spawn_pos: Position2D = get_node(spawn_pos_path)

export var projectile: PackedScene

export var stats_path: NodePath
onready var stats: CharacterStats = get_node(stats_path)

var shot = false
var time = 0

func shoot():
	if shot: return
	
	var proj = projectile.instance() as Projectile
	get_tree().current_scene.add_child(proj)
	proj.global_rotation = global_rotation
	proj.global_position = spawn_pos.global_position
	proj.hit_area.stats = stats
	shot = true
	emit_signal("shot_projectile", fire_rate)

func reset_shot() -> void:
	shot = false
