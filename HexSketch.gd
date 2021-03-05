extends Node

onready var textureRect = $TextureRect
onready var viewportContainer = $ViewportContainer
onready var viewport = viewportContainer.get_node("Viewport")
onready var grid = viewport.get_node("Grid")

func _ready():
	var l = grid.radius * 3 / 2.0 * (grid.length - 1) + 1
	var h = sqrt(3) / 2.0 * grid.radius * (grid.height * 2 - 1) + 1
	viewport.size = Vector2(l, h)
	viewportContainer.rect_size = Vector2(l, h)
	yield(VisualServer, "frame_post_draw")
	update_texture()
	viewport.get_node("Grid").disable_draw()

func update_texture():
	var image = viewport.get_texture().get_data()
	image.flip_y()
	if textureRect.texture != null:
		var image_base = textureRect.texture.get_data()
		image_base.blit_rect_mask(image, image, Rect2(Vector2(0, 0), image.get_size()), Vector2(0, 0))
		image = image_base
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	textureRect.texture = texture
