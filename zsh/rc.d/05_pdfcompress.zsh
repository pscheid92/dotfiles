# pdfcompress path/to/file[.pdf] -> path/to/file_compressed.pdf
pdfcompress() {
    local base="${1%.pdf}"
    local input="${base}.pdf"
    local output="${base}_compressed.pdf"

    [[ -f "$input" ]] || { echo "pdfcompress: $input not found" >&2; return 1 }

    echo "${output}"

    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/printer \
        -dNOPAUSE -dQUIET -dBATCH \
        -sOutputFile="$output" "$input"
}
