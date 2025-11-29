extends Node

@onready var player:Player = get_tree().get_first_node_in_group("Player")

func reset():
	player.reset()
	
	for sled in get_tree().get_nodes_in_group("Sleds"):
		sled.queue_free()
