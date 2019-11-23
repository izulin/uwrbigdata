%%
%%  Class-File fuer Uebungzettel der Universitaet Paderborn
%%
%%  Das Papier wird voll ausgenutzt (besser als z.B. bei a4wide).
%%
%%  Der german-Style wird immer zugeladen, ebenso isolatin1, um
%%  Umlaute auf deutschen Tastaturen benutzen zu koennen.
%%
%%  Funktioniert fuer 10pt-, 11pt-, und 12pt-Texte.
%%
%%  --------------------------------------------------------
%%
%%  Folgende Kommandos werden definiert
%%
%%  \dozent{<Dozentenname>}
%%  \vorlesung{<Name der Veranstaltung>}
%%  \semester{<Semestername>}
%%  \tutoren{<Namen der Tutoren>}
%%
%%  Befindet sich im Directory die Datei VORLESUNG.def, so wird
%%  diese eingelesen. D.h., man kann die obigen Kommandos in EINER
%%  Datei abspeichern. Sie werden dann bei jedem (!) Uebungszettel
%%  eingelesen.
%%
%%  \tutoren{...} muss nicht unbedingt benutzt werden. Werden die
%%  uebrigen nicht benutzt, d.h. weder in der Datei, die den Text
%%  des Uebungszettels enthaelt, noch in VORLESUNG.def, so werden
%%  die Informationen ueber die Tastatur abgefragt.
%%
%%  \startnummer{<zahl>} 
%%           Aufgabennummer der ersten Aufgabe des Zettels.
%%           Wird das Kommando nicht benutzt, faengt die Numerierung
%%           eines jeden Blattes bei 1 an.
%%
%%  \kopf[<Abgabedatum>]{<Ausgabedatum>}{<Blattnummer>}
%%           Erzeugt den typischen Uebungszettelkopf. Wird der
%%           optionale Parameter <Abgabedatum> benutzt, wird dieses
%%           ausgegeben.
%%
%%  \begin{aufg}[<Punktzahl>]
%%  <Aufgabentext>
%%  \end{aufg}
%%           Erzeugt etwas Zwischenraum und dann den Text
%%           `AUFGABE x:'. Wird der optionale Parameter <Punktzahl>
%%           benutzt, gibt es den Text `AUFGABE x (<Punktzahl> Punkte):'.
%%
%%  --------------------------------------------------------
%%
%%  Ein moeglicher Inhalt von VORLESUNG.def:
%%
%%  \dozent{Fritz Meyer}
%%  \vorlesung{Parallele Sequentialit"at}
%%  \semester{WS 1999/2000}
%%  \tutoren{Klaus Schmidt, Liese M"uller \\
%%           Willi Koch}
%%
%%  --------------------------------------------------------
%%
%%  Ein moegliches Uebungsblatt:
%%
%%  \documentclass[12pt]{uebung}
%%
%%  \begin{document}
%%
%%  \startnummer{4}
%%
%%  \kopf[5. April 2000]{19. April 2000}{2}
%%
%%  \begin{aufg}
%%  Sei ...
%%  \end{aufg}
%%
%%  \begin{aufg}[3]
%%  M"oge ...
%%  \end{aufg}
%%
%%  \renewcommand{\aufgname}{Exercise}
%%
%%  \selectlanguage{USenglish}
%%
%%  \begin{aufg}
%%  Let ...
%%  \end{aufg}
%%
%%  \end{document}
%%
%%  --------------------------------------------------------
%%
%%  Autor: Rolf Wanka (wanka@uni-paderborn.de)
%%
%%  --------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uebung}
              [2000/04/05 v1.5
               Class-File fuer Uebungen]

\DeclareOption{10pt}
    {\PassOptionsToClass{\CurrentOption}{article} %
     \setlength{\hoffset}{-2.3cm} \setlength{\voffset}{-2.5 true cm}}

\DeclareOption{11pt}
    {\PassOptionsToClass{\CurrentOption}{article} %
     \setlength{\hoffset}{-1.6cm} \setlength{\voffset}{-2.3cm}}

\DeclareOption{12pt}
    {\PassOptionsToClass{\CurrentOption}{article} %
     \setlength{\hoffset}{-1.6cm} \setlength{\voffset}{-2.3cm}}

\ExecuteOptions{10pt}
\ProcessOptions

\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackage{ngerman}
\RequirePackage[utf8]{inputenc}

\pagestyle{empty}

\newcount\aufgnr
\aufgnr=1
\def\startnummer#1{\aufgnr=#1}

\frenchspacing

\setlength{\parindent}{0pt}
\setlength{\textwidth}{16.6cm}
\setlength{\textheight}{24cm}
\setlength{\hfuzz}{1mm}

\newcommand{\dozent}[1]{\def\DOZENT{#1}}
\newcommand{\tutoren}[1]{\def\TUTOREN{#1}}
\newcommand{\vorlesung}[1]{\def\VORLESUNG{#1}}
\newcommand{\semester}[1]{\def\SEMESTER{#1}}

\InputIfFileExists{../VORLESUNG.def}{\providecommand{\TUTOREN}{}}%
{\typeout{***********}
 \typeout{Warnung: Kein File vorhanden, das die Vorlesung spezifiziert!}
 \typeout{Spezifikation muss daher im Text des Blattes oder ueber die
          Tastatur erfolgen.}
 \typeout{***********}}

\newcommand{\kopf}[3][0]{%
\DOZENT\hfill #2\par
%\TUTOREN\ifthenelse{\equal{#1}{0}}{}{\ \hfill Deadline: lecture on #1}\par
\TUTOREN\ifthenelse{\equal{#1}{0}}{}{\ \hfill Deadline: #1}\par
\begin{center}\large
    \textbf{\VORLESUNG}      \\[\smallskipamount]
    \SEMESTER                \\[\smallskipamount]
    Exercise Set {#3}
\end{center}}

\newcommand{\aufgname}{Exercise}

\newcommand{\aufgabe}[1][0]{\bigskip\par
\textbf{\aufgname{} \number\aufgnr:}\hfill%
\ifthenelse{\equal{#1}{0}}{}{(#1)}
%\ifthenelse{#1 = 0}%
%  {}%
%  {\ifthenelse{#1 = 1}%
%         { (1 Point)}%
%         { (#1 Points)}}
\global\advance\aufgnr by 1\par}

\newenvironment{aufg}[1][0]{\aufgabe[#1]\nobreak}{}

\AtBeginDocument{%
\providecommand{\TUTOREN}{}
\providecommand{\DOZENT}{\typeout{-----------}\typein{Bitte den Namen des
                                 Dozenten eingeben:}\typeout{}}
\providecommand{\VORLESUNG}{\typeout{-----------}\typein{Bitte den Titel der
                                    Vorlesung eingeben:}\typeout{}}
\providecommand{\SEMESTER}{\typeout{-----------}\typein{Bitte die Bezeichnung
                                   des Semesters eingeben:}\typeout{}}}

\endinput
%% 
%% End of file `uebung.cls'.
