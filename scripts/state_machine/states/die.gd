extends State

func enter() -> void:
	parent.velocity = Vector2.ZERO
	parent.health_component.damageable = false

func on_animation_finish():
	parent.queue_free()
