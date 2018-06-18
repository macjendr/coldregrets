extends RichTextLabel

# Variables
var dialog = [
	"Ok, this is emabarrassing my little red-hooded friend...",
	"Unfortunately I couldn't make it and your adventure ends here.",
	"I wanted beautiful blizzard effects, eerie white noises around you, dramatic music, everything.",
	"Instead I at least made that thing above your head telling you how cold it is and flat desingned 'storm' effect around you.",
	"Maybe it's better, because you can sit comfortably in front of the fire.",
	"I will try to come back to you after this jam and some sleep, don't you worry.",
	"Thank you for experiencing my first chapter in my, I hope, long story with game development.",
	"*Dramatic Jeremy-Soule-grade music and end titles, 100 on Metacritic, GOTY placeholder*"
]
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
