% Yevhenii Maliavka
% 04.06.2018
% Arithmetics in Prolog
% Üblicherweise typische n-stellige Funktion: ggT(78, 92) = 13 
% Prolog n-stelliger Predikat: ggT(78, 91, 13). 
% Zwei Funktionsargumente, ein Ergebnisargument.

% Mathematik
% Rekursiver Aufruf 1. (Erste Klausel)
% ggT(x, y) = ggT(x - y, y) falls x > y 
% Rekursiver Aufruf 2. (Zweite Klausel)
% ggT(x, y) = ggT(y, x) falls x < y
% Aufruf 3. (Dritte Klausel)
% ggT(x, x) = x (Rekursionsverankerung)

% ggT(x, x) = x
ggT(X, X, X).
% x < y
ggT(X, Y, Z) :- X < Y, ggT(Y, X, Z).
% x > y
ggT(X, Y, Z) :- X > Y, W is X - Y, ggT(W, Y, Z).
% Aufrufsbeispiel: ggT(78, 91, X).


% max Funktion: gibt eine größere Zahl zurück.
% meine Implementierung
maxMe(X, X, X).
maxMe(X, Y, Z) :- X < Y, max(Y, Y, Z).
maxMe(X, Y, Z) :- X >= Y, max(X, X, Z).
% richtige Implementierung

max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.

% power Funktion
hoch(_, 0, 1).
hoch(X, Y, Z1) :- W is Y - 1, hoch(X, W, Z), Z1 is Z * X.


% Liste Länge

laenge([], 0).
laenge([_|R], L1) :- laenge(R, L), L1 is L + 1.

% mitglied Funktion für die Liste
isequal(X, X).
mitglied([K|R], X) :- isequal(K, X) ; mitglied(R, X).



    
