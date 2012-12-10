awk '/>/ {print substr($0,3)}' $1.lcpp > $1.cpp

cat latex_header.tex > $1.tex
awk -f convert.awk $1.lcpp >> $1.tex
echo '\end{document}' >> $1.tex
pdflatex $1.tex # >> /dev/null
#rm $1.log $1.aux $1.tex
