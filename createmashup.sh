#!/bin/bash
rdom () { local IFS=\> ; read -d \< E C ;}
dos2unix customXml/item1.xml 0&> /dev/null
while rdom; do
	if [[ $E == DataMashup* ]]; then
		echo $C
		exit
	fi
done < customXml/item1.xml
