extends RichTextLabel

# Variables
var dialog = [
	"Everything was ok, I was going to climb last little mountain to get to the hut.",
	"Then the storm came...",
	"...and I didn't finish that game at all :("]
var bb_format = [
"[center][font=res://fonts/indie_flower.tres][color=#000000]",
"[/color][/font][/center]"
]
var page = 0

# Functions
func _ready():
	set_process_input(true)
	set_bbcode(bb_format[0] + dialog[page] + bb_format[1])
	set_visible_characters(0)

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(bb_format[0] + dialog[page] + bb_format[1])
				set_visible_characters(0)
			else:
				get_tree().change_scene("res://scenes/StartScene.tscn")
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
