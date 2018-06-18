extends RichTextLabel

# Variables
var dialog = [
	"Everything was ok. Then the storm came…",
	""]
var bb_format = [
"[font=res://fonts/roboto_regular.tres][color=#FFFFFF]",
"[/color][/font]"
]
var page = 0

# Functions
#func _ready():
#	set_process_input(true)
#	set_bbcode(bb_format[0] + dialog[page] + bb_format[1])
#	set_visible_characters(0)

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(bb_format[0] + dialog[page] + bb_format[1])
				set_visible_characters(0)
			else:
				get_tree().change_scene("res://fonts/roboto_regular.tres")
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_Polygon2D_visibility_changed():
	set_process_input(true)
	set_bbcode(bb_format[0] + dialog[page] + bb_format[1])
	set_visible_characters(0)
	pass # replace with function body
