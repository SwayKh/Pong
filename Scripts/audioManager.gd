extends Node2D

var audioScene = load("res://Scenes/Sounds.tscn") as PackedScene
signal finished()

func play(audioSoundName, optionals = {}):
	emit_signal("finished")
	var audio = audioScene.instance()
	add_child(audio)
	var sound = audio.get_node(audioSoundName)
	_setSoundProperties(sound, optionals)
	sound.play()
	return sound

func _setSoundProperties(sound, optionals):
	var volume_db = (12 if not optionals.has('volume_db') else optionals['volume_db'])
	var pitch_scale = (1 if not optionals.has('pitch_scale') else optionals['pitch_scale'])
	#var mix_target = (0 if not optionals.has('mix_target') else optionals['mix_target'])
	var bus = ('SFX' if not optionals.has('bus') else optionals['bus'])
	var autoplay = (false if not optionals.has('autoplay') else optionals['autoplay'])
	var stream_paused = (false if not optionals.has('stream_paused') else optionals['stream_paused'])

	# MIX_TARGET_STEREO   = 0 The audio will be played only on the first channel.
	# MIX_TARGET_SURROUND = 1 The audio will be played on all surround channels.
	# MIX_TARGET_CENTER   = 2 The audio will be played on the second channel, which is usually the center.
	#sound.mix_target = mix_target #int value of any from above comment

	sound.volume_db = volume_db #tested range: 0-100
	sound.pitch_scale = pitch_scale #range from 0-16
	sound.bus = bus #string name of bus channel
	sound.autoplay = autoplay #bool: true or false
	sound.stream_paused = stream_paused #bool: true or false

	return sound

