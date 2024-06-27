extends Control

class_name SlotsIngredients

@export_range(0,4) var slot :int = 1
@onready var buttoner: Button = $ButtonShade
@onready var ingredientAvailable: Sprite2D = $ingredientSprite


signal Used(slotOut:int)

func _ready()-> void:
	##update()
	pass
	
func  updateIngredient(texture:Texture2D)->void:
	ingredientAvailable.texture = texture
	"""if(manager.isUnlock(ingredient)):
		##buttoner.texture_normal = manager.getIngredient(ingredient).texture
		##buttoner.icon = manager.getIngredient(ingredient).texture
		buttoner.disabled = false
		pass
	else:"""

func Selected() -> void:
	emit_signal("Used", slot)
	print(slot)
