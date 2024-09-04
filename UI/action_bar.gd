extends HBoxContainer

var slots: Array
@onready var player: Player = get_tree().current_scene.get_node("Player")
func _ready() -> void:
	player.ability_change.connect(populate_button)
	
	slots = get_children()
	populate_button()

func populate_button() -> void:
	slots[0].ability = player.ability1.button_data(slots[0])
