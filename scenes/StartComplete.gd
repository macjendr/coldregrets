extends Area2D

export(String, FILE, "*.tscn") var world_scene 
#
#func _ready():
#	connect('body_enter', self, '_on_Player_body_enter')
#
#func _on_Player_body_enter(body):
#	print(body, " entered area")
#	if body.get_name() == "Player":
#		get_tree().change_scene(world_scene)

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(world_scene)
