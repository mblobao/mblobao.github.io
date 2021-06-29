
\NeedsTeXFormat{LaTeX2e}  % Which LaTeX version
\ProvidesClass{cv}[2021/07/21 Wolf Curriculum class]
\LoadClass{article}

\RequirePackage{titlesec}  % Package for customizing the tabs
                           % provides the command \titleformat
\RequirePackage{bookmark}
\RequirePackage{geometry}
\RequirePackage{babel}
\RequirePackage{fontspec,xltxtra,xunicode}
\RequirePackage{hyperref}
\RequirePackage{ifthen}

\geometry{a4paper, hmargin=1cm, vmargin=1cm}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Path = fonts/calibri/]{Calibri}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/calibri/]{Calibri}
\setlength{\parskip}{0em}

%\bfseries, \itshape: make the heading bold or italic;
%\scshape:small capitals;
%\small, \normalsize, \large, \Large, \LARGE, \huge, \Huge: set the font size;
%\rmfamily, \sffamily, \ttfamily:
%       set the font type to serifed, sans serifed or typewriter respectively.

\titleformat{\section}  % Customize the section command
    {\LARGE\scshape\raggedright\bfseries\uppercase} % Make it Large
                                          % small capitals and left aligned
    {}{0em}  % Gives a prefix to all sections
    {}       % Can be used to insert code before the heading
    [\titlerule]
    \titlespacing{\section}{1pt}{\parskip}{-\parskip}

\newcommand{\name}{\Huge{\@author}}

% If \lang == en; first; else second
\newcommand{\captxt}[2]{\ifthenelse{\equal{\lang}{en}}{#1}{#2}}

\newcommand{\education}[5]{
    % name, nome, period, periodo, organization, TCC, CCW
    \small{\uppercase{#5}\\\textbf{\captxt{#3}{#4}}\\\captxt{#1}{#2}}
    \vspace{3mm}\\
}

\newenvironment{experience}[5]{
    % Function, função, company, period, periodo
    \vspace{1mm}
    \large{\captxt{#4}{#5} - #3 \hfill \captxt{#1}{#2}}
    \vspace{2pt}\\
}{
    \vspace{2mm}
}

\newcommand{\cvsection}[2]{
    \vspace{10mm}
    \ifthenelse{\equal{\lang}{pt}}{
        \section[#1]{#1}    
    }{
        \section[#2]{#2}
    }
    \vspace{1mm}
}
