extends Node2D

onready var animated_sprite = $AnimatedSprite

func _ready():
	animated_sprite.frame = 0
	animated_sprite.playing = true


func finish_effect():
	queue_free()
