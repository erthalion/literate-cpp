BEGIN {
    has_code = 0
}
{ if ($0 ~ /%> /){
        print "\\begin{lstlisting}[caption=" substr($0,4) "]\n"
        has_code = 1
    }
    else
    {
        if ($0 ~ />/) { 
            print substr($0,3)
        } 
        else {
            if (has_code == 1) {
                print "\\end{lstlisting}\n" $0
                has_code = 0
            }
            else {
                print $0
            }
        }
    }
}
