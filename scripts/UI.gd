extends Control

func _on_Button_pressed():
	DialogManager.npcDialogKey = "First"
	DialogManager.dialogIndex = 0
	QuestManager.currentQuestKey = "First"
	QuestManager.currentQuestIndex = 0
	DialogManager.canTalk = false
	DialogManager.finished = true
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func chapterUpdated(chapterName):
	$Label.text = chapterName
	$AnimationPlayer.play("chapterFadeIn")
