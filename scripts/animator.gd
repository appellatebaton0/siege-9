extends Node

@export var anim_name := ""

@onready var animator:AnimationPlayer = get_tree().get_first_node_in_group("Animator")

func animate() -> void: animator.play(anim_name)
