extends Node
class_name State

var parent: CharacterBase

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null
	

func process_physics(_delta: float) -> State:
	return null

func on_animation_finish() -> State:
	return null

func on_hit(attack: AttackComponent) -> State:
	return null

func get_velocity() -> Vector2:
	return parent.move_component.get_movement_direction() * parent.move_component.speed
