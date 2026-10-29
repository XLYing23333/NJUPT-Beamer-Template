#!/usr/bin/env bash
# Remove LaTeX intermediate files for one presentation while preserving its PDF
# and SyncTeX files. Usage: ./.vscode/clean-linux.sh path/to/slide.tex
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 path/to/slide.tex" >&2
    exit 2
fi

workspace_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
tex_file=$1

if [[ ! -f "$tex_file" || "${tex_file##*.}" != "tex" ]]; then
    echo "Expected an existing .tex file: $tex_file" >&2
    exit 2
fi

tex_dir=$(cd -- "$(dirname -- "$tex_file")" && pwd -P)
case "$tex_dir/" in
    "$workspace_root"/*) ;;
    *)
        echo "The TeX file must be inside this repository: $tex_file" >&2
        exit 2
        ;;
esac

stem=$(basename -- "$tex_file" .tex)
for extension in aux log out thm toc lof lot bbl blg idx ind ilg nav snm vrb xdv fls fdb_latexmk run.xml bcf; do
    rm -f -- "$tex_dir/$stem.$extension"
done
