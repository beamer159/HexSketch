extends Node2D

var height = 55
var length = 125
var radius = 20

func _ready():
	var hex_res = preload("res://Hex.tscn")
	for x in range(0, length):
		for y in range(0, height):
			var hex = hex_res.instance()
			hex.position = Vector2((radius + radius / 2.0) * x, sqrt(3) * radius * (y + x % 2 / 2.0))
			add_child(hex)

func disable_draw():
	for hex in get_children():
		hex.disable_draw()

func _input(event):
	if event.is_action_pressed("draw"):
		print("Start drawing")
	elif event.is_action_released("draw"):
		print("Stop drawing")
		get_tree().root.get_child(0).update_texture()
		disable_draw()
	elif event.is_action_pressed("erase"):
		print("Start erasing")
	elif event.is_action_released("erase"):
		print("Stop erasing")
