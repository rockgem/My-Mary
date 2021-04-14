extends Panel

var dialogContainer = {}
var data

func activeDialog():
	var file = File.new()
	if file.file_exists(DialogManager.dialogPath):
		file.open(DialogManager.dialogPath, file.READ)
		data = parse_json(file.get_as_text())
		file.close()
	else:
		print("cannot find file")
	
	if data.has(DialogManager.npcDialogKey) && DialogManager.finished:
		dialogContainer.clear()
		DialogManager.finished = false
		dialogContainer = data
		playDialog()
		show()
	elif !DialogManager.finished:
		playDialog()
	else:
		dialogContainer = data
		playDefaultDialog()
		$Timer.start(5)
		show()

func playDialog():
	if "response" + str(DialogManager.dialogIndex) in dialogContainer[DialogManager.npcDialogKey]:
		show()
		set_position(Vector2(DialogManager.playerGlobalPos.x - rect_size.x / 2, DialogManager.playerGlobalPos.y - rect_size.y * 2))
		$NPCNamePanel/NPCName.text = "Blue"
		$RichTextLabel.percent_visible = 0
		$RichTextLabel.bbcode_text = dialogContainer[DialogManager.npcDialogKey]["response" + str(DialogManager.dialogIndex)]
		$Tween.interpolate_property($RichTextLabel, "percent_visible", 0,1,1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Timer.start(5)
		$Tween.start()
		DialogManager.dialogIndex += 1
	elif "text" + str(DialogManager.dialogIndex) in dialogContainer[DialogManager.npcDialogKey]:
		show()
		$NPCNamePanel/NPCName.text = DialogManager.currentNpcName
		set_position(Vector2(DialogManager.dialogboxPos.x - rect_size.x / 2, DialogManager.dialogboxPos.y - rect_size.y * 2))
		$RichTextLabel.percent_visible = 0
		$RichTextLabel.bbcode_text = dialogContainer[DialogManager.npcDialogKey]["text" + str(DialogManager.dialogIndex)]
		$Tween.interpolate_property($RichTextLabel, "percent_visible", 0,1,1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Timer.start(5)
		$Tween.start()
		DialogManager.dialogIndex += 1
	else:
		if DialogManager.npcDialogKey == QuestManager.currentQuestKey:
			QuestManager.nextQuest()
			print("next quest")
		
		hide()
		DialogManager.finished = true
		DialogManager.dialogIndex = 0

func playDefaultDialog():
	set_position(Vector2(DialogManager.dialogboxPos.x - rect_size.x / 2, DialogManager.dialogboxPos.y - rect_size.y * 2))
	$NPCNamePanel/NPCName.text = DialogManager.currentNpcName
	
	if DialogManager.dialogIndex >= dialogContainer["default0"].size():
		DialogManager.dialogIndex = 0
	
	$RichTextLabel.percent_visible = 0
	$RichTextLabel.bbcode_text = dialogContainer["default0"]["text" + str(DialogManager.dialogIndex)]
	$Tween.interpolate_property($RichTextLabel, "percent_visible", 0,1,1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Timer.start(5)
	$Tween.start()
	DialogManager.dialogIndex += 1

func hideDialogBoxListener():
	hide()

func _on_Timer_timeout():
	hide()
