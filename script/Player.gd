extends Character

class_name Player

export var skill_1_ui: Texture
export var skill_2_ui: Texture
export var attack_ui: Texture

export var projectile_path: NodePath
onready var projectile: ProjectileShooter = get_node(projectile_path)

func add_spell(spell: Node2D):
	get_tree().current_scene.add_child(spell)


