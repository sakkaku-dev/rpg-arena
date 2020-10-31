extends CanvasLayer

onready var health := $TopContainer/HealthUI
onready var attack := $BottomLeft/Equipment/Attack
onready var skill_1: SkillUI = $BottomRight/HBoxContainer/Skill1
onready var skill_2: SkillUI = $BottomRight/HBoxContainer/Skill2

func connect_stats(stats: CharacterStats):
	health.set_health(stats.health.health)
	health.set_max_health(stats.health.max_health)
	stats.health.connect("health_changed", health, "set_health")
	stats.health.connect("max_health_changed", health, "set_max_health")
	
	
func set_attack(ui: Texture) -> void:
	attack.set_texture(ui)


func set_first_skill(skill: Texture) -> void:
	skill_1.set_texture(skill)
	
	
func set_second_skill(skill: Texture) -> void:
	skill_2.set_texture(skill)
