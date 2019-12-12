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

    private (set) var jCourant : Joueur 


    // init : -> Jeu
    // Fonction de création du jeu et de 2 joueurs de couleurs différentes
    // Et détermine aléatoirement le premier joueur qui deviendra le joueur courant
    // Initialise un tableau de 4x4 qui pour toutes coordonées x et y renvoie Vide 
    // avec 0 <= x,y <= 3
    // Postcondition : Renvoie le Jeu avec 2 joueurs de couleurs différentes qui chacun possède 8 pièces de leurs couleurs 
    // composées de 2 carrés, 2 cercles , 2 cylindres , 2 triangles 
    required init() {

        _j1 = Joueur(couleur : "33")
        _j2 = Joueur(couleur : "96")
        _grille = [[Piece?]](repeating:[Piece?](repeating:nil, count: 4), count: 4) //Init a nil
    }

    func CaseVide( x : Int, y : Int) -> Bool{
        if (x < 4 && y < 4 && y >= 0 && x >= 0) {
            return _grille[x][y] == nil
        } else {
            fatalError("coordonés hors grille !!!!!")
        }
    }


    func LigneDispo ( j : Joueur , p : Piece , x : Int) -> Bool {
        if (x < 4 && x >= 0) {
            fatalError("coordonés hors grille !!!!!")
        } else {
            return Dispo(j : j, p : p, tab : _grille[x])
        }
    }

    func ColonneDispo( j : Joueur , p : Piece, y : Int ) -> Bool{
        if ( y < 4 && y >= 0 ) {
            fatalError("coordonés hors grille !!!!!")
        } else {
            var tab : [Piece?]
            for i in 0..<4 {
                //transforme une colonne en un tableau
                tab[i] = getPiece(x : i,y : y);
            }
            return Dispo(j : j, p : p, tab : tab)
        }
    }

    private func Dispo(j : Joueur, p : Piece , tab : [Piece?]) -> Bool {
        var dispo : Bool = true
        for i in 0..<4 {
            //cas si une piece déjà placé a le meme nom et la couleur du joueur adverse
            if (tab[i] == p && tab[i].couleur != j.couleur) {
                dispo = false
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
        if (x < 4 && y < 4 && y >= 0 && x >= 0) {
           fatalError("coordonés hors grille !!!!!")
        } else {
            var tab : [Piece?]
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
        var bool : Bool = false
        if getPiece(x : x,y : y) != nil{
            bool = (ZoneDispo( j : j, p : p, x : x, y : y) && LigneDispo( j : j, p : p, x : x) && ColonneDispo( j : j, p : p, y : y))
        }
        return bool
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

