class_name Sled extends CharacterBody2D

@onready var player:Player = get_tree().get_first_node_in_group("Player")
@onready var main:Node = get_tree().get_first_node_in_group("Main")

@onready var speed = 90

@onready var s := $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	
	velocity.y = speed * 100.0 * delta
	
	move_and_slide()
	
	if player.health == 0 and s != null:
		s.queue_free()

func _on_body_entered(body: Node2D) -> void:
	# KYS.
	if body == player:
		player.damage()
		player.knockback = global_position.direction_to(player.global_position) * 50
	
		speed /= 2
	else: speed = 0
	
	$Sprite2D.play("crash")
	$Area2D.queue_free()
	# Should happen aft. the animation finishes later
	#, though collision should turn off for that.

var health_scene := load("res://scenes/health.tscn")
func spawn_health():
	var new:Area2D = health_scene.instantiate()
	
	main.add_child(new)
	
	new.global_position = global_position
	


func _on_anim_finish() -> void:
	
	if randf() > 0.9: spawn_health()
	
	queue_free()
