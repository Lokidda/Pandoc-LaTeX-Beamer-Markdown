 pandoc pre.md --slide-level 2 -t beamer -o pre.tex
 pdflatex main.tex
 pdflatex main.tex
 okular main.pdf
 rm -rf main.aux main.log main.nav main.out main.snm main.toc main.vrb
