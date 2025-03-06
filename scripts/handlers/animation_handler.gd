extends Node

@export var animations: AnimatedSprite2D
@export var starting_animation: String = "idle"

func _ready() -> void:
	if has_animation(starting_animation):
		animations.play(starting_animation)
	else:
		print("Warning: Starting animation does not exist!")

func update_animation(state: String, direction: Vector2) -> void:
	if has_animation(state):
		animations.play(state)

	if direction.x != 0 and has_animation(state + "_h"):
		animations.play(state + "_h")
		animations.flip_h = direction.x < 0
	elif direction.y > 0 and has_animation(state + "_down"):
		animations.play(state + "_down")
	elif direction.y < 0 and has_animation(state + "_up"):
		animations.play(state + "_up")

func has_animation(animation_name: String) -> bool:
	return animations and animations.sprite_frames and animation_name in animations.sprite_frames.get_animation_names()
