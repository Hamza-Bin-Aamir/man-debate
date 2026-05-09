#!/usr/bin/env bash
set -euo pipefail
mkdir -p src
CALVER=$(date +%y.%m.%d)
SHA=$(git rev-parse --short HEAD 2>/dev/null || echo nogit)
DATE=$(date +%Y-%m-%d)
HUMANDATE=$(date '+%b %d, %Y')
PRINTSPEC="A4, twoside, margin=22mm, loose-leaf binder"
REPO="https://github.com/Hamza-Bin-Aamir/man-debate"
cat > src/buildinfo.tex <<'EOF'
% Auto-generated build info
\renewcommand{\MatterVersion}{%CALVER%+%SHA%}
\renewcommand{\MatterDate}{%HUMANDATE%}
\newcommand{\MatterDateISO}{%DATE%}
\newcommand{\BuildShortSha}{%SHA%}
\newcommand{\PrintSpec}{%PRINTSPEC%}
\newcommand{\RepoURL}{%REPO%}
EOF
sed -i "s|%CALVER%|${CALVER}|; s|%SHA%|${SHA}|; s|%HUMANDATE%|${HUMANDATE}|; s|%DATE%|${DATE}|; s|%PRINTSPEC%|${PRINTSPEC}|; s|%REPO%|${REPO}|" src/buildinfo.tex
printf "Wrote src/buildinfo.tex (version %s+%s)\n" "$CALVER" "$SHA"
