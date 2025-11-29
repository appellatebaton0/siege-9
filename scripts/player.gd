class_name Player extends CharacterBody2D

signal died

@export var max_speed := 200.0
@export var acceleration := 800.0

@export var max_health := 3
@onready var health = max_health
var knockback:Vector2

func reset() -> void: health = max_health
func damage(amnt := 1):
	health -= amnt
	
	print("DAMAGE")
	if health == 0: 
		print("DIEDa")
		died.emit()
	
	
	

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity.x = move_toward(velocity.x, max_speed * direction.x, acceleration * delta)
	velocity.y = move_toward(velocity.y, max_speed * direction.y, acceleration * delta)
	
	velocity += knockback
	knockback /= 1.2
	
	move_and_slide()
