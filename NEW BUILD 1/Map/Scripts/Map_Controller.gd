extends Label

onready var NYC = get_node("../NYC/Waypoint")
onready var CHI = get_node("../CHI/Waypoint")
onready var Phila = get_node("../Phila/Waypoint")
onready var SF = get_node("../SF/Waypoint")
onready var DC = get_node("../DC/Waypoint")
onready var Green_WP = load("res://StyleBoxes/Green_Waypoint_StyleBox.tres")
onready var Red_WP = load("res://StyleBoxes/Red_Waypoint_StyleBox.tres")

func enable_NYC_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', false)
	Phila.set('disabled', false)
	SF.set('disabled', false)
	DC.set('disabled', true)

func enable_CHI_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', false)
	Phila.set('disabled', true)
	SF.set('disabled', true)
	DC.set('disabled', true)

func enable_Phila_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', true)
	Phila.set('disabled', false)
	SF.set('disabled', true)
	DC.set('disabled', false)
	
func enable_SF_flights():
	NYC.set('disabled', false)
	CHI.set('disabled', true)
	Phila.set('disabled', true)
	SF.set('disabled', false)
	DC.set('disabled', true)

func enable_DC_flights():
	NYC.set('disabled', true)
	CHI.set('disabled', true)
	Phila.set('disabled', false)
	SF.set('disabled', true)
	DC.set('disabled', false)

var current_place 

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.current_place == null:
		current_place = NYC
	if Global.current_place == "NYC":
		current_place = NYC
	if Global.current_place == "CHI":
		current_place = CHI
	if Global.current_place == "SF":
		current_place = SF
	if Global.current_place == "Phila":
		current_place = Phila
	if Global.current_place == "DC":
		current_place = DC
	set_text(current_place.get_name())
	change_button_color(current_place, Green_WP)
	enable_flights(current_place)

func journey(place):
	if place != current_place:
		change_button_color(current_place, Red_WP)
		current_place = place
		set_text(current_place.get_name())
		change_button_color(place, Green_WP)
		enable_flights(current_place)
		Global.current_place = current_place.get_name()

func _on_Waypoint_pressed(dest):
	journey(dest)

func change_button_color(button, color):
	button.set('custom_styles/hover', color)
	button.set('custom_styles/pressed', color)
	button.set('custom_styles/normal', color)

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
