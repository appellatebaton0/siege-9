class_name Scorekeeper extends Label

@onready var spawner:SledSpawner = get_tree().get_first_node_in_group("SledSpawner")

var score:float = 0.0
var high :float = 0.0

func _process(delta: float) -> void:
	if spawner.active:
		score += delta
		
		if score > high: high = score
	
	text = "Score: " + str(round(score * 10) / 10) + " | High: " + str(round(high * 10) / 10)

func _reset(): score = 0
