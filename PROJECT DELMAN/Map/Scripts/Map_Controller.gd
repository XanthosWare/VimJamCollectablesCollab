extends Label

onready var NYC = get_node("../NYC/Waypoint")
onready var CHI = get_node("../CHI/Waypoint")
onready var Phila = get_node("../Phila/Waypoint")
onready var SF = get_node("../SF/Waypoint")
onready var DC = get_node("../DC/Waypoint")
onready var Green_WP = load("res://StyleBoxes/Green_Waypoint_StyleBox.tres")
onready var Red_WP = load("res://StyleBoxes/Red_Waypoint_StyleBox.tres")

var NYC_flights = ["Phila", "CHI", "SF"]
func enable_NYC_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', false)
	Phila.set('disabled', false)
	SF.set('disabled', false)
	DC.set('disabled', true)

var CHI_flights = "NYC"
func enable_CHI_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', false)
	Phila.set('disabled', true)
	SF.set('disabled', true)
	DC.set('disabled', true)

var Phila_flights = ["NYC", "DC"]
func enable_Phila_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', true)
	Phila.set('disabled', false)
	SF.set('disabled', true)
	DC.set('disabled', false)
	
var SF_flights = "NYC"
func enable_SF_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', true)
	Phila.set('disabled', true)
	SF.set('disabled', false)
	DC.set('disabled', true)

var DC_flights = "Phila"
func enable_DC_flights():
	NYC.set('disabled', true)
	CHI.set('disabled', true)
	Phila.set('disabled', false)
	SF.set('disabled', true)
	DC.set('disabled', false)

var cur_place
var previous
var cur_flights

# Called when the node enters the scene tree for the first time.
func _ready():
	change_button_color(NYC, Green_WP)
	cur_place = NYC
	previous = NYC
	set_text(cur_place.get_name())
	

func journey(place):
	cur_flights = get_flights(cur_place)
	if place.get_name() in cur_flights and place != cur_place:
		cur_place = place
		set_text(cur_place.get_name())
		if previous != null:
			change_button_color(previous, Red_WP)
		previous = place
		change_button_color(place, Green_WP)
		enable_flights(cur_place)
		

func _on_Waypoint_pressed(dest):
		journey(dest)

func change_button_color(button, color):
	button.set('custom_styles/hover', color)
	button.set('custom_styles/pressed', color)
	button.set('custom_styles/normal', color)

func get_flights(current):
	if current.get_name() == "NYC":
		return NYC_flights
	if current.get_name() == "CHI":
		return CHI_flights
	if current.get_name() == "Phila":
		return Phila_flights
	if current.get_name() == "SF":
		return SF_flights
	if current.get_name() == "DC":
		return DC_flights

func enable_flights(current):
	if current.get_name() == "NYC":
		enable_NYC_flights()
	
	if current.get_name() == "CHI":
		enable_CHI_flights()
		
	if current.get_name() == "Phila":
		enable_Phila_flights()
		
	if current.get_name() == "SF":
		enable_SF_flights()
		
	if current.get_name() == "DC":
		enable_DC_flights()

		
			
func _on_Waypoint_NYC_pressed():
	_on_Waypoint_pressed(NYC)

func _on_Waypoint_CHI_pressed():
	_on_Waypoint_pressed(CHI)

func _on_Waypoint_SF_pressed():
	_on_Waypoint_pressed(SF)

func _on_Waypoint_Phila_pressed():
	_on_Waypoint_pressed(Phila)

func _on_Waypoint_DC_pressed():
	_on_Waypoint_pressed(DC)
