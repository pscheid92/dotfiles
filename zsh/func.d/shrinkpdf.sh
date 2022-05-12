shrinkpdf() {
     OUTPUT="${2:-output.pdf}"
     \gs -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$OUTPUT" "$1"
}

