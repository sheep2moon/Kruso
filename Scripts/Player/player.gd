extends CharacterBody2D


@export var speed: float = 100.0
#@onready var sprite = %BodySprite
@onready var body_parts = $BodyParts
@onready var body = $BodyParts/Body
@onready var head = $BodyParts/Head
@onready var main_hand = %MainHand

func _ready() -> void:
	print(main_hand.position)

func _physics_process(delta: float) -> void:
	var mouse_direction : Vector2 = (get_global_mouse_position() - global_position).normalized()
	var rotation = mouse_direction.angle()
	var direction: Vector2 = Input.get_vector("left","right","up","down").normalized()
	
	var is_moving_left = direction.x < 0
	var is_mouse_left = mouse_direction.x < 0
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	if direction.x:
		print(direction.x)
		body_parts.scale.x = -1 if is_moving_left else 1
		main_hand.scale.x = -1 if is_moving_left else 1
		print(mouse_direction.y)
#		celuje w prawo -> od -PI/2 do PI/2
#		celuje w lewo -> od PI/2 do -PI/2
		if is_moving_left:
			if is_mouse_left:
				main_hand.rotation = mouse_direction.y * -(PI / 2)
			else:
				if mouse_direction.y > 0:
					main_hand.rotation = -PI/2
				else:
					main_hand.rotation = PI/2
		else:
			main_hand.rotation = mouse_direction.y * (PI / 2)	
		#main_hand.rotation = mouse_direction.y * (PI / 2) * (-1 if is_mouse_left else 1)
	else:
		main_hand.scale.x = -1 if is_mouse_left else 1
		body_parts.scale.x = -1 if is_mouse_left else 1
		main_hand.rotation = mouse_direction.y * (PI / 2) * (-1 if is_mouse_left else 1)

	
	move_and_slide()
