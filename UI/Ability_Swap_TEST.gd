extends Button

func _on_pressed() -> void:
	GlobalSignal.change_ability.emit(Fireball.new())
