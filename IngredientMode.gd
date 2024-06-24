extends Control

@export_range(0,4) var ActualIngredient : int = 0

@export var slot: int = 0
@onready var  manager: ListIngredients = preload("res://scripts/recursos/ingredientes/Manager.tres")
@onready var sprite: Sprite2D = $ingredient

func _ready():
	updating()
	

func updating():
	sprite.texture = manager.update(slot,ActualIngredient)
	pass # Replace with function body.
