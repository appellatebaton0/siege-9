class_name Player extends CharacterBody2D

signal died


@export var max_speed := 200.0
@export var acceleration := 800.0

@export var max_health := 3
@onready var health = max_health
var knockback:Vector2

@onready var sp = global_position
func reset() -> void: 
	health = max_health
	global_position = sp
func damage(amnt := 1):
	health -= amnt
	
	if health == 0: 
		died.emit()

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity.x = move_toward(velocity.x, max_speed * direction.x, acceleration * delta)
	velocity.y = move_toward(velocity.y, max_speed * direction.y, acceleration * delta)
	
	velocity += knockback
	knockback /= 1.2
	
	move_and_slide()
