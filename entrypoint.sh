#!/bin/bash
# Convert markdown and asciidoc files passed on the command line to PDF
ARGS="$@"
for f in ${ARGS}; do
    ext=$(echo ${f##*.} | tr A-Z a-z)
    if [ "$ext" == "md" ]; then
        kramdoc --attribute text-align=left --format=GFM ${f}
        asciidoctor-pdf ${f%%md}adoc
    else
        asciidoctor-pdf ${f}
    fi
done
