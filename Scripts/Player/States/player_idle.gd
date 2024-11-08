extends State
class_name PlayerIdle

@onready var animationPlayer : AnimationPlayer = %AnimationPlayer

func enter():
	print(animationPlayer.get_animation_library_list())
	
	animationPlayer.play("idle")


func physics_update(delta: float):
	if (player.velocity.length() > 0):
		state_transition.emit(self,"walk")
	#if Input.is_action_pressed("hand_main_action"):
		#state_transition.emit(self,"swipe")
