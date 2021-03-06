#/bin/bash

for filepath in ${@:2};do
    dir=`dirname $filepath`
    filename=${filepath##/}
    file=${filename%.}
    csvfile=$dir/$file.csv
    touch $csvfile
    djiparsetxt $filepath >$csvfile
done

mkdir $dir/image
mkdir $dir/CSV
mv $dir/*.csv $dir/CSV

ls $1 | grep embedded* | while read img;do
    mv $1/$img $dir/image
done

