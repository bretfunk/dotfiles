#!bin/bash

echo "Watering Github Garden"

a=0

while [ $a -lt 5 ]
do
   echo "test" >> ~/notes/github_garden.txt
   git add . && git commit -m "test" && git push
   a=`expr $a + 1`

done
