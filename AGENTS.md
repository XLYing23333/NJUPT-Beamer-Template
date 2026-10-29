# Repository Guidelines

## Layout

- `template/` contains the shared Beamer theme, its assets, and the compilable `demo.tex` example. `template/assets/NJUPT/` contains the NJUPT logo and background; `template/assets/BNU/` retains the BNU theme assets.
- Put each new presentation in its own `project/proj*/` directory, including its source and presentation-specific assets. Reuse the theme rather than copying it or its assets.
- `.vscode/` contains workspace editor settings; `.vscode/clean-linux.sh` cleans artifacts for one source file.

## Project focus

- Before working on a presentation, establish a focused project in the conversation. If no project has been focused or created and focused, first remind the user to use `$focus-slide <folder-name>` for an existing project or `$create-new-slide <folder-name>` to create one.
- Use the named folder under `project/` as the project scope. Creating a project with `$create-new-slide` also focuses it for subsequent presentation work.

## Creating and building presentations

- From `project/proj*/slide.tex`, load the theme with `\usepackage[njupt, zh]{../../template/collegebeamer}`. A bare `collegebeamer` package name will not find the theme from this directory. Adjust the relative path for deeper directories.
- Every presentation must define at least one `\section` and organize its content under sections. Use the theme’s automatic section contents pages as shown in `template/demo.tex`; do not add a separate full contents page. Put ordinary content after the first section so automatic subtitles do not show section 0. Provide a non-empty subtitle when using the theme title page.
- Build Chinese (`zh`) slides with XeLaTeX, from the source directory: `latexmk -xelatex slide.tex`.
- Build the demo from `template/` with `latexmk -xelatex demo.tex`.
- Clean a specified source from the repository root with `./.vscode/clean-linux.sh project/proj1/slide.tex`. The script preserves PDF and SyncTeX files.
- Never commit LaTeX auxiliary files such as `.aux`, `.log`, `.nav`, `.snm`, `.toc`, `.fls`, `.fdb_latexmk`, `.vrb`, or `.xdv`.

## Theme changes

Keep the NJUPT default visual identity, the optional BNU theme, and the demo working. When changing the theme, verify that a presentation under `project/` can load the style and its assets through the relative path.
