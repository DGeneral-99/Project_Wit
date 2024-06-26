extends Control

@export_group("UseButton")
@onready var buttoner: Button = $ButtonShade
@export var active: bool = true
@export_group("Direccion")
@export var positionInicial : Vector2 
@export var posicionFinal : Vector2 
@export var offset: Vector2
@export var relative: bool
@export_group("Speed")
@export_range(1,100,0.1,"or_greater") var speed: float = 1

var going : bool = false 
var dir : bool = false 
var angles : Vector2 

func  _ready() -> void:
	angles = (posicionFinal -  positionInicial).normalized()
	
	if(relative):
		positionInicial = positionInicial + position
		posicionFinal = posicionFinal + position
	if(!active):
		buttoner.disabled = true
		buttoner.visible = false
	position = positionInicial
	
	
func _process(delta:float) -> void:
	if(going):
		var destiny : Vector2
		var direccion : int
		if(dir):
			direccion = 1
			destiny = posicionFinal
		else:
			direccion = -1
			destiny = positionInicial
		position = position + (angles*direccion*delta*speed)
		var outbounds: bool = angles.x == 0 and angles.y == 0
		if(angles.x > 0):
			outbounds = posicionFinal.x <= position.x or positionInicial.x >= position.x
		elif (angles.x < 0):
			outbounds = posicionFinal.x >= position.x or positionInicial.x <= position.x
		if(angles.y > 0):
			outbounds = outbounds or posicionFinal.y <= position.y or positionInicial.y >= position.y
		elif (angles.y < 0):
			outbounds = outbounds or posicionFinal.y >= position.y or positionInicial.y <= position.y
			
		if(outbounds):
			going = false
			position = destiny
			dir = !dir
			
func travel()-> void:
	going =true
			
