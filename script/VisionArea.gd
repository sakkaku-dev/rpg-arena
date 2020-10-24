extends Area2D

class_name VisionArea

var player_position = null

func _on_VisionArea_body_entered(body: Node2D):
	player_position = body.global_position


func _on_VisionArea_body_exited(body: Node2D):
	player_position = null
