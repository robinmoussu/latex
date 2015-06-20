\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{custom}[2015/06/16 Custom Class]

%% Article options
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Custom package options
\DeclareOption{sansserif}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass[a4paper]{report}

%% Load additional packages and commands.
\RequirePackage[dvipsnames, x11names, svgnames]{xcolor} % color by name
\RequirePackage{titlesec} % Allows customization of titles
\RequirePackage{graphicx} % Required for including pictures
\RequirePackage{tikz} % Required for drawing custom shapes
\RequirePackage{titling} % use the title many time
\RequirePackage{tikz} % for drawing graphics
\RequirePackage[absolute, overlay]{textpos} % for absolute positioning of graphics
\RequirePackage{calc} % allow dimensions calculations

%\graphicspath{{Pictures/}} % Specifies the directory where pictures are stored

%----------------------------------------------------------------------------------------
%	MAIN TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\contentsmargin{0cm} % Removes the default margin
% Chapter text styling
\titlecontents{chapter}[1.25cm] % Indentation
{\addvspace{15pt}\large\sffamily\bfseries} % Spacing and font options for chapters
{\color{ocre!60}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{ocre}} % Chapter number
{}  
{\color{ocre!60}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number
% Section text styling
\titlecontents{section}[1.25cm] % Indentation
{\addvspace{5pt}\sffamily\bfseries} % Spacing and font options for sections
{\contentslabel[\thecontentslabel]{1.25cm}} % Section number
{}
{\sffamily\hfill\color{black}\thecontentspage} % Page number
[]
% Subsection text styling
\titlecontents{subsection}[1.25cm] % Indentation
{\addvspace{1pt}\sffamily\small} % Spacing and font options for subsections
{\contentslabel[\thecontentslabel]{1.25cm}} % Subsection number
{}
{\sffamily\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number
[] 

%----------------------------------------------------------------------------------------
%	MINI TABLE OF CONTENTS IN CHAPTER HEADS
%----------------------------------------------------------------------------------------

% Section text styling
\titlecontents{lsection}[0em] % Indendating
{\footnotesize\sffamily} % Font settings
{}
{}
{}

% Subsection text styling
\titlecontents{lsubsection}[.5em] % Indentation
{\normalfont\footnotesize\sffamily} % Font settings
{}
{}
{}


%----------------------------------------------------------------------------------------
%	PAGE HEADERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for header and footer configuration

\fancyhead{}
\fancyfoot{}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.\ #1}{}} % Chapter text font settings
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection\hspace{5pt}#1}{}} % Section text font settings
\renewcommand{\footrulewidth}{0pt} % Removes the rule in the footer
\fancypagestyle{plain}{\fancyhead{}\renewcommand{\headrulewidth}{0pt}} % Style for when a plain pagestyle is specified

% Removes the header from odd empty pages at the end of chapters
\makeatletter
\renewcommand{\cleardoublepage}{
\clearpage\ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\thispagestyle{empty}
\newpage
\fi}


\newcommand{\headerlefttext}{%
  \centering
  \textsc{%
    \Large%
    \thetitle%
  }%
}

\newcommand{\headerrighttext}{%
  \centering
  \leftmark%
}

\newlength{\headertextmargin}
\newlength{\headerimagemargin}
\newlength{\headercenterspace}
\newlength{\headercenter}
\newlength{\headerleftheight}
\newlength{\headerleftwidth}
\newlength{\headerrightheight}
\newlength{\headerrightwidth}

\setlength{\headertextmargin}      {1cm}%
\setlength{\headerimagemargin}     {2mm}%
\setlength{\headercenterspace}     {2cm}%
\setlength{\headercenter}          {.35\paperwidth}%

\setlength{\headerleftheight}      {2cm}%
\setlength{\headerrightheight}     {1.5cm}%
\setlength{\headerleftwidth}   {\headercenter-.5\headercenterspace}%
\setlength{\headerrightwidth}  {\paperwidth-\headercenter-.5\headercenterspace}%

\newcommand{\headerdecoration}[1]{
  \begin{textblock*}{\paperwidth}(0mm,0mm) {%
    \begin{tikzpicture}%
      \draw[fill=#1]%
             (0,                                   0) %
          -- (\paperwidth,                         0) %
          -- (\paperwidth,                         -\headerrightheight) %
          -- (\headercenter +.5\headercenterspace, -\headerrightheight) %
          -- (\headercenter -.5\headercenterspace, -\headerleftheight) %
          -- (0,                                   -\headerleftheight)
          -- (0,                                   0);%
    \end{tikzpicture}%
  } \end{textblock*}%
%
}

\newcommand{\headerleftcontent}[2][\headertextmargin]{%
  \begin{textblock*}{\headerleftwidth-2#1}(#1,0pt)%
    \begin{minipage}[t][\headerleftheight][c]{\headerleftwidth-2#1}%
      #2%
    \end{minipage}%
  \end{textblock*}%
}

\newcommand{\headerrightcontent}[2][\headertextmargin]{%
  \begin{textblock*}{\headerrightwidth-2#1}(\headercenter + .5\headercenterspace + #1,0pt)%
    \begin{minipage}[t][\headerrightheight][c]{\headerrightwidth-2#1}%
      #2%
    \end{minipage}%
  \end{textblock*}%
}

\renewcommand{\headrule}{%
  \headerdecoration{Cyan}%
  \headerleftcontent{\headerlefttext}%
  \headerrightcontent{\headerrighttext}%
}

%----------------------------------------------------------------------------------------
%	PAGE FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{lastpage}

\newcommand{\footerlefttext}{%
  \begin{center}%%
    page \thepage -- \pageref{LastPage}%
  \end{center}%
}

\newlength{\footermargin}
\newlength{\footercenter}
\newlength{\footercenterspace}
\newlength{\footerlefttextwidth}
\newlength{\footerleftheight}
\newlength{\footerrightheight}

\newcommand{\myfootrulebegin}{%
  \setlength{\footermargin}          {1cm}%
  \setlength{\footercenter}          {.35\paperwidth}%
  \setlength{\footercenterspace}     {2cm}%
  \setlength{\footerlefttextwidth}   {\footercenter-.5\footercenterspace-2\footermargin}%
%
  \setlength{\footerleftheight}      {1cm}%
  \setlength{\footerrightheight}     {0.5cm}%
%
  \begin{textblock*}{\paperwidth}(0mm,\paperheight - \footerleftheight) {%
    \begin{tikzpicture}%
      \draw[fill=lightgray]%
             (0,                                   0) %
          -- (\paperwidth,                         0) %
          -- (\paperwidth,                         \footerrightheight) %
          -- (\footercenter +.5\footercenterspace, \footerrightheight) %
          -- (\footercenter -.5\footercenterspace, \footerleftheight) %
          -- (0,                                   \footerleftheight)
          -- (0,                                   0);%
    \end{tikzpicture}%
  } \end{textblock*}%
%
  \begin{textblock*}{\footerlefttextwidth}(\footermargin,\paperheight - \footerleftheight)%
    \centering%
    \begin{minipage}[t][\footerleftheight][c]{.75\footerlefttextwidth plus .25\footerlefttextwidth}%
}

\newcommand{\myfootruleend}{%
    \end{minipage}%
  \end{textblock*}%
}%
%
\renewcommand{\footrule}{%
  \myfootrulebegin
  \footerlefttext
  \myfootruleend
}

%----------------------------------------------------------------------------------------
%	MAIN TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\RequirePackage{moresize}

\newlength{\headertitlewidth}
\newlength{\headerauthorwidth}
\newlength{\headertitleposition}
\newlength{\headerauthorposition}

\setlength{\headertitlewidth}       {.5\paperwidth}%
\setlength{\headerauthorwidth}      {.5\paperwidth}%
\setlength{\headertitleposition}    {.4\paperheight}%
\setlength{\headerauthorposition}   {.56\paperheight}%

\newcommand{\mytitleformat}{
  \rmfamily%
  \bfseries%
  \HUGE%
  \centering%
}

\pretitle{%
  %page decoration
  \headerdecoration{Black}
  \headerleftcontent[\headerimagemargin]{\includegraphics[height=.9\headerleftheight]{smart_me_up}}%
  \headerrightcontent[\headerimagemargin]{\flushright\includegraphics[height=.9\headerrightheight]{Logo_ENSIMAG_2008}}%

  %title
  \begin{textblock*}{\headertitlewidth}(.5\paperwidth-.5\headertitlewidth,\headertitleposition)%
    \begin{minipage}{\headertitlewidth}%
      \mytitleformat%
}

\posttitle{
      \newlength{\headertitletextwidth}%
      \settowidth{\headertitletextwidth}{%
        \mytitleformat%
	\thetitle%
      }%

      \vspace{-1ex}%
      \color{cyan}\rule{\headertitletextwidth}{.25ex}%
    \end{minipage}%
  \end{textblock*}%
}

\preauthor{
  \begin{textblock*}{\headerauthorwidth}(.5\paperwidth-.5\headerauthorwidth,\headerauthorposition)%
    \begin{minipage}{\headerauthorwidth}%
      \centering
}

\postauthor{
    \end{minipage}%
  \end{textblock*}%
}

\predate{\myfootrulebegin}
\postdate{\myfootruleend}

%----------------------------------------------------------------------------------------
%	DEFINITION OF COLORED BOXES
%----------------------------------------------------------------------------------------

\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

\definecolor{ocre}{RGB}{52,177,201} % Define the orange color used for highlighting throughout the book

% Theorem box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
backgroundcolor=black!5,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
innerbottommargin=5pt]{tBox}

% Exercise box	  
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
backgroundcolor=ocre!10,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt]{eBox}	

% Definition box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=0pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=0pt]{dBox}	

% Corollary box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=gray,
backgroundcolor=black!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=5pt]{cBox}

%----------------------------------------------------------------------------------------
%	SECTION NUMBERING IN THE MARGIN
%----------------------------------------------------------------------------------------

\makeatletter
\renewcommand{\@seccntformat}[1]{\llap{\textcolor{ocre}{\csname the#1\endcsname}\hspace{1em}}}                    
\renewcommand{\section}{\@startsection{section}{1}{\z@}
{-4ex \@plus -1ex \@minus -.4ex}
{1ex \@plus.2ex }
{\normalfont\large\sffamily\bfseries}}
\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
{-3ex \@plus -0.1ex \@minus -.4ex}
{0.5ex \@plus.2ex }
{\normalfont\sffamily\bfseries}}
\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
{-2ex \@plus -0.1ex \@minus -.2ex}
{.2ex \@plus.2ex }
{\normalfont\small\sffamily\bfseries}}                        
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
{-2ex \@plus-.2ex \@minus .2ex}
{.1ex}
{\normalfont\small\sffamily\bfseries}}

%---------------------------------------------------------------------------------------
%	CHAPTER HEADINGS
%----------------------------------------------------------------------------------------

% The set-up below should be (sadly) manually adapted to the overall margin page septup controlled by the geometry package loaded in the main.tex document. It is possible to implement below the dimensions used in the goemetry package (top,bottom,left,right)... TO BE DONE

\newcommand{\thechapterimage}{}
\newcommand{\chapterimage}[1]{\renewcommand{\thechapterimage}{#1}}

% Numbered chapters with mini tableofcontents
\def\thechapter{\arabic{chapter}}
\def\@makechapterhead#1{
\thispagestyle{empty}
{\centering \normalfont\sffamily
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\startcontents
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commenting the 3 lines below removes the small contents box in the chapter heading
%\fill[color=ocre!10!white,opacity=.6] (1cm,0) rectangle (8cm,-7cm);
%\node[anchor=north west] at (1.1cm,.35cm) {\parbox[t][8cm][t]{6.5cm}{\huge\bfseries\flushleft \printcontents{l}{1}{\setcounter{tocdepth}{2}}}};
\draw[anchor=west] (5cm,-9cm) node [rounded corners=20pt,fill=ocre!10!white,text opacity=1,draw=ocre,draw opacity=1,line width=1.5pt,fill opacity=.6,inner sep=12pt]{\huge\sffamily\bfseries\textcolor{black}{\thechapter. #1\strut\makebox[22cm]{}}};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\end{tikzpicture}};
\end{tikzpicture}}
\par\vspace*{230\p@}
\fi
\fi}

% Unnumbered chapters without mini tableofcontents (could be added though) 
\def\@makeschapterhead#1{
\thispagestyle{empty}
%\myfootrule
{\centering \normalfont\sffamily
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
\draw[anchor=west] (5cm,-9cm) node [rounded corners=20pt,fill=ocre!10!white,fill opacity=.6,inner sep=12pt,text opacity=1,draw=ocre,draw opacity=1,line width=1.5pt]{\huge\sffamily\bfseries\textcolor{black}{#1\strut\makebox[22cm]{}}};
\end{tikzpicture}};
\end{tikzpicture}}
\par\vspace*{230\p@}
\fi
\fi
}
\makeatother

\endinput
