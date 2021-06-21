#/bin/bash
echo $1
mkdir $1/csv
mkdir $1/image
ls $1/DJIFlightRecord_*| while read filename;do
    touch ./csv/${filename%.*}.csv
    djiparsetxt $filename > ./csv/${filename%.*}.csv
done

mv *jpg ./image