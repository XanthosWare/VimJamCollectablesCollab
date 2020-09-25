extends Node2D


#
export var music: AudioStream

func _ready() -> void:
	Global.current_place = ""
	Global.stamps_collected = 0
	BackgroundMusic.crossfade_to(music)
	

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_Return_to_Menu_pressed():
	get_tree().change_scene("res://Menu/Scenes/Menu.tscn")
