# make_arxiv_submission
Generates a ready to submit arxiv zip file out of your paper.

Just call `bash generate_arxiv_zip.bash` at the root of your paper folder containing your latex source code.

## ToDos:

Currently assumes:
- An `arxiv` folder is already created: just do `mkdir arxiv`.
- It is an IEEE submission and `IEEE.cls` files are present (easy to remove in script provided).
- Expects `main.tex`, `main.bbl` (so the latex source code must be compiled, and not weirdly named).
