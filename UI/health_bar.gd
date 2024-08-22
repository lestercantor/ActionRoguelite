extends ProgressBar

var parent: StatsComponent

func _ready() -> void:
	parent = get_owner().stats
	parent.health_changed.connect(update)
	
	max_value = parent.max_health
	update()
	
func update() -> void:
	if parent.health == parent.max_health:
		self.visible = false
		return
	
	self.visible = true
	self.value = parent.health
