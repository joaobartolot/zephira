extends ProgressBar
class_name HealthBar

@export var health_component: HealthComponent

func _ready() -> void:
	call_deferred("update_bar")
	health_component.hit.connect(_on_hit)
	
func update_bar():
	value = health_component.health / health_component.max_health * 100

func _on_hit(_attack) -> void:
	update_bar()
