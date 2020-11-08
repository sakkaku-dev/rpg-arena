extends CanvasLayer

signal select_character(idx)

var active_character = 0

func _ready():
	show_character(active_character)
	
func hide_all():
	for child in get_children():
		child.hide()

func show_character(idx: int) -> void:
	hide_all()
	get_child(idx).show()

func _unhandled_input(event):
	if event.is_action_pressed("ui_left"):
		active_character = max(0, active_character - 1)
		show_character(active_character)
	elif event.is_action_pressed("ui_right"):
		active_character = min(get_child_count() - 1, active_character + 1)
		show_character(active_character)
	elif event.is_action_pressed("ui_select"):
		emit_signal("select_character", active_character)
