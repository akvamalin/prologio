%  Datenstruktur [1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 5/Y5, 6/Y6, 7/Y7, 8/Y8]

muster([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).

bedroht(_/Y, _/Y).

bedroht(X1/Y1, X2/Y2) :- D is X1 - Y1, D1 is X2 - Y2, D =:= D1.

bedroht(X1/Y1, X2/Y2) :- D is X1 + Y1, D1 is X2 + Y2, D =:= D1.
    
bedrohtnicht(_, []).

bedrohtnicht(ELEM, [K|R]) :- not(bedroht(ELEM, K)), bedrohtnicht(ELEM, R).

loesung([]).

loesung([X/Y|R]) :- loesung(R), member(Y,[1, 2, 3, 4, 5, 6, 7, 8]), bedrohtnicht(X/Y, R).

loe(X) :- muster(X), loesung(X).

% Aufrufsbeispiel: loe(X).