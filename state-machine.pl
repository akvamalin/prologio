
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
