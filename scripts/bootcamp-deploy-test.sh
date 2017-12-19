#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel ont a cloner tous les projets
repository_dir=$1

#deuxieme parametre representant le profil avec lequel les commandes mvn clean install vont s'exécuté
profile=$2

#Un tableau contenant le nom de tous les projets qui generent un jar
projets_jars=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws")

#Un tableau contenant le nom de tous les projets qui generent un war
projets_wars=("categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "liketable.service.fonctionnel" "note.service.fonctionnel"  "debat.service.fonctionnel"  "censure.service.fonctionnel" "sondage.service.fonctionnel" "notification.generator.services" "notification.diffusion.services" "preference.service.fonctionnel" "programme.service.fonctionnel" )

#On verifie si le repertoire dans lequel ont a cloner tous les projets existe
#Et On sort du script si le repertoire n'existe
if [ ! -d "$repository_dir" ]
then
    exit
fi


for projet_jar in ${projets_jars[@]}
   do
	if [ -d "$repository_dir" ]
	then
	    cd "$repository_dir/$projet_jar"
	    rm -rf src/main/resources/local/
	    rm -rf src/main/resources/dev/
       	    rm -rf src/test/resources/local/
	    rm -rf src/test/resources/dev/
	    mvn clean install deploy -P dev  -DskipTests
	fi
done

for projet_war in ${projets_wars[@]}
   do
	if [ -d "$repository_dir" ]
	then
	    cd "$repository_dir/$projet_war"
	    rm -rf src/main/resources/local/
	    rm -rf src/main/resources/dev/
       	    rm -rf src/test/resources/local/
	    rm -rf src/test/resources/dev/
	    mvn clean install deploy -P dev  -DskipTests
	fi
done
