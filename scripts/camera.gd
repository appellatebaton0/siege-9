class_name Camera extends Camera2D

var camera_drag_start_position:Vector2

var drag_down := false
var drag_start_position:Vector2
var drag_current_position:Vector2

func _process(delta: float) -> void:
	if drag_down:
		global_position = camera_drag_start_position + ( (drag_start_position - drag_current_position) / zoom)

func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.button_mask == 1:
		if not drag_down: # Just clicked down.
			drag_start_position = event.position
			drag_current_position = event.position
			camera_drag_start_position = global_position
			drag_down = true
		else: drag_current_position = event.position # While drag down
	elif drag_down: # Just unclicked.
		print(event.position)
		drag_down = false
	print(drag_down)
