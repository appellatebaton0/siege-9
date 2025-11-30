extends Node

@export var r := false
@onready var player:Player = get_tree().get_first_node_in_group("Player")

func _process(_delta: float) -> void:
	if r:
		reset()
		r = false

func reset():
	player.reset()
	
	for sled in get_tree().get_nodes_in_group("Sleds"):
		sled.queue_free()
	
	for health in get_tree().get_nodes_in_group("Health"):
		health.queue_free()
