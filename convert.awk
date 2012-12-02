BEGIN {
    has_code = 0
}
{ if ($0 ~ />/) { 
    if (has_code == 0) {
        print "\\begin{lstlisting}[label=some-code,caption=Some Code]\n" substr($0,3)
        has_code = 1
    }
    else {
        print substr($0,3)
    }

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
