:- dynamic fib/2.

fib(0, 1).
fib(1, 1).
% fib(2, 2).
% fib(3, 3).


inliste(M) :- member(M, [0, 1, 2, 3, 4, 5]).

machefib :- L = [2, 3, 4, 5, 6, 7, 8, 9, 10], 
            member(Z, L), X1 is Z - 1, 
            X2 is Z -2, 
            fib(X1, Y1), 
            fib(X2, Y2),
            Y is Y1 + Y2,
            assert(fib(Z, Y)), 
            fail. % fib(2, 2) steht in der Datenbank, macht backtracking, und setzt fort.
