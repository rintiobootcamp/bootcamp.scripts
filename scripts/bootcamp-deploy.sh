#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel ont a cloner tous les projets
repository_dir=$1

#deuxieme parametre representant le profil avec lequel les commandes mvn clean install vont s'exécuté
profile=$2

#Un tableau contenant le nom de tous les projets 
projets=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws" "bootcamp.rest.service.client" "categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "liketable.service.fonctionnel" "note.service.fonctionnel" "projet.service.use.case" "categorie.service.use.case"  "bootcamp.scripts")

#Un tableau contenant le nom de tous les projets qui generent un jar
projets_jars=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws" "bootcamp.rest.service.client")

#Un tableau contenant le nom de tous les projets qui generent un war
projets_wars=("categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "liketable.service.fonctionnel" "note.service.fonctionnel" "projet.service.use.case" "categorie.service.use.case")

#Variable contenant le repertoire ou sera stocker les wars generer
wars_path="/bootcamp/wars/"

#On verifie si le repertoire dans lequel ont a cloner tous les projets existe
#Et On sort du script si le repertoire n'existe
if [ ! -d "$repository_dir" ]
then
    exit
fi

#sudo mkdir -p "$repository_dir"
#sudo chmod -R 777 "$repository_dir"


copy_war () {
    # $1 parameter is the name of the project to clone
    cd "$repository_dir/$1/target"
    warName=$(echo $1 | sed -e "s/|./-/g")
    cp *.war "$wars_path/$1.war"
}


for projet_jar in ${projets_jars[@]}
   do
      cd "$repository_dir/$projet_jar" ]
      mvn clean install deploy -P $profile
done

for projet_war in ${projets_wars[@]}
   do
      cd "$repository_dir/$projet_war" ]
      mvn clean package -P $profile
      copy_war $projet_war
done