import wollok.game.*
import configuration.*

class channel{
	const property = configuration.genVolume()	
}

class group{
	
}

class sound{
	const property soundFile
	var property activeSound = null
	var volume = 100
	var property factorVol = 100

	
	method play()
	{
		activeSound = game.sound(soundFile)
		activeSound.volume(configuracion.volumen()/factorVol)
		activeSound.play()
	}
	
	method play(_volume)
	{
		volume = _volume
		self.play()
	}
	
	method isActive() = activeSound != null
	
	method volume(_volume)
	{
		activeSound.volume(_volume)
	}
	
	method stop()
	{
		activeSound.stop()
	}
}