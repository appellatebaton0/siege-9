class_name Health extends Area2D

@onready var player:Player = get_tree().get_first_node_in_group("Player")
@onready var cs := $CollisionShape2D
@onready var p:GPUParticles2D = $GPUParticles2D

var time = 0.0
var max_time = 5.0

var subtime = 0.0

func _ready() -> void:
	p.finished.connect(queue_free)

func _process(delta: float) -> void:
	time = move_toward(time, max_time, delta)
	
	if time > max_time / 2:
		subtime = move_toward(subtime, 0.5, delta)
		if subtime >= 0.5: subtime = 0.0
		visible = subtime >= 0.25
	
	if time >= max_time: end()
	
	if player.health == 0:
		end()

func _on_body_entered(_body: Node2D) -> void:
	player.heal()
	end()

func end(): 
	if cs: cs.queue_free()
	
	$AnimatedSprite2D.visible = false
	$GPUParticles2D.emitting = true
