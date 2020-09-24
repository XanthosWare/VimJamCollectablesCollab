extends Control


func _ready():
	pass 

func _on_Waypoint_pressed():
	get_tree().change_scene("res://Plane Game/Scenes/Journey.tscn")


func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Menu/Scenes/Menu.tscn")	
