extends State
class_name CreatureRunAway

@export var creature: CharacterBody2D
@export var move_speed := 70.0

func enter():
	player = get_tree().get_first_node_in_group("Player")
func physics_update(delta: float):
	if (!player):
		return
	var direction = creature.global_position - player.global_position
	
	if direction.length() < 400:
		creature.velocity = direction.normalized() * move_speed
	else:
		creature.velocity = Vector2.ZERO
	
	if direction.length() > 400:
		state_transition.emit(self,"idle")
