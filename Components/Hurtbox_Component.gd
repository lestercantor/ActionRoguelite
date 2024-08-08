class_name HurtboxComponent
extends Area2D

@export var stats_component: StatsComponent

signal hurt(hitbox)

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(hitbox: HitboxComponent) -> void:
	if not hitbox is HitboxComponent: return
	stats_component.health -= hitbox.new_damage()
	hurt.emit(hitbox)
