extends Node
class_name  HealthComponent

@export var max_health: int
var health: float
var damageable

signal hit(attack: AttackComponent)
signal died

func _ready() -> void:
	health = max_health
	damageable = true

func apply_damage(attack: AttackComponent) -> void:
	if damageable:
		health -= attack.attack_damage
		if health <= 0:
			died.emit()
		hit.emit(attack)
		damageable = false

func reset_damageable() -> void:
	damageable = true
