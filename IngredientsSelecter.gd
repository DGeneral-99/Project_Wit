extends Control

@onready var  manager: ListIngredients = preload("res://scripts/recursos/ingredientes/Manager.tres")
@export_range(0,4) var ingredient :int = 1
@onready var buttoner: Button = $ButtonShade
@onready var ingredientAvailable: Sprite2D = $ingredientSprite


signal selected(ingredientOut:int)

func _ready()-> void:
	##buttoner.flat = true
	if(manager.isUnlock(ingredient)):
		##buttoner.texture_normal = manager.getIngredient(ingredient).texture
		##buttoner.icon = manager.getIngredient(ingredient).texture
		ingredientAvailable.texture = manager.getIngredient(ingredient).texture
		pass
	else:
		buttoner.disabled = true
		##buttoner.visible = false
	
func Selected() -> void:
	emit_signal("selected", ingredient)
	print(ingredient)
	
	

