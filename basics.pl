% Yevhenii Maliavka
% 04.06.2018
% Basics of Prolog
% Üblicherweise typische n-stellige Funktion: ggT(78, 92) = 13 
% Prolog n-stelliger Predikat: ggT(78, 91, 13). 
% Zwei Funktionsargumente, ein Ergebnisargument.

% Mathematik
% Rekursiver Aufruf 1. 
% ggT(x, y) = ggT(x - y, y) falls x > y 
% Rekursiver Aufruf 2.
% ggT(x, y) = ggT(y, x) falls x < y
% Aufruf 3.
% ggT(x, x) = x (Rekursionsverankerung)

% ggT(x, x) = x
ggT(X, X, X).
% x < y
ggT(X, Y, Z) :- X < Y, ggT(Y, X, Z).
% x > y
ggT(X, Y, Z) :- X > Y, W is X - Y, ggT(W, Y, Z).
% Aufrufsbeispiel: ggT(78, 91, X).

% 'max' Funktion

max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.

% 'power' Funktion
hoch(_, 0, 1).
hoch(X, Y, Z1) :- W is Y - 1, hoch(X, W, Z), Z1 is Z * X.


% 'länge' Funktion für die Liste

laenge([], 0).
laenge([_|R], L1) :- laenge(R, L), L1 is L + 1.

% 'mitglied' Funktion für die Liste
mitglied(X, X).
mitglied([K|R], X) :- mitglied(K, X) ; mitglied(R, X).

elt([K|_],K).
elt([_|R],K):-elt(R,K).


    
