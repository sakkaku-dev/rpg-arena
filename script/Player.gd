extends Character

class_name Player

export var skill_1_ui: Texture
export var skill_2_ui: Texture
export var attack_ui: Texture

func add_spell(spell: Node2D):
	get_tree().current_scene.add_child(spell)


