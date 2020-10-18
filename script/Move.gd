extends State

class_name Move

signal play_animation(name)

export var speed = 200
export var acceleration = 400
export var friction = 800

export var character_path: NodePath
onready var character: Character = get_node(character_path)

export var attack_state_path: NodePath
onready var attack_state := get_node(attack_state_path)

var velocity = Vector2.ZERO

func enter(msg = {}):
	velocity = Vector2.ZERO
	emit_signal("play_animation", "Idle")

func physics_process(delta: float):
	var dir = character.ctrl.get_move_direction()
	var accel = acceleration if dir.length() > 0.01 else friction
	velocity = velocity.move_toward(dir * speed, accel  * delta)
	
	character.move(velocity)
		
	if velocity.length() > 0.01:
		emit_signal("play_animation", "Run")
	else:
		emit_signal("play_animation", "Idle")

	velocity = character.move_and_slide(velocity)
