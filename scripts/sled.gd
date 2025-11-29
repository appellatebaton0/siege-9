class_name Sled extends CharacterBody2D

@onready var player:Player = get_tree().get_first_node_in_group("Player")

@onready var speed = 90

func _physics_process(delta: float) -> void:
	
	velocity.y = speed * 100.0 * delta
	
	move_and_slide()

func _on_body_entered(body: Node2D) -> void:
	# KYS.
	if body == player:
		player.damage()
		player.knockback = global_position.direction_to(player.global_position) * 35
	
	speed = 0
	
	queue_free() 
	# Should happen aft. the animation finishes later
	#, though collision should turn off for that.
