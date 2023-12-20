extends Node2D

@onready var transition_animation = $TransitionAnimation


# Called when the node enters the scene tree for the first time.
func _ready():
	transition_animation.play("fade_in")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.
