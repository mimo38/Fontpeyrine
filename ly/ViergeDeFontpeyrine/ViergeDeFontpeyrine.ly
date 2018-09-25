\version "2.18.2"
\language "italiano"

\header {
 % title = "Vierge de Fontpeyrine"
  %subtitle = "sur l'air de «Mère de l'Espérance»"
  %composer = "Mélodie du XIXe siècle"
  %arranger = "Harmonisation : Jean-Paul Lécot"
  % Supprimer le pied de page par défaut
  tagline = ##f
}

\paper {
   #(include-special-characters)

  #(set-paper-size "a5")
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
}

soprano = \relative do'' {
  \global
  % En avant la musique !
  \partial4 do4 ^"Refrain" do8 sib la4 do4 sib8 [(la)] sol4 sib4 la8 sol fa4 la sol2 \breathe
  do,4 fa8 mi fa4 sol la fa la do8 la fa4 sol la2 \breathe
  la4 do8 la fa4 sol fa2 \bar "||"
do4 fa8 mi fa4 sol la fa la do8 la fa4 sol fa2
do4 fa8 mi fa4 sol la fa la do8 la fa4 sol sol2
}

alto = \relative do' {
  \global
  % En avant la musique !
  la'4 la8 sol fa4 fa  fa re sol fa8 fa do4 fa mi2
  do4 do8 do do4 re fa re fa do8 do re4 mi fa2
  fa4 do8 do re4 mi do2
  
  \break
do4 fa8 mi fa4 sol la fa la do8 la fa4 sol fa2
do4 fa8 mi fa4 sol la fa la do8 la fa4 sol sol2\bar "|."
\mark "D.C."
}

tenor = \relative do' {
  \global
  % En avant la musique !
 do4 do8 do do4 la sib sib do do8 sib la4 do do2
 mi,4 fa8 sol la4 sib fa sib do sol8 sol la4 do do2
do4 sol8 sol la4 do la2 

%couplets
r4 la2^"Bouche fermée" sib4 do la do sol la do la2
r4 la2 sib4 do la do sol la do do2
}

bass = \relative do {
  \global
  % En avant la musique !
fa4 mi8 mi fa4 fa re sol mi fa8 fa fa4 fa do2\breathe
do4 la8 do fa4 re do sib la8(fa') mi [mi] re4 do fa2
fa4 mi8 mi re4 do fa2

%couplets
r4 fa2.(fa2.) mi4 re <mi do> fa2
r4 fa2.(fa2.) mi4 re mi <mi do>2

}


sopranoVerse = \lyricmode {
  % Ajouter ici des paroles.
  
}

altoVerse = \lyricmode {
  % Ajouter ici des paroles.
Vier -- ge de Font -- pey -- ri -- ne nous chan -- tons vos ver -- "tus ;"
 Vo -- tre bon -- té di -- vi -- ne,
 votre a -- mour pour Jé -- sus,
 votre a -- mour pour Jé -- sus. 
 
 \set stanza = "1."Au val -- lon so -- li -- tai -- re
 Nous som -- mes ac -- cou -- rus,
 Sa -- lu -- er no -- tre Mè -- re,
 Cé -- lé -- bre ses ver -- tus.
}

tenorVerse = \lyricmode {
  % Ajouter ici des paroles.
  
}

bassVerse = \lyricmode {
  % Ajouter ici des paroles.
 Vier -- ge de Font -- pey -- ri -- ne nous chan -- tons vos ver -- "tus ;"
 Vo -- tre bon -- té di -- vi -- ne,
 votre a -- mour pour Jé -- sus,
 votre a -- mour pour Jé -- sus. 
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
    \new Staff = "sa" \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Soprano" "Alto" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      alignAboveContext = "sa"
      \override VerticalAxisGroup #'staff-affinity = #DOWN
    } \lyricsto "soprano" \sopranoVerse
    \new Lyrics \lyricsto "alto" \altoVerse
    \new Staff = "tb" \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Ténor" "Basse" }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
    \new Lyrics \with {
      alignAboveContext = "tb"
      \override VerticalAxisGroup #'staff-affinity = #DOWN
    } \lyricsto "tenor" \tenorVerse
    \new Lyrics \lyricsto "bass" \bassVerse
  >>
  \layout { }
  \midi {
    \tempo 4=95
  }
}


