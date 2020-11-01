extends Control

class_name HealthUI

onready var empty_heart := $Empty
onready var full_heart := $Full

var heart_size: int

func _ready():
	heart_size = empty_heart.texture.get_size().x
	full_heart.expand = true


func set_health(health: int):
	full_heart.margin_right = heart_size * health


func set_max_health(health: int):
	empty_heart.margin_right = heart_size * health
