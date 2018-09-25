\version "2.18.2"
\language "italiano"

\header {
  title = "Vierge de Fontpeyrine"
  subtitle = "sur l'air de «Mère de l›Espérance»"
  subsubtitle = "Chant au ténor"
  % Supprimer le pied de page par défaut
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key fa \major
  \numericTimeSignature
  \time 3/4
  \tempo ""
}

soprano = \relative do'' {
  \global
  % En avant la musique !
  do^"dernier refrain" do8 do do4 la sol8 ([la]) sib4 re do8 do do4 fa mi2
  mi4 fa8 sol, fa4 mi fa la8 ([re]) do([fa]) mi fa re4 mi do2 \breathe
do8([fa]) mi fa re4 < mi do> <fa la,>2\bar "|."
}

alto = \relative do' {
  \global
  % En avant la musique !
  la'4 sol8 sol fa4 fa fa re do fa8 sol la4 do, do2 
  sol'4 do,8 do do4 sib do re fa sol8 fa sib,4 do fa2
  fa4 sol8 fa sib,4 do do2
}

tenor = \relative do' {
  \global
  % En avant la musique !
  do4 do8 sib la4 do4 sib8 [(la)] sol4 sib4 la8 sol fa4 la sol2 \breathe
  do,4 fa8 mi fa4 sol la fa la do8 la fa4 sol la2 \breathe
  la4 do8 la fa4 sol fa2 
}

bass = \relative do {
  \global
  % En avant la musique !
fa4 mi8 mi fa4 fa re sol,  mi' fa8 fa fa4 fa do2
do4 la8 do fa4 re do sib la8([<fa fa'>]) do' do do4 do fa2
fa4  do8 do do4 do fa,2
}

verse = \lyricmode {
 Vier -- ge de Font -- pey -- ri -- ne nous chan -- tons vos ver -- "tus ;"
 Vo -- tre bon -- té di -- vi -- ne,
 votre a -- mour pour Jé -- sus,
 votre a -- mour pour Jé -- sus.  % Ajouter ici des paroles.
  
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
   \unfoldRepeats <<
     \new Staff = "soprano" \new Voice = "soprano" { \soprano }
     \new Staff = "alto" \new Voice = "alto" { \alto }
     \new Staff = "tenor" \new Voice = "tenor" { \tenor }
     \new Staff = "bass" \new Voice = "bass" { \bass }
     \context Staff = $name {
       \set Score.midiMinimumVolume = #0.5
       \set Score.midiMaximumVolume = #0.5
       \set Score.tempoWholesPerMinute = #(ly:make-moment 95 4)
       \set Staff.midiMinimumVolume = #0.8
       \set Staff.midiMaximumVolume = #1.0
       \set Staff.midiInstrument = $midiInstrument
     }
     \new Lyrics \with {
       alignBelowContext = $name
     } \lyricsto $name $lyrics
   >>
 #})

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Soprano" "Alto" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verse
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Ténor" "Basse" }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi {
    \tempo 4=95
  }
}

% Fichiers MIDI pour répétitions :
\book {
  \bookOutputSuffix "soprano"
  \score {
    \rehearsalMidi "soprano" "soprano sax" \verse
    \midi { }
  }
}

\book {
  \bookOutputSuffix "alto"
  \score {
    \rehearsalMidi "alto" "soprano sax" \verse
    \midi { }
  }
}

\book {
  \bookOutputSuffix "tenor"
  \score {
    \rehearsalMidi "tenor" "tenor sax" \verse
    \midi { }
  }
}

\book {
  \bookOutputSuffix "bass"
  \score {
    \rehearsalMidi "bass" "tenor sax" \verse
    \midi { }
  }
}

