#!/usr/bin/awk -f
#$ awk -f rmraw.awk <spoolfile-from-fricas>

# raw html -> skip
#/..raw::/ {print "rawHTML"; next} 
/..raw::/ {skip ; next}

# spad command  -> ::
/<div id="spad/ {printf(".. spadInput\n\n::\n") ; next}  

# spad command  -> ::
/<div class="verbatim/ {printf(".. spadVerbatim\n\n::\n") ; next} 

# math answer -> tex
/<div id="math/ {printf(".. spadMathAnswer\n"); next} 

# math class -> 
/<div class="math/ {printf(".. spadMathOutput\n") ; next}  

# class return type ->
/<div class="retu/ {print ".. spadType"; next}  

# rest <div -> skip
/<div/ {skip ; next}   

#End div's
/<\/div>/ {skip ; next}

#Type -> sunscript
/^Type:/ {gsub( "\r", "" );printf(":sub:%c%s%c\n",96,$0,96) ; next}   

# Rest
{print $0; next}


    