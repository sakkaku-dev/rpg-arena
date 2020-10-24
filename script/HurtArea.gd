extends Area2D

signal inflict_damage(dmg)
signal knockback_force(knockback)

class_name HurtArea

onready var invincibility_timer := $InvincibilityTimer
onready var collision := $CollisionShape2D

func damage(dmg: int, knockback: Vector2) -> void:
	emit_signal("inflict_damage", dmg)
	emit_signal("knockback_force", knockback)
	collision.set_deferred("disabled", true)
	invincibility_timer.start()
	
func _on_InvincibilityTimer_timeout():
	collision.disabled = false
