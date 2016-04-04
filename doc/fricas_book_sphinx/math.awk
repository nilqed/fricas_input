#!/usr/bin/awk -f

/.. math::/ {getline;getline; print $0 ; next}

