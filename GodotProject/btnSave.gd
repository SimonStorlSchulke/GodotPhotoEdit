extends Control

var generator

export var shader_to_image: NodePath
export var viewer: NodePath

var view: Sprite

var enable_time = false

var getted_image


func _ready():
	view = get_node(viewer)
	generator = get_node(shader_to_image)
	pass

func _on_Button_pressed():
	generator.generate_image(view.material)
	yield(generator, "generated")
	getted_image = generator.get_image()

	var text = ImageTexture.new()
	text.create_from_image(getted_image)
	getted_image.save_png("test.png")

func _on_EnableTime_pressed():
	enable_time=!enable_time

func _on_Save_as_pressed():
	$Panel/FileDialog.popup()

func _on_FileDialog_file_selected(path):
	if getted_image:
		getted_image.save_png(path)
