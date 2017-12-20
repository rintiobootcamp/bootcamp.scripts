#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel sera cloner tous les projets
#Un tableau contenant les ports de tous les projets 
ports=("8081" "8082" "8083" "8084" "8085" "8086" "8087" "8088" "8089" "8090" "8091" "8092" "8093")

deadProcess () {
	for port in ${ports[@]}
        do
			occupe=`lsof -i :$port`;
			#echo "$occupe";
			if [ ! -z "$occupe" ]; then
				lsof -i :$port > "$port".txt;
				echo "------------------------------ Port  $port  en cours----------------------------------------";
				echo "$occupe";
				echo "";
				echo "------------------------------ PID du $port  en cours----------------------------------------";
				occupeConcatener="$port";
				ligne=$(grep $occupeConcatener $port.txt | cut -c 7-13);
				echo "";
				echo "$ligne";	
				`kill -9 $ligne`;
				rm "$port".txt;
			fi
		done
}
deadProcess
