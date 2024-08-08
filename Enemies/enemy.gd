extends Node2D

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtbox_component.hurt.connect(test)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func test(hitbox: HitboxComponent) -> void:
	print("damage: ", hitbox.new_damage())
	print("health: ", hurtbox_component.stats_component.health)
