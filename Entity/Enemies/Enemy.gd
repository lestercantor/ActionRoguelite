class_name Enemy
extends Entity

var ability: Ability = null

@export var upgrades: BaseUpgrade:
	set(value):
		upgrades = value

@onready var player: Player = get_tree().current_scene.get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Call parent function
	super()
	ability = Fireball.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("add_damage"):
		upgrades.apply_upgrade(stats)


func _on_shoot_ability_timeout() -> void:
	var direction = (player.global_position - global_position).normalized()
	ability.use_ability(self, direction)
