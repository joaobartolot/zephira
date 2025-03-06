extends CharacterBase
class_name Player

@onready var animation_handler: Node = $AnimationHandler

@export var attack_damage: int = 100
const KNOCKBACK_FORCE = 150
const SPEED = 100.0

func _ready():
	super()

func _on_state_machine_state_changed() -> void:
	animation_handler.update_animation(state_machine.current_state.name, last_direction)


func _on_move_direction_changed() -> void:
	animation_handler.update_animation(state_machine.current_state.name, velocity.normalized())
