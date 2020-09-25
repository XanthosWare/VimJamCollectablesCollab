extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("Stamps : " + String(Global.stamps_collected))

func update_score():
	pass
	set_text("Stamps : " + String(Global.stamps_collected))


func _on_Area2D_area_entered(area):
	update_score()
