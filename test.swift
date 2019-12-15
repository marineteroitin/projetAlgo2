// Jeu est la representation du plateau de jeux
// Dans ce plateau, les coordonées x et y représentent respectivement les lignes et les colonnes. 
// Ces coordonnées sont comprises entre 0 et 3 inclus 
protocol TJeu {
	// init : -> Jeu
	// Fonction de création du jeu et de 2 joueurs de couleurs différentes
    // Et détermine aléatoirement le premier joueur qui deviendra le joueur courant
    // Initialise un tableau de 4x4 qui pour toutes coordonées x et y renvoie Vide 
    // avec 0 <= x,y <= 3
    // Postcondition : Renvoie le Jeu avec 2 joueurs de couleurs différentes qui chacun possède 8 pièces de leurs couleurs 
    // composées de 2 carrés, 2 cercles , 2 cylindres , 2 triangles 
	init()

    
    // jCourant : Jeu -> Joueur
    // Paramètre : Jeu
    // Postcondition : Renvoie le joueur courant de la partie 
    // Renvoie le joueur courant  
    var jCourant : Joueur  { get }

    // CaseVide : Jeu x Int x Int -> Bool 
	// Renvoie un booléen afin de savoir si la case est vide ou pas  
	// Paramètre : Jeu : le plateau 
    // Paramètre : x,y : deux entiers 
	// Precondition 0 <= x,y <= 3  , Jeu = 4x4 
	// Précondition : x numéro de ligne, y numéro de colonne
	// Résultat : Renvoie True si aucune pièce n’est posée sur la case (x,y)
	func CaseVide( x : Int, y : Int) -> Bool 

    // LigneDispo : Jeu x Joueur x Piece x Int  -> Bool 
	// Paramètre : Jeu, Joueur le joueur courant
    // Paramètre : Pièce : la pièce séléctionnée par le joueur 
    // Paramètre : x de type Int 
	// Précondition : PieceDispo(Joueur,Piece)=True
	// Précondition : x le numéro de la ligne est compris entre 0 et 3 
	// Renvoie True si la ligne ne possède pas de pièce de la même forme que l’autre joueur. False sinon 
	func LigneDispo ( j : Joueur , p : Piece , x : Int)  -> Bool 

    // ColonneDispo : Jeu x Joueur x Piece x Int  -> Bool 
	// Informe sur la possibilité de poser la pièce du joueur sur la colonne correspondante. 
	// Paramètre : Jeu, Joueur le joueur courant
    // Paramètre : Pièce : la pièce séléctionnée par le joueur 
    // Paramètre : y de type Int
	// Précondition : PieceDispo(Joueur,Piece)=True et y le numéro de la colonne comprise entre 0 et 3 incluse
	// Renvoie True si la colonne ne possède pas de pièce de la même forme que l’autre joueur. False sinon 
	func ColonneDispo( j : Joueur , p : Piece, y : Int ) -> Bool 

    // ZoneDispo : Jeu x Joueur x Piece x Int x Int   -> Bool 
	// Informe sur la possibilité de poser la pièce du joueur sur la zone correspondante. 
	// Param : Jeu, Joueur, Pièce, x de type Int, y de type Int
	// Précondition : PieceDispo(Joueur,Piece)=True et x, la ligne ,y la colonne, comprisent entre 0 et 3 inclus
	// Résultat :  Renvoie True si la zone ne possède pas de pièce de la même forme que l’autre joueur. False sinon 
	func ZoneDispo( j : Joueur , p : Piece, x : Int, y : Int ) -> Bool

    // PeutPlacer : Jeu x Joueur x Piece x Int x Int -> Bool
    // renvoie un booléen afin de savoir si le joueur peut poser sa pièce sur la case. 
    // Donc il test si on a bien ZoneDispo, ColonneDispo, LigneDispo,CaseVide et PieceDispo 
    // Ecrit un message d'erreur dans la console selon le type d'erreur :
    // ZoneDispo = false ou ColonneDispo = false ou LigneDispo = fasle ou CaseVide = false ou PieceDispo = false
    // Param : Jeu , Joueur, Piece , x ,y 
    // Précondtion : CaseVide(Jeu,x,y) = True  , PieceDispo(Joueur,Piece) = True  , 
    // Précondition : x numéro de ligne, y numéro de colonne
    // Résultat : Renvoie vrai si la pièce peut être placée Sinon faux
    func PeutPlacer( j : Joueur, p : Piece, x : Int, y : Int) -> Bool

    // Placer : Jeu x Joueur x Piece x Int x Int ->  Jeu
    // Fonction qui place la pièce du joueur
    // Précondition :  PeutPlacer(Jeu,Piece,x,y) =True
    // Résultat : Renvoie le jeu modifié avec une nouvelle pièce posée sur le plateau
    // et le nombre de pièces du joueur réduite d'une. 
    // Postcondition : Retire la piece au joueur ( retirerPiece(p : p))
    mutating func Placer( j : inout Joueur, p : Piece, x : Int, y : Int) 

    // LigneRemplie : Jeu x Int  -> Bool
    // Informe si la ligne est complétée
    // Paramètre : Jeu, Int 
    // Précondition : 0<=x<=3
    // Précondition : x le numéro de la ligne
    // Renvoie True si toute la ligne à ses cases remplies
    func LigneRemplie( x : Int) -> Bool

    // ColonneRemplie : Jeu x Int  -> Bool
    // Informe si la colonne est complétée
    // Paramètre : Jeu, Int
    // Précondition : 0<=y<=3
    // Précondition : y le numéro de la colonne
    // Renvoie True si toute la colonne à ses cases remplies
    func ColonneRemplie( y : Int) -> Bool

    // ZoneRemplie : Jeu x Int x Int -> Bool 
    // Informe sur la possibilité de poser la pièce du joueur sur la zone correspondante. 
    // Paramètre : Jeu, Int, Int. 
    // Précondition : x le numéro de la ligne , y le numéro de la colonne
    // Précondition : 0<=x,y<=3
    // Renvoie True si toute la zone à ses cases remplies
    func ZoneRemplie(x : Int, y : Int) -> Bool

    // estFini : Jeu x Int x Int -> Bool
    // Fonction qui permet de savoir si le jeu est fini  
    // Précondition : x et y coordonnées de la dernière pièce placée 
    // Résultat : renvoie vrai si LigneRemplie(jeu,x,y) = true ou ColonneRemplie(jeu,x,y) = true ou ZoneRemplie(jeu,x,y) = true , false sinon
    func estFini( x : Int, y : Int) -> Bool

    // joueurSuivant : Jeu -> Jeu
    // Fonction qui permet de modifier le joueur courant.
    // Postcondition : jCourant != joueurSuivant()
    mutating func joueurSuivant()  

    // getPiece : Jeu x Int x Int -> Piece|Vide
    // Renvoie la pièce présente sur la case entrée en paramètre
    // Si CaseVide(x:x,y:y)=True alors renvoie Vide 
    // Paramètre : x la ligne et y la colonne
    func getPiece( x : Int, y : Int) -> Piece?

}



class Jeu : TJeu {


    private var _grille : [[Piece?]]
    private var _j1 : Joueur
    private var _j2 : Joueur

     var jCourant : Joueur // OBLIGE DE METTRE UN SET CAR ON MODIFIE LA LISTE DES PIONS DU  JOUEUR COURANT QD IL PLACE UN PION !!


    // init : -> Jeu
    // Fonction de création du jeu et de 2 joueurs de couleurs différentes
    // Et détermine aléatoirement le premier joueur qui deviendra le joueur courant
    // Initialise un tableau de 4x4 qui pour toutes coordonées x et y renvoie Vide 
    // avec 0 <= x,y <= 3
    // Postcondition : Renvoie le Jeu avec 2 joueurs de couleurs différentes qui chacun possède 8 pièces de leurs couleurs 
    // composées de 2 carrés, 2 cercles , 2 cylindres , 2 triangles 
    required init() {

        self._j1 = Joueur(couleur : "33")
        self._j2 = Joueur(couleur : "96")
        self._grille = [[Piece?]](repeating:[Piece?](repeating:nil, count: 4), count: 4) //Init a nil
        let nb = Bool.random() //donne 0 ou 1
        if nb {self.jCourant = _j1}
        else {self.jCourant = _j2}
    }

    func CaseVide( x : Int, y : Int) -> Bool{
        if (x < 4 && y < 4 && y >= 0 && x >= 0) {
            return _grille[x][y] == nil
        } else {
            fatalError("coordonés hors grille !!!!!")
        }
    }


    func LigneDispo ( j : Joueur , p : Piece , x : Int) -> Bool {
        if !(x < 4 && x >= 0) {
            fatalError("coordonés hors grille !!!!!")
        } else {
            return Dispo(j : j, p : p, tab : _grille[x])
        }
    }

    func ColonneDispo( j : Joueur , p : Piece, y : Int ) -> Bool{
        if !( y < 4 && y >= 0 ) {
            fatalError("coordonés hors grille !!!!!")
        } else {
            var tab : [Piece?] = []
            for i in 0..<4 {
                //transforme une colonne en un tableau
                tab.append(getPiece(x : i,y : y))
            }
            return Dispo(j : j, p : p, tab : tab)
        }
    }

    private func Dispo(j : Joueur, p : Piece , tab : [Piece?]) -> Bool {
        var dispo : Bool = true
        for i in 0..<4 {
            //cas si une piece déjà placé a le meme nom et la couleur du joueur adverse
            if (tab[i] == p ){
                if let nv = tab[i] { //je fais rien si c'est vide }
                    if (nv.couleur != j.couleur) {
                         dispo = false
                    }
                }
            }
        }
        return dispo
    }

    // ZoneDispo : Jeu x Joueur x Piece x Int x Int   -> Bool 
    // Informe sur la possibilité de poser la pièce du joueur sur la zone correspondante. 
    // Param : Jeu, Joueur, Pièce, x de type Int, y de type Int
    // Précondition : PieceDispo(Joueur,Piece)=True et x, la ligne ,y la colonne, comprisent entre 0 et 3 inclus
    // Résultat :  Renvoie True si la zone ne possède pas de pièce de la même forme que l’autre joueur. False sinon 
    func ZoneDispo( j : Joueur , p : Piece, x : Int, y : Int ) -> Bool {
        if !(x < 4 && y < 4 && y >= 0 && x >= 0) {
           fatalError("coordonés hors grille !!!!!")
        } else {
            var tab : [Piece?] = [Piece?](repeating:nil, count: 4)
            var coord : [Int] = region(x : x, y : y)
            var compteur : Int = 0

            for i in (coord[0])...(coord[0]+1) {
                for j in (coord[1])...(coord[1]+1) {
                    tab[compteur] = getPiece(x : i,y : j)
                    compteur += 1
                }
            }
            return Dispo(j : j, p : p, tab : tab)
        }
    }

    // PeutPlacer : Jeu x Joueur x Piece x Int x Int -> Bool
    // renvoie un booléen afin de savoir si le joueur peut poser sa pièce sur la case. 
    // Donc il test si on a bien ZoneDispo, ColonneDispo, LigneDispo,CaseVide et PieceDispo 
    // Ecrit un message d'erreur dans la console selon le type d'erreur :
    // ZoneDispo = false ou ColonneDispo = false ou LigneDispo = fasle ou CaseVide = false ou PieceDispo = false
    // Param : Jeu , Joueur, Piece , x ,y 
    // Précondtion : CaseVide(Jeu,x,y) = True  , PieceDispo(Joueur,Piece) = True  , 
    // Précondition : x numéro de ligne, y numéro de colonne
    // Résultat : Renvoie vrai si la pièce peut être placée Sinon faux
    func PeutPlacer( j : Joueur, p : Piece, x : Int, y : Int) -> Bool {
        var res : Bool = false
        if let nv = getPiece(x : x,y : y){
           //la case est non vide donc je peux pas placer donc res reste à false
        } else {
            res = (ZoneDispo( j : j, p : p, x : x, y : y) && LigneDispo( j : j, p : p, x : x) && ColonneDispo( j : j, p : p, y : y))
        }
        return res
    }



    // ORAL ERREUR PeutPLacer et pas PeutPoser dans préconditions
    func Placer( j : inout Joueur, p : Piece, x : Int, y : Int) {
        if !PeutPlacer(j : j, p : p, x :x, y : y){
           fatalError("Tu peux pas poser ta pièce ici !!!!!!")
        }else{
            _grille[x][y] = p
            j.retirerPiece(p : p)
        }

    }

  

    //ORAL ERREUR SUR CE QUE DOIT RENVOYER LA FONCTION CAR COPIER/COLLER DE LIGNEDISPO -> Renvoie True si toute les cases de la ligne sont remplies
    //IDEM POUR LES AUTRES FONCTIONS REMPLIE
    func LigneRemplie( x : Int)-> Bool{
         if !(0<=x && x<=3){ 
            fatalError("coordonés hors grille !!!!!") }
        else {
            var i : Int = 0
            var res : Bool = true
            while i<4 && res {
                if CaseVide(x:x,y:i) {
                    res = false
                }
                i+=1
            }
           return res
        }
    }

    
    func ColonneRemplie( y : Int) -> Bool {
         if !(0<=y && y<=3){ 
            fatalError("coordonés hors grille !!!!!") }
        else {
            var i : Int = 0
            var res : Bool = true
            while i<4 && res {
                if CaseVide(x:i,y:y) {
                    res = false
                }
                i+=1
            }
           return res
        }
    }

    //fonction qui permet de retourner en haut à gauche d'une région
    private func region(x : Int, y : Int) -> [Int]{
        return [(x/2*2),(y/2*2)]
    }

    func ZoneRemplie(x : Int, y : Int) -> Bool {

        if !(0<=x && x<=3) && !(0<=y && y<=3) { 
           fatalError("coordonés hors grille !!!!!") }
        else { 
            var res : Bool = true
            //récupérer les coordonnée en haut à gauche de la zone
            var coord : [Int] = region(x : x, y : y)
            var l : Int = coord[0]
            var c : Int = coord[1]


            while res && ((l <= coord[0]+1) && (c <= coord[1]+1)) { //je n'ai pas trouvé de case vide et je ne suis pas en bas à droite de ma zone
                if CaseVide(x:l,y:c) {
                    res = false
                }
                c = c+1 //passe à la colonne suivante
                if c > coord[1]+1 { // passe à la ligne suivante
                    c = coord[0]
                    l = l+1 }
            }
            return res

        }

    }

   
    // Précondition : x et y coordonnées de la dernière pièce placée A VERIFIER ??????
    // ORAL DIRE OUBLIE -> Précondition : 0<=x,y<=3
    func estFini( x : Int, y : Int) -> Bool {
        if !(0<=x && x<=3) && !(0<=y && y<=3) { 
           fatalError("coordonés hors grille !!!!!") }
        else {
             return LigneRemplie( x : x) || ColonneRemplie( y : y) || ZoneRemplie(x : x, y : y) }
    }

    
    func joueurSuivant(){
        if jCourant === _j1 { jCourant = _j2 }
        else { jCourant = _j1 }
    }  

    
    func getPiece( x : Int, y : Int) -> Piece?{
        if CaseVide(x:x,y:y) { return nil }
        else { return _grille[x][y] }
    }

}

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
// Le protocole Piece représente les différentes pièces présentes dans le jeu. 
// Chaque joueur possède 2 pièce de chaque forme. 
// La création de pièce ne sera effectué qu'en début de partie
protocol TPiece {
    // init : String x String -> Piece
    // Initialise une pièce grâce a son nom et sa couleur 
    // Paramètre : nom de type string correspondant à la forme de la piece (  "ce" = Cercle ou "ca" = Carre ou "cy" = Cylindre ou "tr" = Triangle)
    // Paramètre : couleur correspondant a la couleur de la pièce 
    // Cette fonction ne peut pas être utilisé autre qu'en début de partie (fileprivate)
    init(nom : String, couleur : String, forme : String )

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

// ============================ Fonctions utilitaires =================================================
// Fonction qui permet de lire un entier 
// Post condition : l'entier est entre 0 et 3
func lireNombre() -> Int {
	var entierOk = false
	var i : Int = -1
	while (!entierOk){
		if let input = readLine() {
		    if let int = Int(input) {
		    	if( int >= 0 && int <= 3 ) {
		    		entierOk=true
		    		i = int
		    	} 
		    }else {
		    		print(" La coordonnée doit être en 0 et 3 inclut, veuillez retaper : ")
		    }
		}
	}
	return i

}

// jeuToString : Jeu -> [[String]] 
// Fonction qui permet de créer un tableau de string de l'état du jeu
// PostCondition : tab tableau de string contenant ou - si la case et vide ou la forme colorée du joueur 
func jeuToString(j : Jeu) -> [[String]]{
	var tab : [[String]] = [["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"]]
	for x in 0...3{
		for y in 0...3 {
			let pTmp : Piece? = j.getPiece(x : x ,y : y)
			if let piece = pTmp {
				let couleur : String = piece.couleur
				if piece.nom == "tr"{
					tab[x][y] = "\u{1B}["+couleur+"m\u{1403}\u{1B}[0m"
				}
				
				else if piece.nom == "ca" {
					tab[x][y] = "\u{1B}["+couleur+"m\u{25A0}\u{1B}[0m"
				}
				else if piece.nom == "ce" {
					tab[x][y] = "\u{1B}["+couleur+"m\u{2B24}\u{1B}[0m"
				}
				else {
					tab[x][y] = "\u{1B}["+couleur+"m\u{26C1}\u{1B}[0m"
				}
			}
		}
	}
	return tab
}

// afficher : [[String]] 
// fonction qui affiche les lignes du tableau
// Precondition : tab :tableau de string contenant  "-" si la case est vide ou la forme colorée du joueur 
func afficher( tab : [[String]])  {
	var message : String = ""
	for i in 0..<4{
		for j in 0..<4{
			message += tab[i][j] + " " 
		}
			message += "\n"
		}
		print(message)
}

// ============================ Programme principal =================================================
// Déroulement du programe principal 

// Initialisation de la partie 
var jeu : Jeu = Jeu()
var estFini : Bool = false

print(" le ",jeu.jCourant.couleur, " commence")

while !estFini {
	// Affichage du jeu chaque tour
	afficher(tab : jeuToString( j : jeu))
	var aJoue = false

	// Boucle pour réaliser un tour de jeu 
	while (!aJoue){
		// Affichage du joueur courant et de ses pièces restantes
		print("Le joueur : " , jeu.jCourant.couleur ," place sa pièce " )
		for p in jeu.jCourant.PieceRestantes() {
			print (" Les pièces disponibles sont : ", p.nom)
		}
		


		// Choix de la pièce
		print("Quel pièce voulez-vous choisir ? (ce : Cercle - ca : Carre - cy : Cylindre - tr : Triangle")
		var pieceOk : Bool = false


		var pieceString : String = ""
		var piece : Piece? = nil // OUBLI D'INITIALISER !!!!
		//Boucle qui vérifie si le string en entrée (readLine) est correct 
		while(!pieceOk){
			if let _piece = readLine() {
				
				let _piece = _piece.lowercased()
				if( _piece == "ca" || _piece == "ce" || _piece == "cy" || _piece == "tr"){
					//pieceOk = true
					pieceString  = _piece

					if jeu.jCourant.PieceDispo(nom : pieceString) { // SI la piece appartient au joueur
						 piece = jeu.jCourant.stringToPiece(nom : pieceString )
						 pieceOk = true
					}
				}			
			}else { 
	    		print(" Le nom de la piece doit être ca,ce,cy ou tr. veuillez retaper : ")
	    	}
		}
		

		

		// Choix de la coordonnée x
		print("Coordonnées x : ")
		let x = lireNombre()

		// Choix de la coordonnée y
		print("Coordonnées y : ")
		let y = lireNombre()

		// Vérifie si le joueur peut placer sa piece 
		var peutPlacer : Bool = false
		if let _piece = piece { peutPlacer  = jeu.PeutPlacer(j : jeu.jCourant, p : _piece, x : x, y : y) }
		//si piece vide on fait rien

		// Place la piece si c'est possible et s'il confirme
		if(peutPlacer) {
			if let _piece = piece {
				print ("Confirmer le placement : ", _piece , " ,x : " , x , " ,y : " , y , " ? ( oui/o ou autre pour non")
				if let ok = readLine() {
					let ok = ok.lowercased()

					if( ok == "oui" || ok == "o" ){
						jeu.Placer(j : &jeu.jCourant, p : _piece, x : x, y : y)
						aJoue = true 

						// Vérification si la partie est finie
						if (jeu.estFini(x : x, y : y) ) {
							print(jeu.jCourant.couleur , " a gagné !!!!!!")
							estFini = true
						}
						// Change de joueur si le jeu n'est pas fini 
						else { 
							let jprec : Joueur = jeu.jCourant
							jeu.joueurSuivant()
							// Vérifie que le nouveau joueur peut jouer sinon le jeu est fini 
							if( !jeu.jCourant.peutJouer(jeu : jeu)) {
								print(jprec.couleur , " a gagné !!!!!!")
							}
						}
					}	
				}
			}
		}
		// Si le joueur n'a pas pu placer sa pièce retour en boucle aJoue
		else {
			print("Parametre incorrect ")
		}

	}// Fin de boucle aJoue

}// Fin de boucle estFini  



