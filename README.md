# make_arxiv_submission
Generates a ready to submit arxiv zip file out of your paper.

Just call `bash generate_arxiv_zip.bash` at the root of your paper folder containing your latex source code:

```bash
cd $ROOT
git clone https://github.com/ToniRV/make_arxiv_submission.git
mkdir arxiv
./make_arxiv_submission/generate_arxiv_zip.bash
```

where `$ROOT` is the directory of your latex paper.

You will see a `arxiv_submission.zip` file appear in your `$ROOT` directory.
Just upload this file to arxiv!

## ToDos:

Currently assumes:
- An `arxiv` folder is already created: just do `mkdir arxiv`.
- It is an IEEE submission and `IEEE.cls` files are present (easy to remove in script provided).
- Expects `main.tex`, `main.bbl` (so the latex source code must be compiled, and not weirdly named).
