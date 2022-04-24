#!bin/bash

echo "Watering Github Garden"

a=0

while [ $a -lt 5 ]
do
   echo $a
   a=`expr $a + 1`

   echo "test" >> ~/notes/github_garden.txt
   git add . && git commit -m "test" && git push
done
