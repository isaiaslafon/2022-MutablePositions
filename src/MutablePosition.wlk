import wollok.game.*

class MutablePosition {
	var property x = 0
	var property y = 0

	// No usar por performance!
	/*
	 * return a NEW position adding "n" or substracting "-n" units to X
	 */ 
	method horizontal(n) {  
		return new MutablePosition(x = x + n, y = y)
	}

	/*
	 * return a NEW position adding "n" or substracting "-n" units to Y
	 */ 
	method vertical(n) { 
		return new MutablePosition(x = x, y = y + n)
	}

	/*
	 * return a NEW position "n" units to the right, left, up, down (see self.horizontal(n) and self.vertical(n))
	 */ 
	method right(n) { 
		return self.horizontal(n)
	}

	method left(n) { 
		return self.horizontal(-n)
	}

	method up(n){ 
		return self.vertical(n)
	}
	
	method down(n){
		return	self.vertical(-n)
	}
	
	/*
	 * return a NEW position 1 unit to the right, left, up, down (see self.horizontal(n) and self.vertical(n))
	 */ 
	method right() { 
		return self.horizontal(1)
	}

	method left() { 
		return self.horizontal(-1)
	}

	method up(){ 
		return self.vertical(1)
	}
	
	method down(){
		return	self.vertical(-1)
	}
	
	/*
	 * return a copy of self.
	 */
	method clone(){ 
		return	new MutablePosition(x = x, y = y)
	}
	
	//-------------------------------------------------------
	/*
	 * return all elements in self.
	 */
	method allElements() { 
		return game.getObjectsIn(self)
	}
	
	/*
	 * return the distance within self and a position.
	 */ 
	method distance(position) {
		self.checkNotNull(position, "distance")
		const deltaX = x - position.x()
		const deltaY = y - position.y()
		return (deltaX.square() + deltaY.square()).squareRoot()
	}
	
	override method ==(other) {
		return x == other.x() && y == other.y()
	}

	override method toString() {
		return x.toString() + "@" + y.toString()
	}
	
//Performance action/order methods:
	/*
	 * Change position adding "n" or substracting "-n" units to X (self.horizontal(n)) or y (self.vertical(n)).
	 */
	method goHorizontal(n) { 
		x += n
	}
	
	method goVertical(n) { 
		y += n
	}

	/*
	 * Change self "n" units to the right, left, up, down (see self.goHorizontal(n) and self.goVertical(n))
	 */ 
	method goRight(n) {
		self.goHorizontal(n)
	}

	method goLeft(n) {
		self.goHorizontal(-n)
	}

	method goUp(n) {
		self.goVertical(n)
	}

	method goDown(n) {
		self.goVertical(-n)
	}

	/*
	 * Change self 1 unit to the right, left, up, down (see self.goHorizontal(n) and self.goVertical(n))
	 */ 
	method goRight() {
		self.goRight(1)
	}

	method goLeft() {
		self.goLeft(-1)
	}

	method goUp() {
		self.goUp(1)
	}

	method goDown() {
		self.goDown(1)
	}
	
	/*
	 * Change self to x and y of a position.
	 */ 
	method goTo(position) {
		x = position.x()
		y = position.y()
	}

	/*
	 * Change self to x and y.
	 */ 
	method goTo(_x, _y) {
		x = _x
		y = _y
	}
	
	/*
	 * draw and element in self position.
	 */ 	
	method drawElement(element) {
		game.addVisualIn(element, self)
	}

	/*
	 * draw a character in self position.
	 */ 
	method drawCharacter(element) {
		game.addVisualCharacterIn(element, self)
	}

	/*
	 * say a message in self position with an element.
	 */ 
	method say(element, message) {
		game.say(element, message)
	}

	/*
	method randomTo(n){ //Debería estar en numbers?
		return 0.randomUpTo(n)
	}
	*/

	method clear() {
		self.allElements().forEach{ element => game.removeVisual(element)}
	}


	//Deberian estar en game!
	method randomWidth(){ 
		return 0.randomUpTo(game.width())
	}
	
	method randomHeight(){
		return 0.randomUpTo(game.height())
	}
		
	method goToRandom() {
		self.goTo(self.randomWidth(), self.randomHeight())
	}
	
	method goToRandomHeight(height) {
		self.goTo(self.randomWidth(), height)
	}
	
	method goToRandomWidth(width) {
		self.goTo(width, self.randomHeight())
	}

}
