extends Control

export var music: AudioStream

func _ready() -> void:
	if Global.stamps_collected >= Global.GOAL:
		get_tree().change_scene("res://Menu/Scenes/WinScreen.tscn")	
	else:
		BackgroundMusic.crossfade_to(music)

func _on_Waypoint_pressed():
	get_tree().change_scene("res://Plane Game/Scenes/Journey.tscn")


func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Menu/Scenes/Menu.tscn")	
