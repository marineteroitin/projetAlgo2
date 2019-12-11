// Le protocole Piece représente les différentes pièces présentes dans le jeu. 
// Chaque joueur possède 2 pièce de chaque forme. 
// La création de pièce ne sera effectué qu'en début de partie
protocol TPiece {
    // init : String x String -> Piece
    // Initialise une pièce grâce a son nom et sa couleur 
    // Paramètre : nom de type string correspondant à la forme de la piece (  "ce" = Cercle ou "ca" = Carre ou "cy" = Cylindre ou "tr" = Triangle)
    // Paramètre : couleur correspondant a la couleur de la pièce 
    // Cette fonction ne peut pas être utilisé autre qu'en début de partie (fileprivate)
    init(nom : String, couleur : String )

    // nom : Piece -> String
    // Paramètre : Piece
    // Postcondition : nom de la piece : "ce" = Cercle ou "ca" = Carre ou "cy" = Cylindre ou "tr" = Triangle
    var nom : String { get }

    // couleur : Piece -> Couleur
    // Paramètre : Piece 
    // Postcondition : Renvoie "33" = claire ou "92" = fonce et rien d'autre. 
    var couleur : String { get }

    // forme : Piece -> String 
    // Renvoie la forme de la piece sous Unicode pour l'affichage 
    // Postcondition : le String est un unicode avec : "1403" = triangle , "25A0" = carré , "2B24" = cercle, "26C1"= cylindre
    var forme : String {get}


}


class Piece : TPiece {

	private var _nom: String 
	private var _couleur : String 
	private var _forme : String 

	var nom : String {return self.nom}
	var couleur : String {return self.couleur}
	var forme : String {return  self.forme}


    //RAJOUT DU PARAMETRE forme DANS LE INIT (MANQUANT)
	init(_ nom : String,_ couleur : String,_ forme : String) {
		self._nom = nom
		self._couleur = couleur
		self._forme = forme
	}
}