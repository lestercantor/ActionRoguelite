class_name HitboxComponent
extends Area2D

@export var damage: float

func _init() -> void:
	collision_layer = 2
	collision_mask = 0
	
func new_damage() -> float:
	return snappedf(randf_range(1.0,4.0), 0.01)
