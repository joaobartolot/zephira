extends Node
class_name StateMachine

@export
var starting_state: State

var current_state: State
signal state_changed

func init(parent: CharacterBase) -> void:
	for child: State in get_children():
		child.parent = parent

	change_state(starting_state)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
	state_changed.emit()

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)


func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func animation_finished() -> void:
	var new_state = current_state.on_animation_finish()
	if new_state:
		change_state(new_state)

func hit(attack: AttackComponent) -> void:
	var new_state = current_state.on_hit(attack)
	if new_state:
		change_state(new_state)
