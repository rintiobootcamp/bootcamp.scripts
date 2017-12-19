#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel sera cloner tous les projets
repository_dir=$1

#Un tableau contenant le nom de tous les projets 
projets=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws" "bootcamp.rest.service.client" "categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "liketable.service.fonctionnel" "note.service.fonctionnel" "debat.service.fonctionnel"  "censure.service.fonctionnel" "sondage.service.fonctionnel" "notification.generator.services" "notification.diffusion.services" "preference.service.fonctionnel" "programme.service.fonctionnel" "projet.service.use.case" "categorie.service.use.case")

#Declaration de la methode clone_project qui permet de parcourir le tableau de projet defini en haut
#Pour chaque ittération du tableau on accede au dossier ou l'on doit cloner les projets 
#On affiche ensuite un message ------------------------------ clone  $projet  project----------------------------------------
#Avec $projet l'ittération en cours du tableau
#Enfin on lance la commande git clone 
push_project () {
    for projet in ${projets[@]}
        do
	 if [ -d "$projet" ]
	 then
            	# $1 paramet  er is the name of the project to clone
            	cd "$repository_dir/$projet"
	    	rm -rf src/main/resources/local/
	    	rm -rf src/main/resources/dev/
	    	rm -rf src/test/resources/local/
	    	rm -rf src/test/resources/dev/
            	#mvn clean install deploy -P dev
            	echo "------------------------------ git checkout $branch - $projet  project----------------------------------------"
	    	git branch
            	echo "------------------------------ git status  $projet  project----------------------------------------"
	    	git status
            	echo "------------------------------ git add --all  $projet  project----------------------------------------"
	    	git add --all 
	    	echo "------------------------------ git commit  $projet  project----------------------------------------"
	    	git commit -m "Corection effectuer sur le server le $(date)"
	   	echo "------------------------------ git push origin $branch -  $projet  project----------------------------------------"
	    	git push origin
	fi
    done
}

#Execution de la fonction clone_project
push_project
