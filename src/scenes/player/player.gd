extends CharacterBody2D


var speed = 80.0
var speedDefault = 80.0
var speedBoost = 180.0
var jump_velocity = -400.0
@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event : InputEvent):
	if event.is_action_pressed("down") and is_on_floor():
		position.y += 3
	
	if event.is_action_pressed("down"):
		print( is_on_floor() )

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		if velocity.y < 0:
			$CollisionShape2D.position.y = 0
			$CollisionShape2D.shape.size.y = 32.0
			
		if velocity.y > 0:
			animated_sprite.animation = "down"

	if is_on_floor() or velocity.y > 0:
		$CollisionShape2D.shape.size.y = 1.5
		$CollisionShape2D.position.y = 30
	
	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		animated_sprite.animation = "jump"
		speed = speedBoost

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction:
		if direction == -1:
			animated_sprite.flip_h = true
		elif direction == 1:
			animated_sprite.flip_h = false
		
		velocity.x = direction * speed
		
		if ( animated_sprite.animation != "jump" and animated_sprite.animation != "down" ) or velocity.y == 0:
			if Input.is_action_pressed("sprint"):
				animated_sprite.animation = "run"
				speed = speedBoost
			else:
				animated_sprite.animation = "walk"
				speed = speedDefault
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if velocity == Vector2.ZERO and is_on_floor():
		animated_sprite.animation = "idle"
	
	if Input.is_action_pressed("up"):
		velocity.y += gravity * delta * -2
	
	animated_sprite.play()
	move_and_slide()
