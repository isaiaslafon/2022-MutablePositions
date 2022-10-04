import wollok.game.*
import MutablePosition.*
import objectsAndColliders.*


 class Animation inherits TextObject {
 	const animationImages = [] // Imagenes que se utilizan al momento de correr la animacion/
 	const frameRate // Medio falso el nombre, en verdad es el tiempo en millisegundos hasta el siguiente frame.
 	var actualFrame = 0
 	method image() =  animationImages.get(actualFrame) 
 	
 	method update(){
 		if (actualFrame == animationImages.size()) actualFrame = 0 else actualFrame += 1
 	}
 	
 	method frameDuration(){
 		return 1000 / frameRate
 	}
 	
 	// Crea una animacion que loopea las imagenes que hay en animationImages hasta que se acaba el tiempo.
 	method createAnimation(lengthOfAnimation) {
 		game.schedule(lengthOfAnimation, {game.removeVisual(self)})
 		game.onTick(self.frameDuration(),"nuevo frame",{self.update()})
 		game.schedule(lengthOfAnimation,{game.removeTickEvent("nuevo frame")})
 	}
 	
 	method runAnimation(objectA,lengthOfAnimation){
 		game.addVisual(self)
 		self.createAnimation(lengthOfAnimation)
 	}
 }
 
 class DynamicAnimation inherits Animation {
 	var property position = null
 	
 	// Las dynamicAnimation reciben un objeto y se acoplan a este en la duracion de la animacion
  	method move(_position){
 		position.goTo(_position)
 	}
 		
 
    override method runAnimation(objectA,lengthOfAnimation){
 		self.move(objectA.position())
 		super(objectA,lengthOfAnimation)
 	}
 }
 
 class StaticAnimation inherits Animation {
 	const property position  = new MutablePosition()
 }
 
 
 
