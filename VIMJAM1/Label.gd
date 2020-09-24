extends Label

onready var place1 = get_node("../Place 1")
onready var place2 = get_node("../Place 2")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fuel = 100
var cur_place = "Place 1"
var fuel_consume = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("Current Place: " + cur_place +  "\n Fuel left: " + String(fuel))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func journey(dest):
	if fuel - fuel_consume >= 0 and cur_place != dest.get_name():
		fuel -= fuel_consume
		cur_place = dest.get_name()
		set_text("Current Place: " + cur_place +  "\n Fuel left: " + String(fuel))
	elif fuel == 0:
		set_text("Not enough fuel")

func _on_Place_1_pressed():
	journey(place1)

func _on_Place_2_pressed():
	journey(place2)
