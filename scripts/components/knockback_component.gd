extends Node
class_name KnockbackComponent

@export var owner_node: CharacterBody2D  # The entity using this component
@export var knockback_duration: float = 0.2  # How long knockback lasts
@export var knockback_slowdown: float = 10.0  # How fast it slows down
@export var disable_collision_during_knockback: bool = true  # Toggle this in the inspector

var knockback_velocity := Vector2.ZERO
var knockback_timer := 0.0

var original_collision_layer
var original_collision_mask

func apply(force: float, attacker_position: Vector2):
	var knockback_direction = (owner_node.global_position - attacker_position).normalized()
	knockback_velocity = knockback_direction * force
	knockback_timer = knockback_duration

	if disable_collision_during_knockback:
		# Store original layers
		original_collision_layer = owner.collision_layer
		original_collision_mask = owner.collision_mask

		# Disable collision
		owner.set_deferred("collision_layer", 0)
		owner.set_deferred("collision_mask", 0)

	await get_tree().create_timer(knockback_duration).timeout

	if disable_collision_during_knockback:
		# Restore original layers
		owner.set_deferred("collision_layer", original_collision_layer)
		owner.set_deferred("collision_mask", original_collision_mask)

func process(delta: float):
	if knockback_timer > 0:
		owner.velocity = knockback_velocity
		knockback_velocity = lerp(knockback_velocity, Vector2.ZERO, delta * knockback_slowdown)
		knockback_timer -= delta
	else:
		owner.velocity = Vector2.ZERO
