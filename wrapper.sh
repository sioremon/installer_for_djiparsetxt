#/bin/bash
mkdir ./csv
mkdir ./image
echo $1
ls $1 DJIFlightRecord_*| while read filename;do
    touch ./csv/${filename%.*}.csv
    djiparsetxt $filename > ./csv/${filename%.*}.csv
done

mv *jpg ./image