extends Resource

class_name ListIngredients

@export var Ingredients : Array[magicIngredient] = []
@export var usingIngredients : Array[int] = [0,0,0]

func unlocked()->Array[int]:
	var knowed_ingredients :Array[int] = []
	for ingredient: magicIngredient in Ingredients:
		if(ingredient.unlock):
			knowed_ingredients.append(ingredient.number)
	return knowed_ingredients
	
func used_ingredients() -> Array[magicIngredient]:
	return [Ingredients[usingIngredients[0]],Ingredients[usingIngredients[1]],Ingredients[usingIngredients[2]]]
	
func update(slot: int, newIngredient : int) -> Texture2D:
	usingIngredients[slot] = newIngredient
	return Ingredients[newIngredient].texture
	
func numberPotion() -> int:
	var ingredients : Array[float] = [0,0,0,0]
	ingredients[usingIngredients[0]-1] += 1
	ingredients[usingIngredients[1]-1] += 1
	ingredients[usingIngredients[2]-1] += 1
	
	var potion: float = 1 + ingredients[1] ## ingrediente 2
	potion += ingredients[2]*4 -(floor(ingredients[2]/2)+floor(ingredients[2]/3)*2) ## ingrediente 3
	potion += ingredients[3]*10 -(floor(ingredients[3]/2)*4+floor(ingredients[3]/3)*7) ## ingrediente 4
	
	if(ingredients[2]>0&&ingredients[3]>0):
		potion += -(floor((ingredients[2]+ingredients[3])/2)+floor((ingredients[2]+ingredients[3])/3))	 ## quimica extra de profuncidad entre 3 y 4
	
	return int(potion)
	
func isUnlock(ingredient:int)->bool:
	return Ingredients[ingredient].unlock
func getIngredient(ingredient:int)->magicIngredient:
	return Ingredients[ingredient]
	
