class_name EntityMovement
extends Node

@export var actor: CharacterBody2D
# Slide angle is mainly for platformers
@export var min_slide_angle: float = 0.2
@export var dash_timer: Timer

var can_dash: bool = true
var dash_cooldown: float = 1.5

func _ready() -> void:
	dash_timer.timeout.connect(reset_dash)
	actor.wall_min_slide_angle = min_slide_angle
	# Motion mode is mainly for platformers 
	# And floating helps for top down perspective
	actor.motion_mode = actor.MOTION_MODE_FLOATING
	
func _physics_process(_delta: float) -> void:
	actor.move_and_slide()


func dash(dash_speed: float, direction: Vector2, max_speed: float) -> void:
	if can_dash:
		actor.velocity = direction.normalized() * max_speed * dash_speed
		can_dash = false
		dash_timer.start(dash_cooldown)
	
func reset_dash() -> void:
	can_dash = true
