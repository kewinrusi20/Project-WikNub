extends Label

func _process(delta):
	var fps = Engine.get_frames_per_second()
	self.text = "FPS: "+str(fps)
