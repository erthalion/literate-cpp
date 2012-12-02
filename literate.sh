awk '/>/ {print substr($0,3)}' $1.lcpp > $1.cpp

echo `cat latex_header` > $1.tex
awk -f convert.awk $1.lcpp >> $1.tex
echo '\end{document}' >> $1.tex
