extends Button

var player: Player
func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")
	pressed.connect(test)
	
func test() -> void:
	player.ability1 = Fireball.new()
