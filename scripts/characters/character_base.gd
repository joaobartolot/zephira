extends CharacterBody2D
class_name CharacterBase

@export
var animations: AnimatedSprite2D

@export
var hitbox: CollisionShape2D

@export
var attack_hitbox: Area2D

@export
var state_machine: StateMachine

@export
var move_component: MoveComponent

@export
var health_component: HealthComponent

@export
var attack_component: AttackComponent

var last_direction := Vector2(0, 1)
var is_attacking := false

func _ready():
	state_machine.init(self)
	attack_hitbox.monitoring = false
	animations.animation_finished.connect(_on_animation_finished)
	health_component.hit.connect(_on_hit)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_animation_finished() -> void:
	state_machine.animation_finished()

func _on_hit(attack: AttackComponent) -> void:
	state_machine.hit(attack)
