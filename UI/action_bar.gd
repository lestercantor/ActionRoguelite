extends HBoxContainer

var slots: Array
@onready var player: Player = get_tree().current_scene.get_node("Player")
func _ready() -> void:
	slots = get_children()
	
	slots[0].ability = player.ability1.button_data(slots[0])
