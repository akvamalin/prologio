% substituiere Formel
% sub(Formel, Teilformel, TeilformelErsatz, ErgebnisF)

subliste([], _, _, []).
subliste([K|R], TF, TF1, [K1|R1]) :- sub(K, TF, TF1, K1), subliste(R, TF, TF1, R1).

sub(F, F, F1, F1).
sub(F, TF, TF, F).
% K ist der oberste Operator, R ist die Liste der Argumente
sub(F, TF, TF1, F1) :- F =.. [K | R], subliste(R, TF, TF1, R1), F1 =.. [K | R1].