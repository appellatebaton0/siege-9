class_name HealthBar extends TextureProgressBar

@onready var player:Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	max_value = player.max_health * 10

func _process(_delta: float) -> void:
	value = lerp(value, 10 * float(player.health), 0.5)
	
