---
name: focus-slide
description: Locate and work on an existing presentation using its folder name under project/.
---

# Focus a slide project

Treat the supplied folder name as the project identifier under `project/`. Accept only a single directory name, not a path or `.` or `..`. If no name is supplied, ask for one. Find the exact directory and inspect its `.tex` sources and relevant local assets; do not create a missing project. If the directory is missing, report it. If multiple sources exist, use the user's context to select one or ask which to use when necessary.

Use the located directory as the scope for the user's requested work, and follow the repository's `AGENTS.md` for theme paths, building, and cleanup. A request only to locate or focus a project does not by itself authorize content changes. Report the identified path and relevant sources.
