class_name Sled extends CharacterBody2D

@onready var speed = 90

func _physics_process(delta: float) -> void:
	
	velocity.y = speed * 100.0 * delta
	
	move_and_slide()
