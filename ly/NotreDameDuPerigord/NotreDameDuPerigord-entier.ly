\version "2.18.2"
\language "italiano"

\header {
  title = "Souris à notre prière"
  subtitle = "Notre-Dame du Périgord"
  composer = "Louis Boyer"
  % Supprimer le pied de page par défaut
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key mib \major
  \time 2/2
  \autoBeamOff
}

sopranoVoice = \relative do'' {
  \global
  \dynamicUp
 
  % En avant la musique !
   s2 s8 sib8 mib,4 fa8 sol lab sol sib4 sib sol4. 
    sol8 mib'4 re do sib8 lab sib2
    lab4 lab8 lab sol4 fa8 fa sib4 sib sol4. sol8 do4 do sib fa8 sol mib2 \fermata   \bar "|." 
\break
r8^"Couplet" sol8 sol do sib4. lab8 sol fa fa sol fa4 mib
r8 mib8 sol sib do4. mib8 re do sib do re2
r8 re8 mib fa do4. mib8 re do sib lab do4 si
sol fa8 mib sib'4 lab8 sol lab4 fa8 sib sib2 ^"D.C."\bar "||" % En avant la musique !
  
}

verseOne = \lyricmode {
  \set stanza = "Refrain"
  % Ajouter ici des paroles.
 Sou -- ris à no -- tre pri -- è -- re,
 No -- tre Da -- me du Pé -- ri -- gord,
 Res -- te tou -- jours no -- tre mè -- re,
  No -- tre Da -- me du Pé -- ri -- gord,  
\set stanza = "1." Ton nom bé -- ni s'u -- nit à notre his -- toi -- re
De tes bien -- faits tu com -- blas nos aï -- "eux :"
A -- vec saint Front cé -- lé brant ta mé -- moi -- re,
Ils in -- vo -- quaient ton ap -- pui glo -- ri -- eux.
}
aucouplet = \lyricmode {_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ }

verseTwo = \lyricmode {
\aucouplet
\set stanza = "2."
 Par -- tout chez nous  ton i -- ma -- ge ray -- on -- ne,
 De tes en -- fants é -- clai -- rant le che -- min; 
 À cha -- que pas, il nous faut la Ma -- do -- ne
 Pour nous gui -- der de sa di -- vi -- ne main.
 
  % Ajouter ici des paroles.
  
}

verseThree = \lyricmode {
  \aucouplet
  \set stanza = "3."
  % Ajouter ici des paroles.
 Au -- tour de toi, nos pi -- eux sanc -- tu -- aires 
 Chan -- tent, ra -- vis, tes ti -- tres glo -- ri -- eux; 
 Du Pé -- ri -- gord, par tes mains tu -- té -- lai -- res, 
 Que tous les noms soient ins -- crits dans les cieux.
}

verseFour = \lyricmode {
  \aucouplet
  \set stanza = "4."
  % Ajouter ici des paroles.
  Ra -- nime en nous l'es -- prit de pé -- ni -- ten -- ce, 
  Mè -- re du Christ, ô Vier -- ge de Ca -- douin; 
  Grave en nos coeurs les traits de sa souf -- fran -- ce, 
  Tels qu'on les voit au su -- ai -- re de lin.
}

verseFive = \lyricmode {
 \aucouplet
  \set stanza = "5."
  % Ajouter ici des paroles.
Ton titre ai -- mé de la Bon -- ne Nou -- ve -- le, 
Te fut don -- né dans nos â -- ges de foi; 
En sou -- ve -- nir de Jean -- ne la Pu -- cel -- le, 
Nous re -- vien -- drons plus nom -- breux près de toi.
}

\score {
  \new Staff \with {
    instrumentName = "Soprano"
    midiInstrument = "choir aahs"
  } { \sopranoVoice }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }
  \addlyrics { \verseFour }
  \addlyrics { \verseFive }
  \layout { }
  \midi {
    \tempo 4=100
  }
}
