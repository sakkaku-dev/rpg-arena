extends CenterContainer

onready var border := $Border
onready var texture_rect := $TextureRect

func _ready():
	hide()


func set_texture(texture: Texture) -> void:
	var img = ImageTexture.new()
	img.create_from_image(texture.get_data(), 0)
	texture_rect.texture = img
	show()

