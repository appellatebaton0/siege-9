extends Node

signal play(at:float)

@export var anim_name := ""
@export var a := 0.0

@onready var animator:AnimationPlayer = get_tree().get_first_node_in_group("Animator")

func animate() -> void: animator.play(anim_name)

func _play(): play.emit(a)
