extends Control

class_name PotionControl


@onready var  manager: ListPotion = preload("res://scripts/recursos/potions/Recet.tres")
@onready var potion: Sprite2D = $Potion

func update(potion:int)->void:
	self.potion.texture = manager.getPotion(potion);
