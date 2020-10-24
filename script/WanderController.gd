extends CharacterController

class_name WanderController

export var wander_range = 128
export var wander_target_range = 4

onready var start_position = global_position
onready var target_position = global_position
onready var timer = $Timer

var look_dir = Vector2.RIGHT

func update_target_position():
	var target_vector = Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))
	target_position = start_position + target_vector
	if randf() >= 0.5:
		target_position = global_position
	else:
		look_dir = global_position.direction_to(target_position).normalized()

func start_new_wander():
	update_target_position()
	timer.start(rand_range(1, 3))

func get_move_direction() -> Vector2:
	return global_position.direction_to(target_position).normalized()

func get_look_direction(node: Node2D) -> Vector2:
	return look_dir

func _physics_process(delta: float) -> void:
	if global_position.distance_to(target_position) <= wander_target_range:
		target_position = global_position
