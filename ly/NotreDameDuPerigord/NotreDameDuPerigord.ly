\version "2.18.2"
\language "italiano"

\header {
  %title = "Souris à notre prière"
  %subtitle = "Notre-Dame du Périgord"
  %composer = "Louis Boyer"
  % Supprimer le pied de page par défaut
  tagline = ##f
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
   s2 s8^Refrain sib8 mib,4 fa8 sol lab sol sib4 sib sol4. 
    sol8 mib'4 re do sib8 lab sib2
    lab4 lab8 lab sol4 fa8 fa sib4 sib sol4. sol8 do4 do sib fa8 sol mib2 \fermata   \bar "|." 
\break
r8^"Couplet" sol8 sol do sib4. lab8 sol fa fa sol fa4 mib
r8 mib8 sol sib do4. mib8 re do sib do re2
r8 re8 mib fa do4. mib8 re do sib lab do4 si
sol fa8 mib sib'4 lab8 sol lab4 fa8 sib sib2 ^"D.C."\bar "||" % En avant la musique !
  
}

verseOne = \lyricmode {
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

\score {
  \new Staff \with {
    instrumentName = ""
    midiInstrument = "church organ"
  } { \sopranoVoice }
  \addlyrics { \verseOne }
}
  \layout { }
  \midi {
    \tempo 4=100
  }

