class_name HurtboxComponent
extends Area2D

@export var stats_component: StatsComponent

signal hurt(hitbox: HitboxComponent, damage: float)
