class_name HealthBar extends ProgressBar

@onready var player:Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	max_value = player.max_health

func _process(_delta: float) -> void:
	value = lerp(value, float(player.health), 0.9)
	
