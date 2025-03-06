extends CharacterBase

@onready var slime: CharacterBody2D = $"."
@onready var knockback_component: KnockbackComponent = $Components/KnockbackComponent

@onready var health_bar: ProgressBar = $HealthBar
@onready var slime_animation: AnimatedSprite2D = $SlimeAnimation
@onready var animation_handler: Node = $AnimationHandler

@export var speed: float = 50
@export var damage: int = 5

func _on_state_machine_state_changed() -> void:
	animation_handler.update_animation(state_machine.current_state.name, last_direction)


func _on_move_direction_changed() -> void:
	animation_handler.update_animation(state_machine.current_state.name, velocity.normalized())
