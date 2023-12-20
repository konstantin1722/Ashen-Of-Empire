extends Node2D

@onready var transition_animation = $TransitionAnimation


# Called when the node enters the scene tree for the first time.
func _ready():
	print( "level1: ", get_tree_string() )
	
	print( get_parent() )
	if get_parent() != null:
		print( "parent: ", get_parent().get_tree_string() )
	
	transition_animation.play("fade_in")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.
