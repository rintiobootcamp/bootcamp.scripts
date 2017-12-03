#!/usr/bin/env bash
repository_dir=$1
#username=$2
#password=$3
branch=$2

projets=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws" "bootcamp.rest.service.client" "categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "projet.service.use.case" "categorie.service.use.case")
projets_jars=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws" "bootcamp.rest.service.client")
projets_wars=("categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "projet.service.use.case" "categorie.service.use.case")
wars_path="/bootcamp/wars/"

if [ -d "$repository_dir" ]
then
    rm -R "$repository_dir"
fi

sudo mkdir -p "$repository_dir"
sudo chmod -R 777 "$repository_dir"


clone_project () {
    for projet in ${projets[@]}
        do
            # $1 paramet  er is the name of the project to clone
            cd "$repository_dir"
            echo "------------------------------ clone  $projet  project----------------------------------------"
            git clone https://github.com/rintiobootcamp/"$projet".git -b "$branch"
    done
}

clone_project