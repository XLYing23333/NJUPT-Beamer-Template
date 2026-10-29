<p align="center">
  <img src="assets/demo-page.jpg" alt="NJUPT Beamer demo slides">
</p>

<h1 align="center">NJUPT Beamer Template</h1>

<p align="center">
  <a href="https://www.latex-project.org/"><img src="https://img.shields.io/badge/LaTeX-Beamer-008080?logo=latex&amp;logoColor=white" alt="LaTeX Beamer"></a>
  <a href="https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop"><img src="https://img.shields.io/badge/VS%20Code-LaTeX%20Workshop-007ACC?logo=visualstudiocode&amp;logoColor=white" alt="VS Code LaTeX Workshop"></a>
</p>

<p align="center">
  <a href="README.md">中文</a> · <a href="template/demo.pdf">View demo PDF</a> · <a href="#quick-start">Quick start</a> · <a href="#project-skills">Project skills</a>
</p>

A LaTeX Beamer theme styled for Nanjing University of Posts and Telecommunications. The shared theme and demo live in `template/`; each presentation can have its own source and assets under `project/`.

## Features

- NJUPT logo, title-page banner and background, with title, section, and closing pages.
- Chinese and English content, with adjustable font size and line spacing on ordinary frames.
- Load the shared theme by relative path without copying the theme or logos.
- VS Code / LaTeX Workshop configuration and project-level Codex skills.

<p align="center">
  <img src="assets/demo2.jpg" alt="Demo 2" width="32%">
  <img src="assets/demo3.jpg" alt="Demo 3" width="32%">
  <img src="assets/demo4.jpg" alt="Demo 4" width="32%">
</p>

## Requirements

Install a LaTeX distribution, `latexmk`, and XeLaTeX. Chinese mode also requires the platform's Chinese font: Noto Serif CJK SC on Linux, SimSun on Windows, or Songti SC on macOS.

## Quick start

### 1. Build the demo

```bash
cd template
latexmk -xelatex demo.tex
```

You can also view [demo.pdf](template/demo.pdf).

### 2. Create a presentation

Create a separate folder under `project/` for each presentation, for example:

```bash
mkdir -p project/proj1
```

Create `project/proj1/slide.tex`:

```tex
\documentclass{beamer}
\usepackage[njupt, zh]{../../template/collegebeamer}

\title{NJUPT Beamer Presentation}
\subtitle{Presentation}
\author{Your Name}
\date{\today}

\begin{document}
\maketitle

\section{Introduction}

\begin{frame}{Example}
  This is the first slide.
\end{frame}

\QApage{}
\end{document}
```

NJUPT is the default theme; use the `bnu` option for Beijing Normal University or `polyu` for PolyU. The theme loads its assets from `template/assets/`. Adjust the relative `\usepackage` path if the source is nested more deeply.

### 3. Build and clean

Build Chinese slides from their source directory:

```bash
cd project/proj1
latexmk -xelatex slide.tex
```

Alternatively, open the repository root in VS Code, install the recommended LaTeX Workshop extension, and use the **XeLaTeX (latexmk)** recipe. Output is placed alongside the source.

From the repository root, clean intermediate files for a source while keeping PDF and SyncTeX files:

```bash
./.vscode/clean-linux.sh project/proj1/slide.tex
```

## Tables and charts

The theme provides the `NJUPTtable` environment and `\NJUPTtoprule`, `\NJUPTmidrule`, and `\NJUPTbottomrule` for grouped tables with double outer rules. It supports `tabularx`, `\multirow`, and `\cline`. Charts use PGFPlots; the `njupt chart` style supplies theme colors and grid lines. See [demo.tex](template/demo.tex) for a table, single- and multi-series line charts, a line-and-pie layout, and a bar chart. Chart data is specified in the TeX source and rendered as static PDF graphics.

## Frame scaling

Set the font size and line spacing for ordinary frames in the preamble, for example:

```tex
\setbeamerzoom{0.8}
```

The default is `1`; the factor must be positive. Font size commands and block text within ordinary frames also scale. Title, section, subsection, `\QApage`, and `\bibliographpage` pages are unaffected. Fixed-size images, margins, and spacing are not scaled automatically.

To retain the original font sizes on a custom special page, use a local group:

```tex
{\collegebeamerSpecialFrame
\begin{frame}{Special page}
  Page content
\end{frame}
}
```

## Project skills

In Codex, use a project folder name as the identifier:

| Skill | Purpose | Example |
| --- | --- | --- |
| [create-new-slide](.agents/skills/create-new-slide/SKILL.md) | Create and focus a presentation project | `$create-new-slide proj2` |
| [focus-slide](.agents/skills/focus-slide/SKILL.md) | Locate and focus an existing project | `$focus-slide proj1` |

## Repository layout

```text
.
├── template/                  # Shared theme, assets, and demo
│   ├── collegebeamer.sty
│   ├── demo.tex
│   └── assets/
├── project/                   # Create a separate folder for each presentation
├── .agents/skills/            # Project-level Codex skills
├── .vscode/                   # LaTeX Workshop configuration and clean scripts
└── assets/                    # README images
```

Project contents under `project/` are ignored by Git; `.gitkeep` retains the directory.

## Acknowledgements

This theme is based on the following projects:

- [SINTEF Presentation](https://www.overleaf.com/latex/templates/sintef-presentation/jhbhdffczpnx)
- [college-beamer](https://github.com/liu-qilong/college-beamer)

## License

See [LICENSE.md](LICENSE.md).
