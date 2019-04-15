extends Node2D

onready var logo = get_node("Logo")

func _ready():
	set_process(true)
	
func _process(delta):
	logo.set_global_position(get_viewport().get_mouse_position())