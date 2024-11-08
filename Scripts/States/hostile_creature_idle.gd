extends State
class_name HostileCreatureIdle

@export var creature: CharacterBody2D
@export var move_speed := 50.0

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,2)

func enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		#await get_tree().create_timer(1).timeout
		randomize_wander()
	
func physics_update(delta: float):
	if creature:
		creature.velocity = move_direction * move_speed
	var direction = creature.global_position - player.global_position
	if direction.length() < 200:
		state_transition.emit(self,"runaway")
