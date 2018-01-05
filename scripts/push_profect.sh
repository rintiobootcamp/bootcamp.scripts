#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel sera cloner tous les projets
repository_dir=$1

cd "$repository_dir"
rm -rf src/main/resources/local/
rm -rf src/main/resources/dev/
rm -rf src/test/resources/local/
rm -rf src/test/resources/dev/
rm -rf target/ log*
mvn clean
git add --all
git commit -m "Tous est OK"
git push origin dev
git checkout -b release_1.4.0
git push origin release_1.4.0

