extends Control

##@export_range(0,4) var ActualIngredient : int = 0

##@export var slot: int = 0
@onready var  manager: ListIngredients = preload("res://scripts/recursos/ingredientes/Manager.tres")
@onready var scroller: ScrollerMenu = $scroll
@onready var slots: Array[SlotsIngredients] = [$scroll/slot1,$scroll/slot2,$scroll/slot3]
@onready var ingredientss: Array[IngredientsSelecter] = [$scroll/Ingredient1,$scroll/Ingredient2,$scroll/Ingredient3,$scroll/Ingredient4]

var firstPosition : Vector2
var actualSlot : int = -1
signal witchCraft(potion:int)

func _ready()->void:
	firstPosition = scroller.position
	var ingredientss = manager.used_ingredients()
	var a:int = 0
	for ingredient : magicIngredient in ingredientss:
		slots[a].updateIngredient(ingredient.texture)
		a = a+1
	

func moveAndMove() ->void:
	if(scroller.position != firstPosition):
		scroller.travelToPosition(firstPosition)
		actualSlot = -1
	else:
		scroller.travelTo(1,1)
	

func SelectSlot(slot:int)->void:
	if(scroller.position == firstPosition-Vector2(156,0)):
		actualSlot = slot
		scroller.travelTo(1,1)
	if(scroller.position == firstPosition-Vector2(156*2,0)):
		if(actualSlot == slot):
			scroller.travelTo(1,-1)
			actualSlot = -1
		else:
			actualSlot = slot

func SelectedIngredient(ingredient:int)->void:
	slots[actualSlot].updateIngredient(manager.update(actualSlot,ingredient))
	emit_signal("witchCraft",manager.numberPotion())
	

func updatingUnlock()->void:
	for ingredient : IngredientsSelecter in ingredientss:
		ingredient.update()
	pass
