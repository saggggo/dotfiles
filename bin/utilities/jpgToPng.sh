#!/bin/bash

for file in `find . -maxdepth 1 -type f`; do
    from=`basename ${file}`
    to=`basename ${file//jpg/png}`
    echo ${from} "convert to" ${to}
    convert $file ${file//jpg/png}
done
