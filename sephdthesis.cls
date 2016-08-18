\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sephdthesis}[2016/09/09 Document Class for writing Swedish style PhD Theses]
\def\@sephdthesis@setpapersize@gfive{%
  \setstocksize{239mm}{169mm}
  \settrimmedsize{239mm}{169mm}{*}
  \ifpdf
  \else
    \special{papersize=169mm,239mm}
  \fi
%\settypeblocksize{43pc}{31pc}{*} % For better looking first pages, also comment out setheaderspaces and setheadfoot
\settypeblocksize{40pc}{26pc}{*} % For full text
}
\DeclareOption{g5paper}{\def\sephdthesis@trimmedsize{gfive}}
\DeclareOption{a3paper}{\OptionNotUsed}\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{a6paper}{\OptionNotUsed}\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b3paper}{\OptionNotUsed}\DeclareOption{b4paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}\DeclareOption{b6paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}\DeclareOption{ebook}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{g5paper} \ProcessOptions\relax
\LoadClass[a4paper]{memoir}%,showtrims
\AtBeginDocument{\RequirePackage{graphicx}}
\@nameuse{@sephdthesis@setpapersize@\sephdthesis@trimmedsize}
\setlrmargins{*}{*}{*}
\setulmargins{*}{*}{*}
\setheaderspaces{*}{25pt}{*}
\setheadfoot{12pt}{37pt}
\checkandfixthelayout

%%%%% Packages
\usepackage{fontspec}
\usepackage[swedish,english]{babel}
\usepackage{graphicx}
\usepackage[comma,square,sort&compress]{natbib}
%%%%% End of Packages

\setsecnumdepth{subsection}

%%%%%
\nouppercaseheads %Makes it so that the case of the header text is not modified
%%%%%

%%%%% Definitions for identification
\def\address{\gdef\theaddress}
\def\country{\gdef\thecountry}
\def\covertext{\gdef\thecovertext}
\def\defenddate{\gdef\thedefenddate}
\def\defendplace{\gdef\thedefendplace}
\def\degree{\gdef\thedegree}
\def\degreetitle{\gdef\thedegreetitle}
\def\department{\gdef\thedepartment}
\def\disseries{\gdef\thedisseries}
\def\email{\gdef\theemail}
\def\faculty{\gdef\thefaculty}
\def\fulltext{\gdef\thefulltext}
\def\institution{\gdef\theinstitution}
\def\isbn{\gdef\theisbn}
\def\issn{\gdef\theissn}
\def\keywords{\gdef\thekeywords}
\def\logotype{\gdef\thelogotype}
\def\opponent{\gdef\theopponent}
\def\printer{\gdef\theprinter}
\def\subtitle{\gdef\thesubtitle}
\let\thesubtitle\relax
\def\shorttitle{\gdef\theshorttitle}
\def\thesistype{\gdef\thethesistype}
\def\webaddress{\gdef\thewebaddress}
%%%%% End of Definitions for identification

%%%%% Nice titlepage layout
\makepagestyle{sephdabstract}
\makeevenhead{sephdabstract}{}{}{}
\makeoddhead{sephdabstract}{}{}{}
\makeoddfoot{sephdabstract}{}{\normalfont\scriptsize
  \def\@maybebullet{\if@bullet\space\textbullet\space\fi}
  \newif\if@bullet \@bulletfalse
  \@ifundefined{theissn}{}{\@maybebullet\theissn\@bullettrue}%
  \@ifundefined{theisbn}{}{\@maybebullet\theisbn\@bullettrue}%
}{}
%%%%% End of Nice titlepage layout

%%%%% Bibliography page style
\copypagestyle{bib_style}{ruled}
\makeoddhead{bib_style}{}{}{}
%%%%% End bibliography page style

%%%%% Paper page style
\def\currentpaper{\gdef\thecurrentpaper}
\def\currentcitation{\gdef\thecurrentcitation}
\currentpaper{None}
\currentcitation{}
\copypagestyle{p_style}{ruled}
\makeevenhead{p_style}{}{\begin{footnotesize}\thecurrentcitation\end{footnotesize}}{}
%\makeoddhead{p_style}{}{}{\secmark\rightmark}
\makeevenfoot{p_style}{\thecurrentpaper-\thepage}{}{}
\makeoddfoot{p_style}{}{}{\thecurrentpaper-\thepage}
%\makepsmarks{p_style}{\createmark{chapter}{left}{nonumber}{}{}}
%%%% End paper page style

%%%%% Title page and copyright page
\def\maketitle{%
  \begingroup
  \sffamily
  \thispagestyle{sephdabstract}
  \noindent
  \parbox[b][0.80\textheight]{\textwidth}{\centering\noindent
    \@ifundefined{thedisseries}{}{\thedisseries}\par\vskip12mm
    \Huge\bfseries\thetitle\par
    \vskip4mm
    \LARGE\mdseries\thesubtitle\par
    \vfill
    \noindent\bfseries\large\MakeUppercase{\theauthor}\@ifundefined{thedegreetitle}{}{, \thedegreetitle}\par
    \mdseries
    \vfill
    \scalebox{0.3}{\includegraphics{\thelogotype}}\par
    \vskip8mm
    \large\thethesistype\par\thedate\vskip12mm
    \normalsize\thedepartment\\\theinstitution, \thecountry\par
  }\par
  \rmfamily
  \vfill\noindent
  \parbox[c][0.1\textheight]{\textwidth}{\centering%
    {\bfseries Faculty opponent}\par\theopponent
  }
  \newpage\thispagestyle{cleared}
  \noindent\parbox[t][0.2\textheight]{\textwidth}{%
    The public defense of this thesis for the degree \thedegree\ will, with due permission
    from the \thefaculty\ at \theinstitution, take place in \thedefendplace, on \thedefenddate.\par\vskip5mm
  }
  \hbox{}\vfill
  \@ifundefined{thecovertext}{}{%
    \noindent
    \parbox[b][0.2\textheight]{0.66\textwidth}{\flushleft%
      Cover:\par
      \textsl\thecovertext
    }
    \vskip3cm
  }
  \par\bigskip\noindent
  \@ifundefined{thefulltext}{}{%
    A full text electronic version of this thesis is available at
    \par\noindent \thefulltext
    \par\bigskip\noindent
  }%
  Typeset using \LaTeX\ and the template \emph{SE-PhDThesis},\\
  adapted from work by Erik Hedström and available at:\\
  \url{https://github.com/SkyToGround/SE-PhDThesis}.\par\smallskip\noindent
  Printed by: \theprinter
  \par\bigskip\noindent
  \copyright\space\thedate\space\theauthor\space(pages 1--\thelastpage)
  \@ifundefined{theemail}{}{\\\theemail}
  \@ifundefined{thewebaddress}{}{\\\thewebaddress}
  \par\bigskip\noindent
   \@ifundefined{theissn}{}{\theissn\\}
   \@ifundefined{theisbn}{}{\theisbn\\}
  \thedepartment, \theinstitution\\
  \theaddress, \thecountry
  
  \par\bigskip\noindent
  \cleardoublepage
  \endgroup
}
%%%%% End of Title page and copyright page

%%%%% Contents
\renewcommand\tableofcontents{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\contentsname}
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
  }
%%%%% End of Contents

%%%%% Sans serif chapters, sections, subsections, and subsubsections
\renewcommand{\chapnamefont}{\huge\sffamily\bfseries}
\renewcommand{\chapnumfont}{\huge\sffamily\bfseries}
\renewcommand{\chaptitlefont}{\Huge\sffamily\bfseries}
\setsecheadstyle{\Large\sffamily\raggedright}
\setsubsecheadstyle{\large\sffamily\raggedright}
\setsubsubsecheadstyle{\normalsize\sffamily\raggedright}
%%%%% End of Sans serif chapters, sections, subsections, and subsubsections


