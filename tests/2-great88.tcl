#
# To run this test, call it from the parent directory with:
#   deal -x bin/unit.tcl tests/great88.tcl 
#
proc problem {id title diagram goal {denomination notrump} {leader south}} {
  set tricks [dds -diagram $diagram -leader $leader south $denomination]
  if {$tricks != $goal} {
    fail "$id ($title)" "makes $tricks with goal $goal"
  } else {
    pass "$id ($title)"
  }
  #puts "$result: Problem $id ($title) makes $tricks tricks with goal $goal"
}

# Tribe 1 - Eliminations, Endplays of Position

problem 1 Avoidance {
               {A987 - A} 
               {Q5 987 -} 
               {64 K2 2} 
               {K2 AQ3 -} 
          } 3 notrump

problem 2 {The Pitt coup} {
               {A2 753} 
               {Q9 64 Q} 
               {KJ - 753} 
               {3 Q98 A}
          } 5 spades

problem 3 {Gambit and jettison} {
               {A 873 A} 
               {6 9 K KJ} 
               {- A6 - Q43} 
               {8 Q Q98 -}
          } 4 spades

problem 4 {Forced finesse} {
               {842 32} 
               {A76 K8} 
               {KQ3 AQ} 
               {J9 75 2}
          } 4 notrump

problem 5 {Strip setup finesse} {
               {7 - Q63 A} 
               {9 - JT8 7} 
               {- - K94 65} 
               {5 - - K984}
          } 4 spades

problem 6 {Double strip finesse} {
               {- 86 - A96} 
               {5 A53 - 5} 
               {A 742 - 2} 
               {- 9 8 874}
          } 4 notrump

problem 7 {Crossruff strip} {
               {97 - 72 2} 
               {- Q3 Q KQ} 
               {86 - A8 8} 
               {J J KJ J}
          } 3 spades

problem 8 {Jettison entry strip} {
               {2 32 - A2} 
               {- - J9 KJ6} 
               {- - A43 Q3} 
               {- KQ KQ 8}
          } 4 spades

problem 9 {Jettison two-entry strip} {
               {- A7 - QJ5} 
               {- 65 AK9 -} 
               {J J9 QJ -} 
               {8 K3 - K9}
          } 4 spades

problem 10 {Double-entry strip} {
               {743 A A -} 
               {Q Q Q QJ} 
               {KJ2 - - 32} 
               {A65 K K}
          } 4 notrump

problem 11 {Fork strip} {
               {52 5 5 5} 
               {98 9 9 9} 
               {AQ A 3 A} 
               {K63 K A -}
          } 4 notrump

problem 12 {Total fork strip} {
               {T42 - A 4} 
               {QJ7 - J Q} 
               {K85 8 6 -} 
               {A96 - 3 5}
          } 3 hearts

problem 13 {Progressive fork strip} {
               {Q3 - - KQJ} 
               {KT2 - - 64} 
               {AJ97 J - -} 
               {8654 A - -}
          } 4 notrump

problem 14 {Transfer fork strip} {
               {6 4 - AJ5} 
               {- - 65 Q84} 
               {- - 72 K63} 
               {- Q K4 92}
          } 4 spades

problem 15 {Jettison double fork strip} {
               {- - J T862} 
               {7 8 - A97} 
               {J 642 5 -} 
               {9 953 8 -}
          } 3 spades

problem 16 {Repeat-jettison fork strip} {
               {- A A KJ7} 
               {5 - Q9 AQ} 
               {Q 2 KJ8 -} 
               {J 3 764}
          } 4 spades

problem 17 {Two-fork double strip} {
               {- 8 J7 A9} 
               {- Q7 A8 8} 
               {A A93 6 -} 
               {- 65 Q Q6}
          } 4 notrump

problem 18 {Double blocked fork strip} {
               {- Q9 J95} 
               {- KT73 Q} 
               {9 8 A64} 
               {4 J K73}
          } 3 spades

problem 19 {Crossruff or finesse strip} {
               {T 5 - AT5} 
               {- JT KQ J} 
               {5 A - 432} 
               {- KQ - KQ9}
          } 4 spades

problem 20 {Crossruff entry strip} {
               {3 4 A 32} 
               {- K K KQJ} 
               {54 A - 75} 
               {- 75 98 A}
          } 4 spades

problem 21 {Crossruff fork strip} {
               {A AQ Q A} 
               {- K5 K KQ} 
               {3 32 3 3} 
               {- J9 J J9}
          } 4 spades

problem 22 {Crossruff split-fork strip} {
               {3 Q - KT3} 
               {- A9 - Q75} 
               {4 6 - A94} 
               {- K A J86}
          } 4 spades

problem 23 {Entry or fork strip} {
               {3 72 Q2} 
               {2 J54 J} 
               {- AK3 A7} 
               {- Q98 K9}
          } 4 notrump

problem 24 {Jettison-entry fork strip} {
               {K984 - K -} 
               {AJ - - 876} 
               {- Q65 72 -} 
               {- 98 A65 -}
          } 3 notrump

problem 25 {Blocked fork strip or entry} {
               {KJ3 - K 8}
               {Q7 - QJ 9}
               {- J 84 J6}
               {- 9 9 Q72}
           } 4 notrump

problem 26 {Crossruff entry fork strip} {
               {3 32 - 53}
               {- - 98754 -}
               {75 75 - 2}
               {- 64 6 64}
           } 4 spades

# Tribe 2 - Coups, Endplays of Time

problem 27 {En passant} {
               {A54 2 - 2}
               {7 - A7 87}
               {- 3 32 A3}
               {98 9 9 9}
           } 4 spades

problem 28 {Grand coup} {
               {- 42 AK A}
               {K4 - 43 4}
               {AQ2 - 2 2}
               {J9 - J9 J}
           } 5 spades

problem 29 {Grand coup fork strip} {
               {876 A - 9}
               {3 K K KQ}
               {AJT2 - A -}
               {KQ9 9 9 -}
           } 4 spades

problem 30 {Overruff grand coup} {
               {Q972 - - Q}
               {- - K6 K62}
               {54 4 5 4}
               {JT8 32 - -}
           } 4 spades

problem 31 {Repeating grand coup} {
               {AK - - QT8}
               {J9765 - - -}
               {QT8 A A -}
               {432 8 8 -}
           }  5 spades

problem 32 {Undercut} {
               {- 4 A65 A}
               {KQT - K 4}
               {AJ2 6 4 -}
               {- A QJ98 -}
           }  4 spades

problem 33 {Uppercut} {
               {Q7 8 J A}
               {A65 - 2 8}
               {42 42 4 -}
               {983 A 9 -}
           } 2 spades

problem 34 {Smother play} {
               {A42 2 - 2}
               {T9 T9 T -}
               {QJ87 7 - -}
               {K653 3 - -}
           }  4 spades

problem 35 {Double smother} {
	       {AT3 - AK -}
	       {J6 6 6 6}
	       {K92 A - 4}
	       {Q85 5 5 -}
           } 5 spades

# Tribe 3 - Squeezes, Endplays of Mass

problem 36 {Double squeeze} {
              {A2 2 - KQ}
              {KJ - A 86}
              {3 - 2 A72}
              {Q9 A - J9}
           } 5 notrump

problem 37 {Double squeeze} {
              {94 - 2 K3}
              {A5 Q - J8}
              {Q63 2 - 6}
              {J - 8 972}
           } 4 spades

problem 38 {Double automatic squeeze} {
              {AQ3 - - K4}
              {J87 A - 7}
              {2 2 2 A2}
              {K96 - A 9}
           } 5 notrump

problem 39 {Split squeeze} {
              {K3 - 74 A}
              {J - QJ K9}
              {A2 - A Q2}
              {Q - - J875}
           } 5 notrump

problem 40 {Overtake squeeze} {
              {A964 - - K}
              {T8752 - - -}
              {KQJ K K -}
              {3 A2 A A}
           } 4 notrump

problem 41 {Progressive squeeze} {
              {3 A3 Q 4}
              {Q82 - J A}
              {A7 7 K8 -}
              {K9 K9 9 -}
           } 5 notrump
         
problem 42 {Transfer repeat squeeze} {
              {A7 4 6 7}
              {J9 - 98 Q}
              {Q8 - A54 -}
              {K654 - Q -}
           } 5 notrump

problem 43 {Three-two squeeze} {
              {- A4 4 42}
              {- - A3 863}
              {7 7 - AQ7}
              {- K6 K J9}
           } 5 notrump

problem 44 {Finesse jettison squeeze} {
              {K8 - 953 -}
              {- J JT7 9}
              {- 9 Q8 63}
              {Q764 - K -}
           } 4 notrump

problem 45 {Progressive jettison squeeze} {
              {A4 9 A 5}
              {- 73 764 -}
              {96 K4 8 -}
              {QJ - KJ Q}
           } 4 notrump

problem 46 {Progressive jettison squeeze or squeeze} {
              {- A3 A9 Q}
              {- 75 876 -}
              {9 86 QJ -}
              {- Q4 K4 K}
           } 5 notrump


problem 47 {Trump squeeze} {
              {KJ84 - - K}
              {Q65 - - 32}
              {A73 K K -}
              {T9 A A A}
           } 5 spades

problem 48 {Squeeze or forced finesse} {
              {KQ KQ J}
              {9 A K93}
              {2 3 AQ7}
              {A8765 - -}
           } 4 notrump

problem 49 {Finesse squeeze} {
              {82 - A9 2}
              {- 62 8 74}
              {- 54 Q A6}
              {- 73 KJ 9}
           } 5 spades

# Tribe 4: Compund and Hybrid Endings

problem 50 {One-way finesse or fork strip} {
              {KJ - - A62}
              {AQ9 - J7 -}
              {853 - K4 -}
              {- - Q5 QJ5}
           } 3 notrump

problem 51 {Forced jettison strip squeeze} {
              {- A AJ64 -}
              {8 - Q98 K}
              {9 Q97 - 7}
              {J JT86 - -}
           } 3 spades

problem 52 {Crossruff strip triple squeeze} {
              {6 76 - 76}
              {9 QJ - QJ}
              {7 K8 Q 8}
              {- - KJ876 -}
           } 3 spades

problem 53 {Forced triple squeeze (with fork strip)} {
              {9 Q8 - Q7}
              {- J7 - J64}
              {A6 9 9 9}
              {T8 - T T8}
           } 4 notrump

problem 54 {Squeeze strip or suitout} {
              {- 76 A2 2}
              {- J8 KQ K}
              {7 AQ5 7 -}
              {- K94 95 -}
           } 4 spades

problem 55 {Triple squeeze forced finesse} {
              {Q6 3 8 2}
              {K 82 A 8}
              {- A4 K AK}
              {T4 T - T4}
           } 4 notrump

problem 56 {Jettison squeeze finesse} {
              {A K2 K2 -}
              {42 - - QJ9}
              {53 - - AK3}
              {K A A 87}
           } 4 notrump

problem 57 {Squeeze or strip squeeze} {
              {- AQ9 KQ -}
              {7 KJ AJ -}
              {K 2 2 JT}
              {4 - - Q654}
           } 4 spades

problem 58 {Triple squeeze scoop strip} {
              {K874 - - 2}
              {A65 - - 98}
              {2 9 9 AK}
              {QJ Q Q Q}
           } 4 notrump

problem 59 {Triple squeeze entry strip} {
              {A654 K - -}
              {T987 - - K}
              {KQJ - K 2}
              {32 A A A}
           } 4 notrump

problem 60 {Jettison triple squeeze entry strip} {
              {43 2 J A}
              {K - 98 54}
              {A - 432 6}
              {95 9 - K9}
           } 4 notrump

problem 61 {Fork squeeze entry strip} {
              {- A52 - A9}
              {- J K9 K8}
              {- K73 Q7 -}
              {- Q86 - 64}
           } 4 notrump

problem 62 {Squeeze finesse} {
              {K2 9 9 K}
              {J864 - - J}
              {A95 - - A2}
              {Q3 A A Q}
           } 5 notrump

problem 63 {Finesse threat 3-2 squeeze} {
              {2 - K5 A7}
              {- J8 J97 -}
              {- 2 AT43 -}
              {- 9 Q8 J9}
           } 5 spades

problem 64 {Hexagon squeeze finesse} {
              {2 A9 2 2}
              {K Q Q4 J}
              {- 2 A9 AK}
              {A K4 K Q}
           } 5 notrump

problem 65 {One-way squeeze scoop finesse} {
              {KJ2 K - 2}
              {Q54 3 - 4}
              {A63 - - AK}
              {987 A - 3}
           } 5 notrump

problem 66 {Automatic squeeze scoop finesse} {
              {- - T5 A52}
              {98 - Q76 -}
              {- 9 K8 K9}
              {- - 93 T86}
           } 5 notrump

problem 67 {Squeeze ruffout} {
              {A5 - K98 -}
              {7 - - QJ87}
              {93 T95 - -}
              {- KQ QJT -}
           } 5 spades

problem 68 {Squeeze overruff} {
              {Q5 5 - KQ}
              {K KT 87 -}
              {- A87 T 9}
              {- J64 J 5}
           } 5 clubs

problem 69 {Repeat-squeeze entry strip} {
              {2 K4 K K}
              {AK97 9 - -}
              {QJ64 8 - -}
              {8 A2 Q Q}
           } 2 notrump

problem 70 {Forced unblock triple-squeeze scoop} {
              {QJ8 7 7 -}
              {- 9 J J94}
              {965 - - Q8}
              {AK7 - - K7}
           } 2 notrump

problem 71 {Squeeze unblock finesse} {
              {Q5 32 - J}
              {A64 K9 - -}
              {K8 AJ - 9}
              {JT97 - - A}
           } 3 notrump

problem 72 {Blocked fork strip} {
              {- Q7 J92}
              {- K952 Q}
              {J 8 A73}
              {3 J K85}
           } 3 spades

problem 73 {En passant mutate} {
              {86 74 - 8}
              {AQ 6 76 -}
              {K AJ QT -}
              {- Q98 KJ -}
           } 4 spades

problem 74 {Repeated trump discard} {
              {42 QJ9 - -}
              {KQ8 - QJ -}
              {AJ63 - - 8}
              {9 7 976 -}
           } 4 spades west

problem 75 {Squeeze scoop ruffout} {
              {- K9 K AQ}
              {- A8 - K54}
              {97 - 9 97}
              {- QJ Q J6}
           } 5 spades

problem 76 {Coup or squeeze} {
              {864 - - Q9}
              {- 5 JT K8}
              {- 7 7 A42}
              {75 - 6 T7}
           } 5 spades

problem 77 {Triple-squeeze ruffout} {
	      {52 - 98 9}
              {J 2 KQ Q}
              {A4 - 74 7}
              {- KQ975 - -}
           } 4 spades west

problem 78 {Progressive squeeze jettison scoop} {
             {5 95 - A7}
             {- Q8 - JT9}
             {- J 76 Q3}
             {9 AT - K8}
           } 4 notrump

problem 79 {Double squeeze strip} {
             {- A97 83 -}
             {- T86 T9 -}
             {8 QJ3 - Q}
             {K5 K54 - -}
           } 4 notrump

problem 80 {One-way squeeze or ditto} {
             {7 Q7 7 7}
             {- - A6 864}
             {- J J4 J5}
             {A 986 5 -}
           } 4 notrump

problem 81 {En passant or double squeeze} {
             {J5 5 - J8}
             {- - 98 Q74}
             {3 - J3 K3}
             {Q9 Q - 96}
           } 4 spades

problem 82 {Squeeze entry strip} {
             {5 Q6 AJ -}
             {9 J9 K K}
             {8 - Q54 8}
             {Q6 - 976 -}
           } 4 notrump

problem 83 {Double-squeeze scoop} {
             {- - 86 AQ6}
             {- 98 - K84}
             {J J - 953}
             {- - JT JT7}
           } 3 notrump

problem 84 {Jettison strip mutate} {
             {- A A K92}
             {3 J5 - AT}
             {5 Q6 T8 -}
             {- K 973 Q}
           } 4 spades

problem 85 {Split squeeze entry strip} {
             {J53 - AQ}
             {KQ9 - KJ}
             {82 Q73 -}
             {- 964 42}
           } 3 notrump

problem 86 {Hexagon squeeze finesse} {
             {- 9 A9 75}
             {- Q7 Q7 Q}
             {8 K8 8 8}
             {- J J6 J6}
           } 4 notrump

problem 87 {Endplays in series} {
             {9 A8 - 87}
             {T - T9 T9}
             {- 92 5 A4}
             {K K765 - -}
           } 4 notrump

problem 88 {Contra squeeze} {
             {- A T43 A}
             {A2 K J K}
             {KQJ - K2 -}
             {- - AQ765 -}
           } 3 notrump


rename problem {}
