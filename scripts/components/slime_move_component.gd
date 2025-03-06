extends MoveComponent

@export var parent: CharacterBase
@export var patrol_radius: float = 500.0  # How far the enemy can move from its starting point
@export var direction_change_interval: float = 2.0  # Time before picking a new direction

var home_position: Vector2  # The initial spawn position
var current_direction: Vector2 = Vector2.ZERO

func _ready():
	home_position = parent.global_position  # Set patrol center
	_change_direction()  # Start movement

func _process(_delta):
	if parent.global_position.distance_to(home_position) > patrol_radius:
		_return_to_patrol_area()

func get_movement_direction() -> Vector2:
	return current_direction

func _change_direction():
	# Pick a new random direction
	current_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	
	# Call this function again after `direction_change_interval`
	await get_tree().create_timer(direction_change_interval).timeout
	_change_direction()

func _return_to_patrol_area():
	# Move enemy back toward its patrol center if it moves too far
	current_direction = (home_position - parent.global_position).normalized()
