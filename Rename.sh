#!/bin/bash

cd $1
for i in view*; do
	mv $i `cat $i | head -n100 | grep -A3 '<div id="bread_crumbs">' | sed 's/^ *//g' | sed -n 3p | sed -e 's/ /_/g' -e 's/\r//g'`".html"
done
