extends State

@export
var idle_state: State
@export
var move_state: State
@export
var die_state: State

func process_frame(_delta) -> State:
	if(parent.health_component.health <= 0):
		return die_state
	return null

func on_animation_finish() -> State:
	parent.attack_component.reset_attack()
	
	if get_velocity():
		return move_state

	return idle_state
