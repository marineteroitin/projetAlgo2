protocol TJoueur {

    //init : String -> Joueur 
    // Fonction de création du joueur a partir de sa couleur qui est différente de l'autre joueur 
    // Postcondition : Initialise sa couleur qui ne change pas et ses 8 pièces composées de  2 carré , 2 cylindre , 2 cercle, 2 triangle et pas d'autres.
    // Postcondition : Toutes les pièces sont aussi de la même couleur que le joueur. 
    init(couleur : String)

    // couleur : Joueur -> String
    // Paramètre : Joueur
    // Renvoie la couleur du joueur en paramètre
    // PostCondition : le string de retour est soit "33" = claire ou "92" = foncée
    // Détail : Cela représente les codes de couleurs pour l'affichage. 
    var couleur : String {get}

    // PieceDispo : Joueur x Sting -> Bool
    // Renvoie un booléen afin de savoir si le joueur possède la pièce passé en string
    // Paramètre : Joueur , String 
    // Précondition : le nom de type String est l'un de ces choix :  "ce" = Cercle ou "ca" = Carre ou "cy" = Cylindre ou "tr" = Triangle
    // Résultat : renvoie True si le joueur possède encore cette pièce, False sinon 
    func PieceDispo(nom : String) -> Bool  

    // PieceRestantes : Joueur -> [Piece]
    // Informe sur les pièces restantes et leur quantités
    // Paramètre : Joueur 
    // Resultat : Renvoie la liste des pièces non jouées du joueur pris en paramètre. 
    // Postcondition : le tableau renvoyé représente les pièces que le joueur possède.
    // Détail : S'il possède 2 carré, alors il y aura 2 fois carré dans la collection. 
    func PieceRestantes() -> [Piece] 


    // peutJouer : Jeu x Joueur -> Bool
    // Informe sur la possibilité du joueur de poser une pièce sur le plateau
    // Paramètres : Jeu , Joueur 
    // Renvoie True si avec les pièces restantes que le joueur possède, il peut jouer. False sinon 
    func peutJouer(jeu : Jeu) -> Bool

    // retirerPiece : Joueur x Piece -> Joueur
    // Retire la piece que le joueur vient de placer de ses pièces restantes 
    // Paramètre : Joueur qui représente le joueur courant 
    // Paramètre : Piece qui représente celle qui vient d'être placée 
    // Précondition : La pièce prise en paramètre a bien été placée 
    // Résultat : Renvoie un joueur avec cette pièce en moins dans sa collection de pièces restantes. 
    mutating func retirerPiece(p:Piece)

    // stringToPiece : Joueur x String -> Piece
    // Fonction qui renvoie la piece correspondante au string recu pour l'input ou bien pour récupérer la pièce du plateau 
    // Paramètre : Joueur, String 
    // Precondition : le string en parametre correspond à :  "ce" = Cercle ou "ca" = Carre ou "cy" = Cylindre ou "tr" = Triangle 
    // Resultat : Renvoie la piece qui a comme nom le paramètre rentré
    func stringToPiece (nom : String) -> Piece
}
