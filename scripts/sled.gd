class_name Sled extends CharacterBody2D

func _physics_process(delta: float) -> void:
	
	velocity.y = 12000.0 * delta
	
	move_and_slide()
