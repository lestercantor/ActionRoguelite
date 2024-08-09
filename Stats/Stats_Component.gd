class_name StatsComponent
extends Resource

signal no_health
signal health_changed

@export var damage_multiplier: float = 1.0
@export var max_health: float = 1000.0
@export var health: float = 100.0:
	set(value):
		health = clampf(value, 0, max_health)
		health_changed.emit()
		
		if health <= 0: no_health.emit()

