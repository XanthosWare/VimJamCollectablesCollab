extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var background = get_node("Background")
var rng = RandomNumberGenerator.new()
var backgrounds = [
	load("res://Plane Game/Art/Background Sky/sky1.png"),
	load("res://Plane Game/Art/Background Sky/sky2.png"),
	load("res://Plane Game/Art/Background Sky/Sky3.png"),
	load("res://Plane Game/Art/Background Sky/sky4.png")
]
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var backgroundNumber = rng.randi_range(0, 3)
	background.set("texture", backgrounds[backgroundNumber])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
		get_tree().change_scene("res://Map/Scenes/Map.tscn")

