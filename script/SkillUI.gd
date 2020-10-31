extends CenterContainer

class_name SkillUI

signal cooldown_ended

onready var border := $Border
onready var texture_rect := $TextureRect
onready var overlay := $Overlay
onready var overlay_size: int = overlay.rect_size.y

var cooldown = 0
var time = 0

func _ready():
	hide()


func set_texture(texture: Texture) -> void:
	var img = ImageTexture.new()
	img.create_from_image(texture.get_data(), 0)
	texture_rect.texture = img
	show()

func start_cooldown(cd: int) -> void:
	cooldown = cd
	time = 0
	overlay.set("custom_constants/margin_top", overlay_size)
	
func _physics_process(delta: float):
	if cooldown > 0:
		time += delta
		
		var percentage = time / cooldown
		var relative_height = overlay_size * percentage
		overlay.set("custom_constants/margin_top", relative_height)
		
		if time >= cooldown:
			cooldown = 0
			emit_signal("cooldown_ended")
