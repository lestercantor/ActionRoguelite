class_name Attack

# Strictly a data class, used for passing attack information
# Between hurtboxes and hitboxes.

# Attack types may be used for later use for effective attacks
# and resistant attacks.
static var damage: float

# Function that belongs to the class as a pseudo constructor 
# Since godot can't overload functions.
# If I make more variables inside the attack class then more pseudo constructors will be made
static func _damage(d: float = 1) -> Attack:
	var new_attack = Attack.new()
	new_attack.damage = d
	return new_attack
