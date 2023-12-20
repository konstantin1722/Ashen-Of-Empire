extends Node2D

#@onready var transition_animation = $TransitionAnimation
#
#var level1 : PackedScene = preload("res://src/scenes/levels/level1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	print( "main: ", get_tree_string() )
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.

#func _on_button_pressed():
	#transition_animation.play("fade_out")
#
#func _on_transition_animation_animation_finished( anim_name ):
	#get_tree().change_scene_to_packed( level1 )
