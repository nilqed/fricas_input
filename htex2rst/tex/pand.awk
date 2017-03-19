BEGIN {}
END {}

/^\\begin{fricasmath}/ {
        print "$$"
        next                                                                    
}                                                                               
                                                                                
/^\\end{fricasmath}/ {                                                          
        print "$$"                                                    
        next                                                                    
}               

{print $0}