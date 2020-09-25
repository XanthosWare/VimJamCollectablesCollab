extends Node2D


#
export var music: AudioStream

func _ready() -> void:
	BackgroundMusic.crossfade_to(music)
	
func _on_PlayButton_pressed():
	get_tree().change_scene("res://Map/Scenes/Map.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
