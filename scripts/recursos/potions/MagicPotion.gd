extends Resource

class_name MagicPotion

@export var name : String = ""

@export var number: int = 0

@export var unlock : bool = false

@export var time : float = 60
@export var money : float = 100


@export var texture : Texture2D









static func numberPotion(a,b,c):
	var ingredients = [0,0,0,0]
	ingredients[a-1] += 1
	ingredients[b-1] += 1
	ingredients[c-1] += 1
	
	var number = 1 + ingredients[1] ## ingrediente 2
	number += ingredients[2]*4 -(floor(ingredients[2]/2)+floor(ingredients[2]/3)*2) ## ingrediente 3
	number += ingredients[3]*10 -(floor(ingredients[3]/2)*4+floor(ingredients[3]/3)*7) ## ingrediente 4
	
	if(ingredients[2]>0&&ingredients[3]>0):
		number += -(floor((ingredients[2]+ingredients[3])/2)+floor((ingredients[2]+ingredients[3])/3))	 ## quimica extra de profuncidad entre 3 y 4
	
	return number
	
	
