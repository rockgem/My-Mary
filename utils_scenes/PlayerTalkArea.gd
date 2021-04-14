extends Area2D

func _on_TalkArea_area_entered(area):
	DialogManager.playerInRange(global_position)
	get_tree().call_group("PlayerGroup", "playerTalkRange")

func _on_TalkArea_area_exited(area):
	DialogManager.playerInRangeFalse()
	get_tree().call_group("PlayerGroup", "playerTalkRangeFalse")
