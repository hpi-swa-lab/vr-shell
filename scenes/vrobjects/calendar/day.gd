@tool
extends "res://scripts/text_box.gd"

@export var title: String = "Monday":
	set(t):
		title = t
		apply_properties()

@onready var day_label = $DayLabel
@onready var time_labels = $Time

var original_position


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_properties()
	original_position = position

func apply_properties():
	super.apply_properties()
	if not is_inside_tree():
		if !Engine.is_editor_hint():
			return
		else:
			await ready
	day_label.text = title

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !Engine.is_editor_hint():
		if original_position.distance_to(position)>0.1:
			time_labels.visible = true
		else:
			time_labels.visible = false
