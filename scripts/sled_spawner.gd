class_name SledSpawner extends Node

@export var rows := 6

@export var interval := 0.1
var time := 0.0

const SLED_PATH = "res://scenes/sleds/"
@warning_ignore("integer_division")
@onready var ROW_SIZE:int = (384 / rows)

@onready var options := get_options()
func get_options() -> Array[PackedScene]:
	var response:Array[PackedScene]
	
	var dir = DirAccess.open(SLED_PATH)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				var file = load(SLED_PATH + file_name)
				
				if file is PackedScene: response.append(file)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	
	return response

func get_random_row_position() -> Vector2:
	
	@warning_ignore("integer_division")
	var x:float = ROW_SIZE * randi_range(0, rows - 1) + (ROW_SIZE / 2)
	var y:float = -100
	
	return Vector2(x,y)

func spawn_new():
	var new = options.pick_random().instantiate()
	
	add_child(new)
	new.global_position = get_random_row_position()

func _process(delta: float) -> void:
	time = move_toward(time, 0, delta)
	if time <= 0:
		time = interval
		for i in range([1,1,1,1,2,2,3,1,1,1,1,2,2,3,rows].pick_random()):
			spawn_new()
