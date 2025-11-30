class_name Camera extends Camera2D

@onready var anchor = global_position
var shake := Vector2(0,0)

func apply_shake(amnt:= 4):
	if amnt <= 0: shake = Vector2.ZERO
	
	shake.x = amnt * [-1,1].pick_random()
	shake.y = amnt * [-1,1].pick_random()

func _process(_delta: float) -> void:
	global_position = anchor + shake
	apply_shake(abs(shake).x / 1.1)
