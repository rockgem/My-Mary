extends Control

func _ready():
	$"/root/MainMusic".stop()
	$"/root/GlobalAudioStreamPlayer".play()

func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/World.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_SettingsButton_pressed():
	if !$Panel4.visible:
		$AnimationPlayer.play("aboutSlide")
	else:
		$AnimationPlayer.play("aboutSlideBack")
