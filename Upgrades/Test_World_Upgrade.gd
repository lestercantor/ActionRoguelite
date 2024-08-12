extends Area2D

@export var upgrade: BaseUpgrade:
	set(value):
		upgrade = value
		

func _ready() -> void:
	body_entered.connect(player_entered)
	
func player_entered(player: Player) -> void:
	upgrade.apply_upgrade(player.stats)
	queue_free()
