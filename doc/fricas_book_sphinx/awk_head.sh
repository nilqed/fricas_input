for a in ./temp0/section*.rst ; do hd.awk $a >  ./temp/$(basename $a) ; done