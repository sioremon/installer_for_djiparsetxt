#/bin/bash
mkdir ./csv
mkdir ./image
ls $1 DJIFlightRecord_*| while read filename;do
    touch ./csv/${filename%.*}.csv
    djiparsetxt $filename > ./csv/${filename%.*}.csv
done

mv *jpg ./image