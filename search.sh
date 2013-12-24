#!/bin/bash
k=0
if [ $2 -eq 0 ]
then
curl --silent "http://drupal.org/search/apachesolr_multisitesearch/$1&filters=ss_meta_type%3Amodule?page=$k" > .search.txt
else
while [ $k -lt $2 ]
do
curl --silent "http://drupal.org/search/apachesolr_multisitesearch/$1&filters=ss_meta_type%3Amodule?page=$k" >> .search.txt
k=$((k+1))
#echo "Got page $k"
done
fi

while read line
do
temp=$(echo $line | cut -c1-4)
#echo -e "$line \n\n"

if [ "$temp" == "<dd>" ]
then
      read line
      read line
      str=$line
      last=$(echo $line | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//')
      #reverse string
     # last=$(echo $line )
   #  echo -e "$last \n"
     lasttemp=$(echo $last | cut -c1-4)
      while [ "$lasttemp" != ">p/<" ]
        do
            read line
            if [ "$line" != "" ]
            then
              str=$str" "$line
            fi
            last=$(echo $line | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//')
            lasttemp=$(echo $last | cut -c1-4)
        done
echo "$str" >>.readline.txt
#echo -e "\n"
fi
#echo -e "$temp"
done < .search.txt

sed -i "s/<strong>//g" .readline.txt

sed -i "s/<\/strong>//g" .readline.txt

echo -e "Got modules' description successfully"

grep "<a href=\"http://drupal.org/project" ./.search.txt > .search1.txt

sed -i "s/<a\ href=\"http:\/\/drupal.org\/project\// /g" .search1.txt

sed -i "s/>\"/ /g" .search1.txt

sed -i "s/<\/a/ /g" .search1.txt

sed -i "s/>/ /g" .search1.txt

sed -i "s/\"/ /g" .search1.txt

cat .search1.txt | awk '{print $2" "$3" "$4" "$5" "$6"("$1")"}' > .search.result

echo -e "Got modules' name successfully"

paste ./.search.result ./.readline.txt > .search.txt

sed -i "s/<p>/\n/g" .search.txt

sed -i "s/<\/p>/\n/g" .search.txt

cat .search.txt

rm -f .readline.txt .search.result .search.txt .search1.txt
