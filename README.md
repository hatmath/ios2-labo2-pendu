# ENTÊTE
   
    Projet:  LABORATOIRE 2 : LE JEU DU PENDU
    Codeurs: Simon Turcotte (2395412) et Mathieu Hatin (2296939)
    Cours : DÉVELOPPEMENT D'APPLICATIONS MOBILES SOUS IOS 2 (420-292-AH)

# ÉNONCÉ/DESCRIPTION

	OBJECTIF
	Le but de ce laboratoire est de mettre en pratique les notions de navigation. 
	
	ÉVALUATION
	Le laboratoire est noté selon la qualité du code et du projet avec le barème ci-dessous. 
	Vous devez remettre un fichier zip qui contient votre projet et le nommer : NNNp_NNNp_201234567_201234567_labo2.zip,
	où ‘NNN’ sont les trois premières lettres de votre nom de famille, ‘p’ est la première lettre de votre prénom, 
	et 201234567 est votre matricule. 
	
	RESSOURCES	
	1) Sauver et charger un dictionnaire dans « UserDefaults » :
		a. Basic : HS lien
		b. Avancé : lien Cocoacasts TRAVAIL DEMANDÉ

	Vous devez coder un jeu du pendu : lien. 
	Ce jeu consiste à deviner un mot lettre par lettre en faisant moins de six erreurs en devinant des mauvaises lettres.
	
	Important : Vous n’êtes pas obligé de dessiner le pendu dans votre app, 
	vous pouvez simplement afficher un compteur d’erreurs (0/6, 1/6, etc.).
	
	Votre app aura deux modes de jeu (le fonctionnement est décrit plus bas):
	1. un jeu de pendu avec des mots de dictionnaire en anglais,
	2. un jeu avec des titres de films
	
	On accède aux modes de jeu à travers des onglets d’un « tabController ». Le « tabController » contient trois onglets : 
	les deux modes de jeu, et un onglet « stats » (pour les statistiques)
	Voici les deux API à utiliser et le fonctionnement du jeu associé:
	1. Mot de dictionnaire : https://random-word-api.herokuapp.com/word
		o Fonctionnement classique
	2. Titre de film : https://www.omdbapi.com/ (fait au laboratoire précédent)
		o Fonctionnement classique mais il y aura des indices qui s’affiche en plus o Utiliser la recherche par id avec 
			une valeur aléatoire entre tt0000001 et tt0055252
		o Après deux erreurs, vous devez donner l’année de parution (champ « Released »)
		o après quatre erreurs, vous devez donner le « rating », et le « genre »
		o après 5 erreurs, vous devez, idéalement, donner le réalisateur (maximum deux) et les acteurs (maximum trois)
	
	Sauvegarde des données :
	Si un utilisateur joue pour la première fois ou bien s’il bat un meilleur score alors il faut sauvegarder son nom, 
	son score, et son type de jeu (mot de dictionnaire ou titre de film) de manière persistante. 
	
	Vous pouvez utiliser UserDefaults(), ou un fichier, en choisissant le modèle de données qui convient.
	
	Navigation : <image dans pdf>

    	BARÈME
	Important : Vous n’êtes pas obligé de dessiner le pendu dans votre app, vous pouvez simplement afficher un compteur d’erreurs (0/6, 1/6, etc.).
	
 	Voici le barème approximatif :
 
	Barème 															[%]
	Mode de jeu « Mot du dictionnaire »											30
	Mode de jeu « Titre de films »												30
	Mode administrateur (faire « Score » avec « User Default », « Préférences » est un mock)				15
	Respect du modèle MVC													10
	Qualités du code et de la app												15

# BUG À CORRIGER AVANT LA REMISE
