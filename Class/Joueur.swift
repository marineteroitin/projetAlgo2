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
       var i : Int = 0

       while !res && i < listePieces.count { //je teste toutes les pieces restantes tant que j'en ai pas trouvé une qui peut jouer
         while !res && (l < 4){
             while !res && (c < 4){
                 if jeu.PeutPlacer(j : self, p : self.listePieces[i], x : c, y : l){
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
       return res
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