#!/usr/bin/env bash
#!/usr/bin/env bash
#!/usr/bin/env bash
repository_dir=$1
profile=$2

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