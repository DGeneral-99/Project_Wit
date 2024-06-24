extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print(MagicPotion.numberPotion(1,1,1))
	print(MagicPotion.numberPotion(1,1,2))
	print(MagicPotion.numberPotion(1,2,2))
	print(MagicPotion.numberPotion(2,2,2))
	print(MagicPotion.numberPotion(1,1,3))
	print(MagicPotion.numberPotion(3,2,1))
	print(MagicPotion.numberPotion(2,3,2))
	print(MagicPotion.numberPotion(1,3,3))
	print(MagicPotion.numberPotion(3,2,3))
	print(MagicPotion.numberPotion(3,3,3))
	print(MagicPotion.numberPotion(1,1,4))
	print(MagicPotion.numberPotion(1,2,4))
	print(MagicPotion.numberPotion(2,2,4))
	print(MagicPotion.numberPotion(4,3,1))
	print(MagicPotion.numberPotion(4,3,2))
	print(MagicPotion.numberPotion(3,4,3))
	print(MagicPotion.numberPotion(4,4,1))
	print(MagicPotion.numberPotion(4,4,2))
	print(MagicPotion.numberPotion(4,4,3))
	print(MagicPotion.numberPotion(4,4,4))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("primero")


func _on_button_2_pressed():
	print("segundo")
