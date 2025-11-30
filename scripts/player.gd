class_name Player extends CharacterBody2D

signal died
signal damaged

@export var invi = 1.0
var i_time = 0.0

@export var max_speed := 200.0
@export var acceleration := 800.0

@export var max_health := 3
@onready var health = max_health
var knockback:Vector2

@onready var sprite := $Sprite

@onready var sp = global_position
func reset() -> void: 
	health = max_health
	global_position = sp
@onready var cam:Camera = get_tree().get_first_node_in_group("Camera")
func damage(amnt := 1):
	if i_time > 0.0: return 
	damaged.emit()
	
	cam.apply_shake()
	health -= amnt
	i_time = invi
	
	if health == 0: 
		died.emit()
func heal(amnt := 1):
	health = min(max_health, health + amnt)

func _physics_process(delta: float) -> void:
	i_time = move_toward(i_time, 0, delta)
	
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity.x = move_toward(velocity.x, max_speed * direction.x, acceleration * delta)
	velocity.y = move_toward(velocity.y, max_speed * direction.y, acceleration * delta)
	
	if direction:
		sprite.play("moving")
		look_at(position + direction)
	else: sprite.play("default")
	
	velocity += knockback
	knockback /= 1.2
	
	move_and_slide()
