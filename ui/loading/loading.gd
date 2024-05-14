extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,101):
		$ProgressBar.set_value(i)
		print(i)
		if i == 69:
			await get_tree().create_timer(randf_range(0.42, 0.69)).timeout
		elif i == 99:
			await get_tree().create_timer(randf_range(3, 4)).timeout
		else:
			await get_tree().create_timer(randf_range(0, 0.1)).timeout
	get_tree().change_scene_to_file("res://ui/notsupported/notsupported.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
