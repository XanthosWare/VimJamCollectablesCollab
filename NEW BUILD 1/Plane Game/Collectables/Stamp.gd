extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var point = 1

onready var animPlayer = get_node("AnimationPlayer")
onready var stampSprite = get_node("Sprite")
var rng = RandomNumberGenerator.new()
var stampSprites = [
	load("res://Plane Game/Art/Collectable Stamps/STAMP_CH_GREEN.png"),
	load("res://Plane Game/Art/Collectable Stamps/STAMP_NY_BLUE.png"),
	load("res://Plane Game/Art/Collectable Stamps/STAMP_PH_YELLOW.png"),
	load("res://Plane Game/Art/Collectable Stamps/STAMP_SF_RED.png"),
	load("res://Plane Game/Art/Collectable Stamps/STAMP_WA_PURPLE.png")
]


onready var stampEffect = get_node("Stamp Collect Effect")
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var stampNum = rng.randi_range(0, 4)
	print(stampSprites[stampNum])
	stampSprite.set("texture", stampSprites[stampNum])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func getPoints():
	return point


func _on_Area2D_area_entered(area):
	animPlayer.play("stampEffect")
