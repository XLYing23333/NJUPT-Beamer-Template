---
name: create-new-slide
description: Create a NJUPT Beamer presentation in project/ using the supplied project folder name.
---

# Create a new slide project

Use the supplied folder name as the project identifier under `project/`. Accept only a single directory name, not a path or `.` or `..`. If no name is supplied, ask for one. If the directory already exists, inspect it and avoid overwriting existing files; clarify if the requested creation conflicts with existing content.

Create the presentation in `project/<name>/`, with its own `.tex` source and presentation-specific assets as needed. Load the shared theme with `\usepackage[njupt, zh]{../../template/collegebeamer}`; adjust the relative prefix if the source is nested deeper. Do not copy the theme or its assets. Include actual frames and, if using `\maketitle`, a non-empty subtitle. Follow the user's content and language instructions; otherwise provide a minimal editable starter.

Build Chinese slides from the source directory with `latexmk -xelatex <source>.tex` when the toolchain is available. Report the source path and build result. Consult the repository's `AGENTS.md` for current build and cleanup conventions.
