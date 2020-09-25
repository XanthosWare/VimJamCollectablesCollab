extends Button


export(String) var place_name = ""
export(int) var fuel_consume = 1

onready var animation_player = get_node("../AnimationPlayer")
func _ready():
	pass

func get_name():
	return place_name


func _on_Waypoint_pressed():
	animation_player.play("playSoundEffect")
