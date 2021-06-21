#/bin/bash
declare -a filename
mkdir $1/csv
mkdir $1/image
ls $1/DJIFlightRecord_*| while read filepath;do
    filename = basename '$filepath'
    filename = "${filename%.*}"
    echo $filepath
    echo $filename
    touch $1/csv/${filename%.*}.csv
    djiparsetxt $filepath > $1/csv/${filename%.*}.csv
done

mv *jpg $1/image