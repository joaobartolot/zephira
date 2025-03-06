extends MoveComponent

func get_movement_direction() -> Vector2:
	return Vector2(
			Input.get_axis('move_left', 'move_right'), 
			Input.get_axis('move_up', 'move_down')
		).normalized()
