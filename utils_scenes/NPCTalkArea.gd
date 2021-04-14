extends Area2D

func _on_NPCTalkArea_area_entered(area):
	DialogManager.dialogIndex = 0
	var npcName = get_parent().get_name()
	DialogManager.npcInRange(npcName, global_position)

func _on_NPCTalkArea_area_exited(area):
	DialogManager.npcInRangeFalse()
