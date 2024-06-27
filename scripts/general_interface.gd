extends Control

class_name general_interface

@onready var potioner: PotionControl = $PotionControl
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float)-> void:
	pass


func _on_button_pressed()->void:
	print("primero")

func setPotion(potion:int)->void:
	potioner.update(potion)
	
