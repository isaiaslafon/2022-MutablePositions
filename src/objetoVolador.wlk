import wollok.game.*
import configuracion.*
import avion.*


class ObjetoVolador
{
    var vida
    var property danio 
    const property type
    var velocidad = 0
    var imagenObjeto = "default.png"
    var posicionObjeto
    
    method configurar()
    {
    	self.desplazar()
    	game.onCollideDo(self,{x => configuracion.impacto(x,self)})
    }
    
    method desplazar()
  
    
    method bajarVida(_danio)
    {
    	vida = vida - _danio
    	if(vida <= 0)
    	{ 
    		game.removeVisual(self)
    	}
    }
    
    method image() = imagenObjeto
    
    method position() = posicionObjeto 	
}


class Asteroide inherits ObjetoVolador (type = "Asteroide")
{
	
	
	override method desplazar()
	{
		posicionObjeto = posicionObjeto.down(velocidad)
    	
    	if (posicionObjeto.y() < -1)
    	{
    		game.removeVisual(self)
    	}
    	
    	game.schedule(100,{self.desplazar()})
	}
	
	override method configurar()
	{
		
		super()
		if (vida < 2)
		{
			imagenObjeto = "asteroideChiquitin.png"
			velocidad = 0
			danio = 3
		}
		else if (vida >= 2 and vida < 4) 
		{
			imagenObjeto = "asteroideMediano.png"
			velocidad = 0
			danio = 2
		}
		else 
		{
			imagenObjeto = "asteroideGrande.png"
			velocidad = 0
			danio = 1
		}
		
		self.desplazar()
	}
}

class Municion inherits ObjetoVolador (type = "Bala")
{
	
	override method desplazar()
	{
		posicionObjeto = posicionObjeto.up(velocidad)
		if (posicionObjeto.y() > 25|| vida ==0) // ->veo q el objeto desaparece en la linea 25 o cuando choca
    	{
    		game.removeVisual(self)				
    	}
		game.schedule(100,{self.desplazar()})
	}
	
	
}

/* Clase general de municiones. Si se quiere crear otra municion con hacer:
 * 
 * class MunicionEspecial inherits Municion
 * {
 * }
 * 
 * Ya "heredas" todos los parametros de la clase general.
 * 
 */