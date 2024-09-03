class_name EntityMovement
extends Node

@export var actor: CharacterBody2D
# Slide angle is mainly for platformers
@export var min_slide_angle: float = 0.2

func _ready() -> void:
	actor.wall_min_slide_angle = min_slide_angle
	# Motion mode is mainly for platformers 
	# And floating helps for top down perspective
	actor.motion_mode = actor.MOTION_MODE_FLOATING
	
func _physics_process(delta: float) -> void:
	actor.move_and_slide()


func dash(dash_speed: float, direction: Vector2, max_speed: float) -> void:
	actor.velocity = direction.normalized() * max_speed * dash_speed
	
