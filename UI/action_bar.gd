extends HBoxContainer

var slots: Array

func _ready() -> void:
	slots = get_children()
	
	slots[0].ability = Fireball.new().button_data(slots[0])
