extends Area2D


const SIN_0 = sin(0)
const SIN_30 = sin(PI / 6)
const SIN_60 = sin(PI  / 3)
const SIN_90 = sin(PI / 2)
const COS_0 = SIN_90
const COS_30 = SIN_60
const COS_60 = SIN_30
const COS_90 = SIN_0

var vertices;
var color = Color.transparent


func _ready():
	var radius = get_parent().radius
	vertices = PoolVector2Array([
	radius * Vector2(COS_0, SIN_0),
	radius * Vector2(COS_60, SIN_60),
	radius * Vector2(-COS_60, SIN_60),
	radius * Vector2(-COS_0, SIN_0),
	radius * Vector2(-COS_60, -SIN_60),
	radius * Vector2(COS_60, -SIN_60),
])
	$Collision.polygon = vertices

func _draw():
	draw_polygon(vertices, PoolColorArray([color]))
	draw_polyline(vertices, Color.black)
	draw_line(vertices[vertices.size() - 1], vertices[0], Color.black)

func _input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("draw") and color != Color.green:
		color = Color.green
		update()
	elif Input.is_action_pressed("erase") and color != Color.transparent:
		color = Color.transparent
		update()
