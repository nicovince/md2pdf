# Markdown to PDF

Convert a markdown or an asciidoc file to PDF. The markdown is first converted to asciidoc using `kramdoc`.

## Build image
```shell
docker build -t md2pdf .
```

## Usage
```shell
docker run -it  -v $(pwd):/src -u $(id -u ${USER}):$(id -g ${USER}) -h $(hostname) md2pdf <markdown file>
```
