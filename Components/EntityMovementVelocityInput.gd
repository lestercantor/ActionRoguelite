class_name EntityMovementVelocityInput
extends Node

@export var actor: Entity
var movement_input: Vector2

func _physics_process(delta: float) -> void:
	# Get vectors depending on what input is pressed
	movement_input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if movement_input.length() > 0:
		actor.velocity = actor.velocity.move_toward(movement_input.normalized() * owner.stats.movement_stats.max_speed, 
		actor.stats.movement_stats.acceleration * delta)
	else:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, actor.stats.movement_stats.friction * delta)
