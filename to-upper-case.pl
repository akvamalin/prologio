touppercase([], []).
touppercase([K | R], [ZW1|R1]):- ZW1 is K - 32, touppercase(R, R1) .

konvertiere(LOWER_CASE, UPPER_CASE):- 
                                    name(LOWER_CASE, ASCII), 
                                    touppercase(ASCII, ASCII_UPPER_CASE), 
                                    name(UPPER_CASE, ASCII_UPPER_CASE).