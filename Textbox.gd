extends ColorRect

export(float) var text_speed = .05

var dialog = [
	{"Name": "Thief", "Text": "Finally!, I've made it inside the castle..."},
	{"Name": "Thief", "Text": "Use WASD to move and avoid the guards..."},
	{"Name": "Thief", "Text": "I can also pause with escape, or p..."},
	{"Name": "Thief", "Text": "Now where did they hide the treasure?..."}
]

var phrase_num = 0
var finished = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			next_phrase()
		else:
			$Text.visible_characters = len($Text.text)
			


func _ready():
	$Timer.wait_time = text_speed
	# dialog = get_dialog()
	assert(dialog, "Dialog not found")
	next_phrase()
	
	
"""func get_dialog() -> Array:
	var f = File.new()
	#assert(f.fild_exists(dialog_path), "File path does not exist")
	
	f.open(dialog_path, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []"""


func next_phrase() -> void:
	if phrase_num >= len(dialog):
		queue_free()
		return
			
	finished = false
		
	$Name.bbcode_text = dialog[phrase_num]['Name']
	$Text.bbcode_text = dialog[phrase_num]['Text']
	
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
		
	finished = true
	phrase_num += 1
	return
