extends TextureButton
class_name UpgradeButton

@export var upgrade: BaseUpgrade:
	set(value):
		upgrade = value

func _on_pressed() -> void:
	GlobalSignal.upgrade_stat.emit(upgrade)
