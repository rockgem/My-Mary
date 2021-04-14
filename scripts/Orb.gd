extends KinematicBody2D

export(String) var key

func _on_Area2D_body_entered(body):
	DialogManager.npcDialogKey = key
	$AnimationPlayer.play("orbAcquire")
	yield($AnimationPlayer, "animation_finished")
	get_tree().call_group("UIGroup", "chapterUpdated", DialogManager.npcDialogKey)
	get_tree().call_group("WorldGroup", "chapterUpdated", DialogManager.npcDialogKey)
	queue_free()

func hideOrb():
	hide()

func showOrb():
	show()
