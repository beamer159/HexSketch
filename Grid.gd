extends Node2D


var height = 32
var length = 75
var radius = 20

func _ready():
	var hex_res = preload("res://Hex.tscn")
	for x in range(0, length):
		for y in range(0, height):
			var hex = hex_res.instance()
			add_child(hex)
			hex.position = Vector2((radius + radius / 2.0) * x, sqrt(3) * radius * (y + x % 2 / 2.0))
