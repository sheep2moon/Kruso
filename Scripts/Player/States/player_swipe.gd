extends State


@onready var animationPlayer : AnimationPlayer = %AnimationPlayer

func enter():
	pass
	#handAnimationPlayer.play("swipe")
	#handAnimationPlayer.animation_finished.connect(on_animation_finished)

func physics_update(delta: float):
	if (player.velocity.length() > 0):
		state_transition.emit(self,"walk")

func on_animation_finished(animation):
	print(animation)
	if animation == "swipe":
		if player.velocity.length() > 0:
			state_transition.emit(self,"walk")
		else: 
			state_transition.emit(self,"idle")
