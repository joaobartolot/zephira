extends Node
class_name MoveComponent

@export
var speed: float = 100

func get_movement_direction() -> Vector2:
	return Vector2(0, 0)
