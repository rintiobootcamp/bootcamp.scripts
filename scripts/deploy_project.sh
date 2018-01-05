#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel ont a cloner tous les projets
repository_dir=$1

cd "$repository_dir"
rm -rf src/main/resources/local/
rm -rf src/main/resources/dev/
rm -rf src/test/resources/local/
rm -rf src/test/resources/dev/
rm -rf target/ log*
mvn clean spring-boot:run -P dev
