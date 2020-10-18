extends Node

class_name StateMachine

export var initial_state_path: NodePath
onready var state: State = get_node(initial_state_path)

func _init():
	add_to_group("state_machine")
	
func _ready():
	state.enter()

func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input(event)

func _physics_process(delta: float):
	state.physics_process(delta)

func transition_to(new_state: State, msg: Dictionary = {}) -> void:
	state.exit()
	state = new_state
	state.enter(msg)
