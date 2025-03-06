extends Node
class_name AttackComponent

@export var attack_damage: int = 100
@export var knockback_force = 150
@export var attack_hitbox: Area2D

var is_attacking
signal attack_finished

func reset_attack() -> void:
	is_attacking = false
	attack_hitbox.monitoring = false
	attack_finished.emit()
