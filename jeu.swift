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
    // Précondition :  PeutPoser(Jeu,Piece,x,y) =True
    // Résultat : Renvoie le jeu modifié avec une nouvelle pièce posée sur le plateau
    // et le nombre de pièces du joueur réduite d'une. 
    // Postcondition : Retire la piece au joueur ( retirerPiece(p : p))
    mutating func Placer( j : inout Joueur, p : Piece, x : Int, y : Int) 

    // LigneRemplie : Jeu x Int  -> Bool
    // Informe si la ligne est complétée
    // Paramètre : Jeu, Int 
    // Précondition : 0<=x<=3
    // Précondition : x le numéro de la ligne
    // Renvoie True si la ligne ne possède pas de pièce de la même forme que l’autre joueur. False sinon
    func LigneRemplie( x : Int) -> Bool

    // ColonneRemplie : Jeu x Int  -> Bool
    // Informe si la colonne est complétée
    // Paramètre : Jeu, Int
    // Précondition : 0<=y<=3
    // Précondition : y le numéro de la colonne
    // Renvoie True si la colonne ne possède pas de pièce de la même forme que l’autre joueur. False sinon
    func ColonneRemplie( y : Int) -> Bool

    // ZoneRemplie : Jeu x Int x Int -> Bool 
    // Informe sur la possibilité de poser la pièce du joueur sur la zone correspondante. 
    // Paramètre : Jeu, Int, Int. 
    // Précondition : x le numéro de la ligne , y le numéro de la colonne
    // Précondition : 0<=x,y<=3
    // Renvoie True si la zone ne possède pas de pièce de la même forme que l’autre joueur. False sinon
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


struct Jeu : TJeu {


    var grille : [[Piece]]
    private var j1 : Joueur
    private var j2 : Joueur

    // init : -> Jeu
    // Fonction de création du jeu et de 2 joueurs de couleurs différentes
    // Et détermine aléatoirement le premier joueur qui deviendra le joueur courant
    // Initialise un tableau de 4x4 qui pour toutes coordonées x et y renvoie Vide 
    // avec 0 <= x,y <= 3
    // Postcondition : Renvoie le Jeu avec 2 joueurs de couleurs différentes qui chacun possède 8 pièces de leurs couleurs 
    // composées de 2 carrés, 2 cercles , 2 cylindres , 2 triangles 
    init() {
        j1 = Joueur("33")
        j2 = Joueur("96")
        grille = [[Piece]](repeating:[Piece](repeating:Piece, count: 4), count(4)) //Init a null
    }

    
    // jCourant : Jeu -> Joueur
    // Paramètre : Jeu
    // Postcondition : Renvoie le joueur courant de la partie 
    // Renvoie le joueur courant  
    var jCourant : Joueur  { get }


    func CaseVide( x : Int, y : Int) throws Bool{
        if (x < 4 && y < 4) {
            return grille[x][y] == nil
        } else {
            throw erreur.mauvaiseCoordonnees
        }
    }

    // LigneDispo : Jeu x Joueur x Piece x Int  -> Bool 
    // Paramètre : Jeu, Joueur le joueur courant
    // Paramètre : Pièce : la pièce séléctionnée par le joueur 
    // Paramètre : x de type Int 
    // Précondition : PieceDispo(Joueur,Piece)=True
    // Précondition : x le numéro de la ligne est compris entre 0 et 3 
    // Renvoie True si la ligne ne possède pas de pièce de la même forme que l’autre joueur. False sinon 
    func LigneDispo ( j : Joueur , p : Piece , x : Int)  -> Bool
        for i in range(0..4) {
            var pieceTempo : Piece = getPiece(x, i)
            //cas si une piece déjà placé a le meme nom et la couleur du joueur adverse
            if (pieceTempo.nom == p.nom && pieceTempo.couleur != j.couleur) {
                return False
            }
        }
        return True

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
    // Précondition :  PeutPoser(Jeu,Piece,x,y) =True
    // Résultat : Renvoie le jeu modifié avec une nouvelle pièce posée sur le plateau
    // et le nombre de pièces du joueur réduite d'une. 
    // Postcondition : Retire la piece au joueur ( retirerPiece(p : p))
    mutating func Placer( j : inout Joueur, p : Piece, x : Int, y : Int) 

    // LigneRemplie : Jeu x Int  -> Bool
    // Informe si la ligne est complétée
    // Paramètre : Jeu, Int 
    // Précondition : 0<=x<=3
    // Précondition : x le numéro de la ligne
    // Renvoie True si la ligne ne possède pas de pièce de la même forme que l’autre joueur. False sinon
    func LigneRemplie( x : Int) -> Bool

    // ColonneRemplie : Jeu x Int  -> Bool
    // Informe si la colonne est complétée
    // Paramètre : Jeu, Int
    // Précondition : 0<=y<=3
    // Précondition : y le numéro de la colonne
    // Renvoie True si la colonne ne possède pas de pièce de la même forme que l’autre joueur. False sinon
    func ColonneRemplie( y : Int) -> Bool

    // ZoneRemplie : Jeu x Int x Int -> Bool 
    // Informe sur la possibilité de poser la pièce du joueur sur la zone correspondante. 
    // Paramètre : Jeu, Int, Int. 
    // Précondition : x le numéro de la ligne , y le numéro de la colonne
    // Précondition : 0<=x,y<=3
    // Renvoie True si la zone ne possède pas de pièce de la même forme que l’autre joueur. False sinon
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

