extends Node
class_name State

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")

signal state_transition

func enter():
	pass
	
func exit():
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	pass
