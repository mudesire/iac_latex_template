\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iac}[2020/09/08 International Astronautical Congress conference paper LaTeX class]

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsfonts}

\LoadClass[twocolumn,letter paper,10pt]{article}
\RequirePackage[margin=1in,top=1.25in,headheight=\baselineskip]{geometry} % page layout
\RequirePackage{graphicx}
%\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{overcite}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[explicit,compact]{titlesec}
\RequirePackage[normalem]{ulem}
\RequirePackage{etoolbox}
\RequirePackage{alphalph}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,urlcolor=black}
\urlstyle{same}

\renewcommand{\headrulewidth}{0pt}
%% Add section numbers in arabic rather than roman 5%
\renewcommand*\sectionmark[1]{\markright{\thesection.\ #1}}

\newcounter{authcount}
\newcommand{\IACauthor}[2]{%
	\stepcounter{authcount}%
	\csdef{iac@author\theauthcount}{#1}%
	\csdef{iac@affiliation\theauthcount}{#2}}

\newcommand{\IACemail}[1]{%
    \emph{\uline{\url{#1}}}
}

\setlength\parindent{12pt}
\RequirePackage[]{caption}
\captionsetup[figure]{name=Fig.,format=hang,indention=-20pt}
\captionsetup[table]{format=hang,indention=-24pt}

\titlespacing{\section}{0pt}{*3}{*1.5}
\titlespacing{\subsection}{0pt}{*2.5}{*0.5}
\titlespacing{\subsubsection}{12pt}{*2}{*0.5}
\titleformat{\section}{\normalfont}{\bfseries\thesection.\ }{0.5em}{{\textbf{\textsc{#1}}}}
\titleformat{\subsection}{\normalfont}{\thesection.\arabic{subsection}}{0.5em}{\textit{{#1}}}
\titleformat{\subsubsection}{\normalfont}{\thesection.\arabic{subsection}.\arabic{subsubsection}}{0pt}{\textit{\uline{#1}}}

\renewcommand{\abstract}[1]{\def\iac@abstract{#1}}
\newcommand{\IACkeywords}[6]{\def\iac@keywords{\textbf{keywords:} #1, #2, #3, #4, #5, #6}}
\newcommand*{\IACpaperyear}[1]{\def\iac@paperyear{#1}}\IACpaperyear{}
\newcommand*{\IACpapernumber}[1]{\def\iac@papernumber{#1}}\IACpapernumber{}
\newcommand*{\IACconference}[1]{\def\iac@conference{#1}}\IACconference{}
\newcommand*{\IACcopyright}[1]{\def\iac@copyright{#1}}\IACcopyright{}
\newcommand*{\IAClocation}[1]{\def\iac@location{#1}}\IAClocation{}

\newcommand{\IACcopyrightA}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. All rights reserved.}}
\newcommand{\IACcopyrightB}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. Published by the International Astronautical Federation with permission.}}
\newcommand{\IACcopyrightC}{\def\iac@copyright{This material is declared a work of the U.S.\ Government and is not subject to copyright protection in the United States.}}
\newcommand{\IACcopyrightD}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. The U.S.\ Government has a royalty-free license to exercise all rights under the copyright claimed herein for Governmental purposes. All other rights are reserved by the copyright owner.}}
\newcommand{\IACcopyrightDAPL}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. Under the copyright claimed herein, the U.S.\ Government has a royalty-free license to exercise all rights for Governmental purposes. All other rights are reserved by the copyright owner.}}
\newcommand\iac@makecopyright{{\iac@copyright}}

\renewcommand\maketitle{\twocolumn[
  \begin{@twocolumnfalse}
  \lhead{}\chead{\footnotesize \iac@conference th International Astronautical Congress-- {\iac@location}.\\ \iac@makecopyright}\rhead{}%
  \lfoot{IAC-\iac@paperyear-\iac@papernumber}\cfoot{}\rfoot{Page \thepage\ of \pageref{LastPage}}%
  \begingroup
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
  \end{@twocolumnfalse}
  ]}
\def\@maketitle{%
  \newpage
  \begin{center}%
    IAC-\iac@paperyear-\iac@papernumber\par%
    \vskip1em
    {\large \textbf{\@title} \par}%
  \end{center}%
    %\vskip 1.5em%
  {\large
      %\lineskip .5em%
      \newcounter{authnum}%
          \makeatletter
          { \setcounter{authnum}{0}
              \whileboolexpr
              { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
              {\stepcounter{authnum}%
                	\normalsize\textbf{\csuse{iac@author\theauthnum}} %
        	   }%
          }\makeatother
           \par%
           \vskip 1.5ex%
          \makeatletter
         {\setcounter{authnum}{0}
              \whileboolexpr
              { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
              {\stepcounter{authnum}%
                   \normalsize\csuse{iac@affiliation\theauthnum}\par%
              }%
         }%
         \makeatother
}%
\vskip 1.5ex%
* Corresponding Author
\vskip 1.5ex%
\indent\iac@abstract\par%
\vskip 1.5ex%
\indent\iac@keywords\par%
\vskip 4.5ex}%
\pagestyle{fancy}%

\makeatletter
\newcommand*{\fnsymbolsingle}[1]{%
  \ensuremath{%
    \ifcase#1%
    \or *%
    \or \dagger
    \or \ddagger
    \or \mathsection
    \or \mathparagraph
    \else
      \@ctrerr
    \fi
  }%
}
\makeatother
\newalphalph{\fnsymbolmult}[mult]{\fnsymbolsingle}{}
\renewcommand*{\thefootnote}{%
  \fnsymbolmult{\value{footnote}}%
}
\makeatletter
	\def\tagform@#1{\maketag@@@{[#1]\@@italiccorr}}
\makeatother
\endinput


\DeclareMathOperator{\E}{E}
\DeclareMathOperator{\prob}{p}
\DeclareMathOperator{\tr}{tr}

\newcommand{\etalia}{\textit{et al.}}
\newcommand*{\vectornorm}[1]{\left\|#1\right\|}
\newcommand*\rfrac[2]{{{}^{#1}\!/_{#2}}} % running fraction with slash - requires math mode.
\newcommand*\T{\mathsf{T}}


