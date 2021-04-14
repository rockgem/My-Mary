extends Button



func _on_Button_mouse_entered():
	$"/root/HoverSfx".play()
	$AnimationPlayer.play("slideLeft")

func _on_Button_mouse_exited():
	$AnimationPlayer.play("slideRight")
