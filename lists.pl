% Funktion, die ein minimales Element aus der Liste ausgibt.
% Aufruf Beispiel: min([1, 2, 3, 5, 0], T).

min([K],K).  
min([K|R], K) :- min(R, T), K =< T.
min([K|R], T) :- min(R, T), K > T.

% Funktion, die überprüft, ob eine Liste geordnet oder nicht ist.
% Aufruf Beispiel: geordnet([1, 2, 3, 5, 0]).
geordnet([]).
geordnet([_]).
geordnet([K|R]) :- geordnet(R), min(R, T), K =< T.

% Funktion, die das erste Element der Liste zurückgibt.
first([K|_], K).

% geordnete([]).
% geordnete([_]).
% geordnete([K1, K2]) :- K1 =< K2.
% geordnete([K1, K2 ] | R]) :- geordnete(R), K1 =< K2. 

% Löschen eines Elementes aus der Liste.
% Gibt eine Liste zurück.
% lösche(L1, E, L2).
% Induktionsanfang:
lösche([K|R], K, R).
lösche([K|R], E, [K| R1]) :- lösche(R, E, R1).


% Konkat(L1, L2, L3)
% Induktionsanfang
konkat([], L, L).
konkat([K|R], L, [K | L1]) :- konkat(R, L, L1).

% Permutation
permutation([], []).
permutation([K|R], L) :- permutation(R, P), lösche(L, K, P).

permsort(L, P) :- permutation(L, P), geordnet(P).

zerlege([],_ ,[],[]).
zerlege([K|R], P, Kelvin, [K | Klein]) :- K < P, zerlege(R, P, Kelvin, Klein).
zerlege([K|R], P, [ K | Kelvin], Klein) :- P =< K, zerlege(R, P, Kelvin, Klein).
    

qsort([], []).
qsort([K|R], Erg) :- 
    zerlege(R, K, Kevin, Klein), 
    qsort(Kevin, G1), 
    qsort(Klein, G2), 
    konkat(G2, [K|G1], Erg).

% ssort([], []).
% ssprt([K, R], [MIN|F]) :-
%         min(R, MIN), MIN < K, ssort([K|R], F).
% ssort([K, R], [K|F]) :-
%         min(R, MIN), MIN > K, ssort([MIN|R], F).

% Induktionsanfang
selsort([], []).
selsort(L, [M|G]) :- min(L, M), konkat(X, [M|Y], L), konkat(X, Y, Z), selsort(Z, G).
