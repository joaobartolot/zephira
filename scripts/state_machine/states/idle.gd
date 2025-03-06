extends State

@export var move_state: State
@export var attack_state: State
@export var hurt_state: State
@export var die_state: State

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO

func process_frame(_delta) -> State:
	if(parent.health_component.health <= 0):
		return die_state
	return null

func process_physics(_delta) -> State:
	# 🔹 This allows holding the attack button to keep attacking
	if parent.attack_component.is_attacking:
		return attack_state

	if get_velocity() != Vector2.ZERO:
		return move_state
	
	return null

func on_hit(attack: AttackComponent) -> State:
	if !parent.health_component.damageable:
		return null
		
	hurt_state.attack = attack
	return hurt_state
