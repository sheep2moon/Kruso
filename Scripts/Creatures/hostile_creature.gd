extends CharacterBody2D


func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	if velocity.length() > 0:
		$AnimationPlayer.play("walk")
		
	if velocity.x > 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
		
	move_and_slide()
