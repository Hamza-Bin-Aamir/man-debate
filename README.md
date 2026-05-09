# man debate

_man debate_ is a project that aims to create the "man pages" for British Parliamentary debating. It aims to provide an open source, comprehensive, and accessible resource/tool for debaters, coaches, and judges to build cases in British Parliamentary matches or other debates.

## LaTeX output

This repository is structured as a modular LaTeX project that builds:

- A single, full matter file PDF
- Smaller standalone PDFs (e.g. a single Book or Section) for portability and selective reprinting

The layout is print-first (A4, binder-friendly). There are intentionally no printed page numbers. Instead, every page includes:

- A visible version/date
- A per-subsection credit line
- A `TAB:` label intended to tell the printer/binder which physical tab/divider the page belongs under

### Build

You need a LaTeX distribution that includes `latexmk` (e.g. TeX Live).

- Full PDF: `make full`
- Book 01 PDF: `make book-01`
- Standalone Definitions section PDF: `make section-definitions`

Outputs are written to `build/`.

## What is a "matter file"

This is a buzzword that is commonly thrown around by British Parliamentary (BP) debaters to refer to this form of document. "Matter" refers to the content of a case, particularly the arguments, examples, and reasoning. Thus, a "matter file" is a document that already has a bunch of matter stuffed into it.

## What is special about this matter file?

Nothing much really. Although I can argue that this is going to be this living document that makes everyone instantly better at debating by reading it, ultimately, what actually makes you better at debating is by doing things yourself. Including drafting matter files. 

I think this can potentially be a resource for people to sharpen their argumentation skills, but consuming instead of creating is not the way I recommend one goes about it.

Thus, this matter file should probably be a starting point, maybe a place to review cases, but definitely not a replacement for your own drafting and research.

## Contributing Guide
This is an open source project, yes, but it is being maintained by one person. I don't want anyone to contribute with the expectation that it will be merged onto main. This project may lay dormant for long periods during busy times so I'd recommend only contributing if you are doing it for fun, or if you want to share your work with others. If you want to contribute, please fork the repository and make a pull request. I will review it when I can and merge it if I think it's a good fit for the project.

In terms of the content, anything that can be genuinely useful in a debate is cool with me, just please don't make a PR with 50,000 lines of AI slop. In my personal experience and opinion, LLMs are still quite far from getting cases just right, so we're better off heavily scrutinising/manually contributing. 

Quality over quantity is especially important for a file that you can typically only use within 15 minutes of the case.

You (obviously) must also only provide content that is your own original work, or that you have permission to use. Please also make sure to properly cite any sources you use in your contributions.

One last caveat, please keep stuff clean and organised. I don't want to have to go through a PR and be like "oh this is a good argument but it's in the wrong section" or "this is a good argument but it's not formatted properly". If you want your contribution to be merged, please make sure it's in the right section and formatted properly.

## Acknowledgements

BIG, HUGE shoutout to Ryan Lafferty the absolute legend. He is 100% the inspiration for me going on this journey. You should check out his amazing matter file [here](https://drive.google.com/file/d/1dXjcPTffGLBXEM23IAN8-ofQ5W5ekIUq/view) (or [here](https://debate.uwaterloo.ca/resources/advanced/)).

