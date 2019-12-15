struct Piece : TPiece, Equatable {

	private (set) var nom : String 
	private (set) var couleur : String 
	private (set) var forme : String 

	
	init(nom : String, couleur : String, forme : String) {
		self.nom = nom
		self.couleur = couleur
		self.forme = forme
	}
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return
          lhs.nom == rhs.nom
    }
   
}