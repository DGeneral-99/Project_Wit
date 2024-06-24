extends Resource

class_name ListIngredients

@export var Ingredients : Array[magicIngredient] = []
@export var usingIngredients : Array[int] = [0,0,0]

func unlocked():
	var knowed_ingredients = []
	for ingredient in Ingredients:
		if(ingredient.unlock):
			knowed_ingredients.append(ingredient.number)
	return knowed_ingredients
	
func used_ingredients():
	return [Ingredients[usingIngredients[0]],Ingredients[usingIngredients[1]],Ingredients[usingIngredients[2]]]
	
func update(slot: int, newIngredient : int):
	usingIngredients[slot] = newIngredient
	return Ingredients[newIngredient].texture
	
	

