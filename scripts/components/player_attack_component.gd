extends AttackComponent

@export
var player: CharacterBase

func _ready() -> void:
	is_attacking = false
	attack_hitbox.body_entered.connect(_on_attack_hitbox_body_entered)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("attack"):
		is_attacking = true
		attack_hitbox.monitoring = true

func _on_attack_hitbox_body_entered(receiver: CharacterBase) -> void:
	if receiver.is_in_group("enemy") and is_attacking:
		receiver.health_component.apply_damage(self)
		receiver.knockback_component.apply(self.knockback_force, player.global_position)
