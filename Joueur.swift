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



class Joueur : TJoueur {
   
    private (set) var listePieces : [Piece]

    required init(couleur : String){
        self.couleur = couleur
        self.listePieces = [Piece(nom : "ca",couleur : couleur, forme : "25A0"),
        Piece(nom : "ca",couleur : couleur,forme : "25A0"),
        Piece(nom : "cy",couleur : couleur,forme : "26C1"),
        Piece(nom : "cy",couleur : couleur,forme : "26C1"),
        Piece(nom : "ce",couleur : couleur,forme : "2B24"),
        Piece(nom : "ce",couleur : couleur,forme : "2B24"),
        Piece(nom : "tr",couleur : couleur,forme : "1403"),
        Piece(nom : "tr",couleur : couleur,forme : "1403")]
    }


    private (set) var couleur : String  
    
    
    func PieceDispo(nom : String) -> Bool  {
        var res : Bool = false

        if !(nom == "ce" || nom == "ca" || nom == "cy" || nom == "tr") { 
            fatalError("ce n'est pas une forme de pièce !!!!!") 
        }
        else { 
             for p in listePieces {
                 if (p.nom == nom){
                      res = true
                }
            }
           
        }
        return res
    }
   
    func PieceRestantes() -> [Piece] {
        return self.listePieces
    }


    // peutJouer : Jeu x Joueur -> Bool
    // Informe sur la possibilité du joueur de poser une pièce sur le plateau
    // Paramètres : Jeu , Joueur 
    // Renvoie True si avec les pièces restantes que le joueur possède, il peut jouer. False sinon 
    // -> vérifier qu'au moins une case PeutPlacer( j : Joueur, p : Piece, x : Int, y : Int) -> Bool
    func peutJouer(jeu : Jeu) -> Bool {
       var res : Bool = false
       var l : Int = 0
       var c : Int = 0
       while !res && i < listePieces.count { //je teste toutes les pieces restantes tant que j'en ai pas trouvé une qui peut jouer
         while !res && (l < 4){
             while !res && (c < 4){
                 if j.PeutPlacer( p : listePieces[i], x : c, y : l){
                     res = true
                 }
                 c+=1
             }
             l+=1
             c = 0
         }
          i+=1  
          l = 0

       }
    }

   func retirerPiece(p : Piece) {
        guard self.listePieces.contains(p)/*je vérifie qu'il a bien la pièce à enlever */ else { fatalError("Pièce absente !!!!!")}
        var i : Int = 0
		var fin : Bool = false
		
		while i<listePieces.count && !fin {
		
			if listePieces[i] == p {
				fin = true
			}
			else {
				i+=1
			}
		}
		listePieces.remove(at : i)		
    }

 
    func stringToPiece (nom : String) -> Piece { 
        var res : Piece? 
        guard (nom == "ce" || nom == "ca" || nom == "cy" || nom == "tr") else { 
            fatalError("mauvaise forme !!!!!")
        }
        guard PieceDispo(nom : nom) else {  fatalError(" pièce absente!!!!!") }
        for p in listePieces {
            if (p.nom == nom){
                res = p
            }
        }
        if let toto = res {
            return toto
        } else { fatalError("pas de résultat  -_- ")} 
    }
}