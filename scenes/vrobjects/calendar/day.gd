@tool
extends Node3D
	
@export var title: String = "Monday July 10th":
	set(t):
		title = t
		apply_properties()

@onready var day_label = $DayLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_properties()

func apply_properties():
	if not is_inside_tree():
		if !Engine.is_editor_hint():
			return
		else:
			await ready
	day_label.text = title

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func is_day():
	return true