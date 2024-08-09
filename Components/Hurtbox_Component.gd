class_name HurtboxComponent
extends Area2D

# Make a custom signal that we have been hurt and pass through the hitbox and attack.
signal hurt(hitbox: HitboxComponent, attack: Attack)
