extends Resource

class_name magicIngredient

@export var name : String = ""
@export var number : int = 0

@export var unlock : bool = false

@export var lvl : int = 0

@export var time : float = 60
@export var money : float = 0

@export var texture : Texture2D

func upgrade()->void:
	pass
