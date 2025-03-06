extends State

@export
var idle_state: State
@export
var attack_state: State
@export
var hurt_state: State
@export
var die_state: State

signal direction_changed

func enter() -> void:
	pass

func process_frame(_delta) -> State:
	if(parent.health_component.health <= 0):
		return die_state
	return null

func process_physics(_delta: float) -> State:
	if parent.attack_component.is_attacking:
		return attack_state
	
	parent.velocity = get_velocity()

	# If no movement, return to idle state
	if parent.velocity == Vector2.ZERO:
		return idle_state
	# Store last direction for attack animations
	if parent.velocity.normalized() != parent.last_direction:
		parent.last_direction = parent.velocity.normalized()
		direction_changed.emit()

	parent.attack_hitbox.rotation = parent.last_direction.angle() - (PI / 2)

	parent.move_and_slide()
	
	return null

func on_hit(attack: AttackComponent) -> State:
	if !parent.health_component.damageable:
		return null
	
	hurt_state.attack = attack
	return hurt_state
