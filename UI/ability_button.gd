extends TextureButton
class_name AbilityButton

@onready var cooldown: Label = $Cooldown
@onready var key_press: Label = $KeyPress
@onready var timer: Timer = $Timer

var ability: Ability = null

var change_key = "":
	set(value):
		change_key = value
		key_press.text = value
 
		shortcut = Shortcut.new()
		var input_key = InputEventKey.new()
		input_key.keycode = value.unicode_at(0)
 
		shortcut.events = [input_key]

func _ready() -> void:
	change_key = InputMap.action_get_events("skill 1")[0].as_text().trim_suffix(" (Physical)")
	set_process(false)
	
func _process(delta: float) -> void:
	if timer.time_left >= 3:
		cooldown.text = "%2.0f" % floorf(timer.time_left)
	else:
		cooldown.text = "%3.1f" % (timer.time_left)

func _on_pressed() -> void:
	if ability == null: 
		print("ability is null")
		return
	
	var direction: Vector2 = (get_global_mouse_position() - owner.position).normalized()
	
	ability.use_ability(owner, direction)
	timer.start()
	disabled = true
	set_process(true)
	print(ability.name)

func _on_timer_timeout() -> void:
	cooldown.text = ""
	set_process(false)
	disabled = false
