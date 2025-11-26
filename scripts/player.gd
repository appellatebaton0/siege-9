class_name Player extends CharacterBody2D

@export var max_speed := 200.0
@export var acceleration := 800.0

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity.x = move_toward(velocity.x, max_speed * direction.x, acceleration * delta)
	velocity.y = move_toward(velocity.y, max_speed * direction.y, acceleration * delta)
	
	move_and_slide()
