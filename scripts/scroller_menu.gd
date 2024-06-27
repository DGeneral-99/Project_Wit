extends Control

class_name ScrollerMenu
@export_group("UseButton")
@onready var buttoner: Button = $ButtonShade
@export var active: bool = true
@export_group("Background")
@export var visibleBackground: bool = true
@onready var background: Sprite2D = $background
@export_group("Direccion")
@export var positions : Array[Vector2]
@export var offset: Vector2
@export var relative: bool
@export_group("Speed")
@export_range(1,100,0.1,"or_greater") var speed: float = 1

var beginning : Vector2
var destiny : Vector2
var going : bool = false 
var dir : bool = true 
var angles : Vector2 


func  _ready() -> void:
	background.visible = visibleBackground
	if(!active):
		buttoner.disabled = true
		buttoner.visible = false
	
	if(relative):
		position += positions[0] -offset
	else:
		position = positions[0] -offset
	beginning = position
	
	
func _process(delta:float) -> void:
	if(going):
		if(positions.size()<2):
			return
		
		position = position + (angles*delta*speed)
		var outbounds: bool = angles.x == 0 and angles.y == 0
		if(angles.x > 0):
			outbounds = destiny.x <= position.x 
		elif (angles.x < 0):
			outbounds = destiny.x >= position.x 
		if(angles.y > 0):
			outbounds = outbounds or destiny.y <= position.y
		elif (angles.y < 0):
			outbounds = outbounds or destiny.y >= position.y
			
		if(outbounds):
			going = false
			position = destiny
			beginning = destiny
			dir = !dir
		
func travel()-> void:
	if(going):
		return
	if(positions.size()<2):
		return
	
	if(relative):
		destiny = position 
		if(dir):
			destiny += positions[1]
		else:
			destiny += positions[1]*-1 
	else:
		if(dir):
			destiny = positions[1] - offset
		else:
			destiny = positions[0]  - offset
	angles = (destiny -  beginning).normalized()
	going =true
	

func travelTo(destinys:int,direccion:int)-> void:
	if(going):
		return
	if(positions.size()<2):
		return
	
	if(relative):
		self.destiny = position + positions[destinys]*direccion
	else:
		self.destiny  = positions[destinys]*direccion  - offset
	angles = (self.destiny  -  beginning).normalized()
	going =true
	
func travelToPosition(destinys:Vector2)-> void:
	if(going):
		return
	if(positions.size()<2):
		return
	self.destiny  = destinys - offset
	angles = (self.destiny  -  beginning).normalized()
	going =true
