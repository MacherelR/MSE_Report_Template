\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{heig-tb}[2020/06/23 HEIG-VD Bachelor Thesis]

\LoadClass[11pt,a4paper,twoside,final]{book}

\def\builddir{build}
\def\graphicsExt{pdf}
\def\assetsdir{\builddir/assets/figures}
\def\assetsdirnotbuilded{./assets/figures}

\RequirePackage[T1]{fontenc}
\RequirePackage[main=french,english]{babel}


\RequirePackage[fleqn]{amsmath}
\RequirePackage[small,bf,textfont=it]{caption}
\RequirePackage{appendix}
\RequirePackage{cellspace}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{fmtcount}
\RequirePackage{framed}
\RequirePackage{glossaries}
\RequirePackage{graphicx}
\RequirePackage{lastpage}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage{lmodern}
\RequirePackage{makeidx}
\RequirePackage{mdframed}
\RequirePackage{morefloats}
\RequirePackage{multicol}
\RequirePackage{nomencl}
\RequirePackage{parskip}
\RequirePackage{rotating}
\RequirePackage{siunitx}
\RequirePackage{tabularx}
\RequirePackage{tikz}
\RequirePackage{bold-extra}
\RequirePackage{ifthen}
\RequirePackage{expkv-cs}
\RequirePackage[outputdir=build,chapter]{minted}

\RequirePackage[
  backref=true,
  backend=biber,
  style=alphabetic,
  sorting=ynt
  ]{biblatex}

\RequirePackage[
  a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=3cm,
  right=4cm,
  headheight=6mm,
  headsep=5mm,
  marginparwidth=3cm,
  marginparsep=4mm,
  heightrounded,
  includehead]{geometry}

\definecolor{linkcolor}{RGB}{219, 48, 122}
\RequirePackage[
  colorlinks=true,
  plainpages=true,
  linkcolor=black,
  citecolor=black,
  plainpages=false,
  urlcolor=linkcolor]{hyperref}

\RequirePackage{csquotes}

\usetikzlibrary{babel}
\usemintedstyle{colorful}
\setminted{frame=single,fontsize=\footnotesize}

\newcommand{\clearemptydoublepage}{%
	\newpage{\thispagestyle{empty}\cleardoublepage}}

\def\cleardoublepage{\clearpage\ifodd\c@page\else
  \null\thispagestyle{empty}\newpage\fi}

\setlength{\parindent}{0pt}
\setlength\parskip{\medskipamount}

%% Configuration de listings (minted est néanmoins préféré)
\lstset{%
language=C, % Vous pouvez choisir le langage de votre choix
breaklines=true,
breakatwhitespace=false,
basicstyle=\footnotesize\sffamily}

%% Settings
\def\subtitle#1{\def\@subtitle{#1}}
\def\teacher#1{\def\@teacher{#1}}
\def\genre#1{\def\@genre{#1}}
\def\field#1{\def\@field{#1}}
\def\signature#1{\def\@signature{#1}}

\def\printsignature{\includegraphics[width=4cm]{
  \assetsdir/\@signature.\graphicsExt}
}


%% Première page de couverture
\renewcommand\maketitle{%
\pagenumbering{empty}
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
  \node[anchor=north west,yshift=-2cm,xshift=2cm]%
      at (current page.north west)
      {\includegraphics[height=2cm]{assets/logos/heig-vd-baseline.pdf}};
  \node[anchor=south east,yshift=1.5cm,xshift=-1.5cm]%
      at (current page.south east)
      {\includegraphics[height=1cm]{assets/logos/hes-so.pdf}};
\end{tikzpicture}
\vspace{4cm}
\begin{center}%
\reset@font
\sffamily
{\usefont{T1}{lmss}{bx}{n}\huge\selectfont\@title\\\vspace{0.5em}
\large{\@subtitle}\par}%
\vskip 5em%
\vskip 5em%
\else
\vskip 10em%
\fi
{\large
\vskip 5em%
\begin{tabular}[t]{c}%
\@author%
\end{tabular}\par}%
\vskip 1em%
{\large \@date}%
\vskip 4cm%

\end{center}%
\par%
\vskip 1.5em%
}

% Annexes
\renewcommand\appendixpagename{Annexes}

\renewcommand\listoflistingscaption{Liste des codes sources}
\renewcommand{\nomname}{Liste des Symboles}

\fancypagestyle{headings}{
\fancyhf{}
\fancyhead[LO]{\textsl{\rightmark}}
\fancyhead[RE]{\textsl{\leftmark}}
\ifdefined\@confidential
\fancyfoot[RO]{\MakeUppercase{\@confidential}}
\fancyfoot[LE]{\MakeUppercase{\@confidential}}
\fi
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

\pagestyle{headings}


\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.0ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-2.5ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\itshape}}

%% Marginal Note
\newcommand\maraja[1]{%
  \mbox{}%
  \marginpar{\raggedright \tiny#1}%
  \ignorespaces
}

%% Figure macros
\newcommand\fig[2][]{\fig@kv{short={#2},#1}{#2}}
\ekvcSplitAndForward\fig@kv\fig@out
  {
    % defaults here
     short = {}% will get set for each call to match the caption argument
    ,internal-label = {} % empty, not for direct use (easier that way)
    ,place = tbp
    ,...
  }
\ekvcSecondaryKeys\fig@kv
  {
     nmeta H = place=H % shortcut
    ,meta label = internal-label=\label{#1} % wraps \label around the value
    % add more keys you want to be handled special here
  }
\newcommand\fig@out[6]
  {%
    \begin{figure}[#3]
      \centering
      \includegraphics[#4]{\assetsdir/#6}%
      \caption[{#1}]{#5#2}%
    \end{figure}%
  }

%% Asterism
\newcommand{\asterism}{\vspace{1em}
\hfill\smash{%
    \raisebox{-.5ex}{%
      \setlength{\tabcolsep}{-.5pt}%
      \begin{tabular}{@{}cc@{}}%
        \multicolumn2c*\\[-2ex]*&*%
      \end{tabular}}}\hfill\vspace{1em}}

%% Locutions
\def\pex{p.~ex.~}
\def\cad{c.-à-d.~}
\def\cf{cf.~}