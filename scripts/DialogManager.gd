extends Node
# SINGLETON ------------!!

var canTalk = false
var dialogboxPos
var playerGlobalPos
var dialogPath
var currentNpcName
var npcDialogKey = "First"
var dialogIndex = 0
var finished = true

func _process(delta):
	if canTalk:
		pass

func _input(event):
	
	if Input.is_action_just_pressed("talk") && canTalk:
		get_tree().call_group("PlayerGroup", "playerTalkRangeFalse")
		get_tree().call_group("WorldGroup", "activateDialog")

func playerInRange(playerPos):
	playerGlobalPos = playerPos
	canTalk = true

func playerInRangeFalse():
	canTalk = false

func npcInRange(npcName, npcPos):
	currentNpcName = npcName
	dialogPath = "res://actors/dialogs/%s.json" % npcName
	dialogboxPos = npcPos

func npcInRangeFalse():
#	get_tree().call_group("DialogBoxGroup", "hideDialogBoxListener")
	pass
