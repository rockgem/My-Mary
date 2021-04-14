extends Node2D

func _ready():
	$"/root/GlobalAudioStreamPlayer".stop()
	$"/root/MainMusic".play()

func activateDialog():
#	$Dialogbox.set_position(Vector2(pos.x - $Dialogbox.rect_size.x / 2, pos.y - $Dialogbox.rect_size.y * 2))
	$Dialogbox.activeDialog()
#	$Dialogbox.show()

func chapterUpdated(chapterName):
	
	match(chapterName):
		"Mary you are safe": $AnimationPlayer.play("fadeToBlack")
		"Sorry, Mary": $AnimationPlayer.play("fadeToRed")
		"The Day": $AnimationPlayer.play("fadeToBlack")
