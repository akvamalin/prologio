
% state machine transitions between nodes
transformation(z0, 0, z0).
transformation(z0, 1, z1).
transformation(z1, 0, z1).
transformation(z1, 1, z2).
transformation(z2, 1, z0).

anfangszustand(z0).
endzustand(z0).

akzeptiertauszustand([], Z) :- endzustand(Z).
akzeptiertauszustand([K|R], Z) :- transformation(Z, K, Z1), akzeptiertauszustand(R, Z1).

akzeptiert(WEG):- akzeptiertauszustand(WEG, Z), anfangszustand(Z).

%aufrufbeispiel


% Weg - endliches Automat

v(merseburg, halle).
v(halle, leipzig).
v(leipzig, dresden).
v(dresden, berlin).
v(halle, magdeburg).
v(leipzig, magdeburg).

v(X, Y) :- v(Y,X).

weg1(START, [START|REST], [START|REST]).
weg1(START, [ZW | R], WEG) :- v(ZW1, ZW), not(member(ZW1, R)), weg1(START, [ZW1, ZW | R], WEG).
weg(START, ZIEL, WEG) :-  weg1(START, [ZIEL], WEG).


%========================== Affenproblem =================================
% Initialer Startzustand: (tür, unten, fenster, hatnichts)
% Endzustand: Affe will Banane haben (X, Y, Z, hat)

% Die Aktionen des Affens: 

% * laufen (möglich): laufen(X, Z) - von wo nach wo - von X zu Y
% ** Transformation
% ** von diesem Zustand (X, unten, Z, hatnicht)
% ** durch dieser Aktion laufen(X, Y)
% ** zu diesem Zustand (Y, unten, Z, hatnicht)


% * schieben (Tisch, wenn Affe neben dem Tisch ist): schieben(X, Y)
% ** Transformation
% ** von diesem Zustand (X, unten, X, hatnicht)
% ** durch dieser Aktion schieben(X, Y)
% ** zu diesem Zustand (Y, unten, Y, hatnicht)


% * klettern (auf den Tisch): klettern(X, )
% ** Transformation
% ** von diesem Zustand (X, unten, X, hatnicht)
% ** durch dieser Aktion klettern()
% ** von diesem Zustand (X, oben, X, hatnicht)

% * greifen
% ** Transformation
% ** von diesem Zustand (mitte, oben, mitte, hatnicht)
% ** durch dieser Aktion greifen()
% ** von diesem Zustand (mitte, oben, mitte, hat)

% Anfangszustand

start(tür, unten, fenster, hatnichts).
end(tür, unten, fenster, hat).


bananaweg1(start, [start|R], [start|R]).
bananaweg1(START, [ZW|R], WEG) :- transformation(ZW1, _, ZW), not(member(ZW1, R)), bananaweg1(START, [ZW1, ZW|R], WEG).

bananaweg(Z, Z1, Weg) :- bananaweg1(Z, [Z1], Weg).
% Endzustand