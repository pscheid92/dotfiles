pdfcompress() {
    BASE=`basename $1 .pdf`

    echo "${BASE}"

    INPUT="${BASE}.pdf"
    OUTPUT="${BASE}_compressed.pdf"

    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/printer \
        -dNOPAUSE -dQUIET -dBATCH \
        -sOutputFile="$OUTPUT" "$INPUT" 
}
