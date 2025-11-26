class_name Sled extends CharacterBody2D

@onready var speed = randf_range(100, 115)

func _physics_process(delta: float) -> void:
	
	velocity.y = speed * 100.0 * delta
	
	move_and_slide()
