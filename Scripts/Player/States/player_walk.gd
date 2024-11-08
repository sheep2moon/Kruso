extends State

@onready var animationPlayer : AnimationPlayer = %AnimationPlayer
func enter():
	if player.velocity.length() > 0:
		if player.velocity.y < 0 && abs(player.velocity.y) > abs(player.velocity.x):
			animationPlayer.play("walk_up")
		else:
			animationPlayer.play("walk")
func physics_update(delta):
	if (player.velocity.length() == 0):
		state_transition.emit(self,"idle")
	if player.velocity.length() > 0:
		if player.velocity.y < 0 && abs(player.velocity.y) > abs(player.velocity.x):
			animationPlayer.play("walk_up")
		else:
			animationPlayer.play("walk")
	if Input.is_action_just_pressed("hand_main_action"):
		state_transition.emit(self,"swipe")

func exit():
	animationPlayer.play("RESET")
