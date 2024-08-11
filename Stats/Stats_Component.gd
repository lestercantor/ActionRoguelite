class_name StatsComponent
extends Resource

# Signals to connect to owner of component 
signal no_health
signal health_changed

@export var damage_multiplier: float = 1.0
@export var damage_addition: float = 0.0
@export var max_health: float = 1000.0
@export var health: float = 100.0:
	set(value):
		# Clamp health so if there is any healing it won't go over max
		# And won't deal negative damage
		health = clampf(value, 0, max_health)
		
		# Signal that the health has changed so we can perform other functions
		# Such as UI changes
		health_changed.emit()
		
		# Signal that there is no health so we can queue_free()
		if health <= 0: no_health.emit()

