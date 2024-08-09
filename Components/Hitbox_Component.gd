class_name HitboxComponent
extends Area2D

var damage: float = 0

signal hit_hurtbox(hurtbox)

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(hurtbox: HurtboxComponent) -> void:
	if not hurtbox is HurtboxComponent: return
	
	hit_hurtbox.emit(hurtbox)
	
	hurtbox.hurt.emit(self, damage)
