# Setget
## Example Implementation

```gdscript
####################################################
Using setget for encapsulation for achievements
####################################################
extends Panel

export(float) var slide_distance = 200.0
onready var tween = $Tween
onready var timer = $IdleTime 
onready var title = $MarginContainer/VBoxContainer/Title setget set_title, get_title
onready var description = $MarginContainer/VBoxContainer/Description setget set_description, get_description



func _ready():
	slide_distance += rect_size.y
#	show()

	
func set_title(new_title):
	title.text = new_title
	
func get_title():
	return title.text
	
func set_description(new_description): 
	description.text = new_description

func get_description():
	return description.text 
func show():
#	.show()
	var initial_position = rect_position
	var final_position = rect_position + Vector2(0, slide_distance)
	var tween_duration = 1.5
	tween.interpolate_property(self, 'rect_position', initial_position, final_position, tween_duration,
							tween.TRANS_BACK, tween.EASE_OUT)
	tween.start()
	
	yield(tween, 'tween_completed')
	hide()
	
#	if timer.time_left ==0:hide()
func hide():
	
	var initial_position = rect_position
	var final_position = rect_position - Vector2(0, slide_distance)
	var tween_duration = 1.5
	tween.interpolate_property(self, 'rect_position', initial_position, final_position, tween_duration,
							tween.TRANS_BACK, tween.EASE_IN)
	tween.start()
	yield(tween, 'tween_completed')
	show()
 ## Example Implementation
 func _on_Achievements_achievement_completed():
	var panel = $Achievements/SlidingPanel
	panel.description = 'Encapsulated achievements for cleaner code'
	print( panel.title  )
	panel.title = 'Achievement Unlocked'
	print( panel.title  )	
	panel.show()
	
```
