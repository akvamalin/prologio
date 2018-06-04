elternteil(hans, fritz).
elternteil(fritz, anna).
geschlecht(hans, m).
geschlecht(fritz, m).
geschlecht(anna, w).

vater(X, Y) :- elternteil(X,Y), geschlecht(X, m).
vorfahr(X, Y) :- vorfahr(Z, Y), elternteil(X, Z).
% vorfahr(X, Y) :- elternteil(X,Y).