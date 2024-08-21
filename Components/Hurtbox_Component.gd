class_name HurtboxComponent
extends Area2D

# Make a custom signal that we have been hurt and pass through the hitbox and attack.
signal hurt(hitbox: HitboxComponent, attack: Attack)

# Signals for when the invincibility frames have started and ended
signal invincible_start
signal invincible_end

# Get the collision shape
@export var collision_shape: CollisionShape2D
# Get a timer to start invincibility
@export var invincibility_timer: Timer

func _ready() -> void:
	# Connect to the timeout signal from the timer node
	invincibility_timer.timeout.connect(timer_timeout)
	invincible_start.connect(_on_invincible_start)
	invincible_end.connect(_on_invincible_end)

var invincible: bool = false:
	# Setter for being invincible and then emit the relevant signal
	set(value):
		invincible = value
		if invincible == true:
			invincible_start.emit()
		else:
			invincible_end.emit()

# When hurtbox is hurt, this function is called to start invincibility frame
# This will be called in the connected function of the hurt signal
func start_invincibility(duration: float) -> void:
	self.invincible = true
	invincibility_timer.start(duration)

# Function connected to timeout signal from the timer node
func timer_timeout() -> void:
	self.invincible = false
	
# Called from the setter since invincible is true, the invincible_start signal is emitted
# And the collision shape is disabled
func _on_invincible_start() -> void:
	collision_shape.set_deferred("disabled", true)

# Called from the setter since invincible is false, the invincible_end signal is emitted
# And the collision shape is enabled again
func _on_invincible_end() -> void:
	collision_shape.disabled = false
