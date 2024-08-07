class_name EntityMovementVelocityInput
extends Node

@export var actor: CharacterBody2D
@export var movement_stats: EntityMovementStats
var input: Vector2

func _physics_process(delta: float) -> void:
	# Get vectors depending on what input is pressed
	input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if input.length() > 0:
		actor.velocity = actor.velocity.move_toward(input.normalized() * movement_stats.max_speed, movement_stats.acceleration * delta)
	else:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, movement_stats.friction * delta)
