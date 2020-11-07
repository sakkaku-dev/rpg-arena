extends Area2D

signal inflict_damage(dmg)
signal knockback_force(knockback)
signal invincibility_timeout
signal invincibility_start

class_name HurtArea

onready var invincibility_timer := $InvincibilityTimer
onready var collision := $CollisionShape2D

func damage(dmg: int, knockback: Vector2) -> void:
	emit_signal("inflict_damage", dmg)
	emit_signal("invincibility_start")
	emit_signal("knockback_force", knockback)
	collision.set_deferred("disabled", true)
	invincibility_timer.start()
	
func _on_InvincibilityTimer_timeout():
	collision.disabled = false
	emit_signal("invincibility_timeout")
