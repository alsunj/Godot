extends "res://scenes/collectable.gd"

@onready var animations =$AnimationPlayer

func collect(inventory: Inventory):
	animations.play("spin")
	super(inventory)
	await animations.animation_finished

