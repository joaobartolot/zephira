extends State

@export
var idle_state: State
@export
var move_state: State
@export
var die_state: State

var attack: AttackComponent

func enter() -> void:
	attack.attack_finished.connect(_on_attack_finished)

func process_physics(delta: float) -> State:
	if parent.health_component.health <= 0:
		return die_state
		
	parent.knockback_component.process(delta)
	
	parent.move_and_slide()
	return null

func on_animation_finish():
	if parent.knockback_component.knockback_timer <= 0:
		return idle_state

func _on_attack_finished() -> void:
	parent.health_component.reset_damageable()
