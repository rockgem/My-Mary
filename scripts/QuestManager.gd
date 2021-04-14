extends Node

var quests = ["First", "Hi, Mary", "Introduce", "Mary Is Cool"]
var currentQuestKey = "First"
var currentQuestIndex = 0

func nextQuest():
	currentQuestIndex += 1
	if !currentQuestIndex > quests.size() - 1:
		currentQuestKey = quests[currentQuestIndex]
		DialogManager.npcDialogKey = currentQuestKey
		get_tree().call_group("UIGroup", "chapterUpdated", DialogManager.npcDialogKey)
