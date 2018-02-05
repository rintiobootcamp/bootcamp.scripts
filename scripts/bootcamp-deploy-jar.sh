#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel ont a cloner tous les projets
repository_dir=$1

#Un tableau contenant le nom de tous les projets qui generent un jar
projets_jars=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws")


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
        mvn clean install deploy -P dev -DskipTests
     fi
done
