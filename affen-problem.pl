%========================== Affenproblem =================================
% Initialer Startzustand: (tür, unten, fenster, hatnichts)
% Endzustand: Affe will Banane haben (X, Y, Z, hat)

% Die Aktionen des Affens: 

% * laufen (möglich): laufen(X, Z) - von wo nach wo - von X zu Y
% ** Transformation
% ** von diesem Zustand (X, unten, Z, hatnicht)
% ** durch diese Aktion laufen(X, Y)
% ** zu diesem Zustand (Y, unten, Z, hatnicht)


% * schieben (Tisch, wenn Affe neben dem Tisch ist): schieben(X, Y)
% ** Transformation
% ** von diesem Zustand (X, unten, X, hatnicht)
% ** durch diese Aktion schieben(X, Y)
% ** zu diesem Zustand (Y, unten, Y, hatnicht)


% * klettern (auf den Tisch): klettern()
% ** Transformation
% ** von diesem Zustand (X, unten, X, hatnicht)
% ** durch diese Aktion klettern()
% ** von diesem Zustand (X, oben, X, hatnicht)

% * greifen (die Banane)
% ** Transformation
% ** von diesem Zustand (mitte, oben, mitte, hatnicht)
% ** durch diese Aktion greifen()
% ** von diesem Zustand (mitte, oben, mitte, hat)

% start(tür, unten, fenster, hatnichts).
% end(tür, unten, fenster, hat).


% bananaweg1(start, [start|R], [start|R]).
% bananaweg1(START, [ZW|R], WEG) :- transformation(ZW1, _, ZW), not(member(ZW1, R)), bananaweg1(START, [ZW1, ZW|R], WEG).

% bananaweg(Z, Z1, Weg) :- bananaweg1(Z, [Z1], Weg).

% ================================= DUMMY-SOLUTION =================================
% % Schritt 1 - Gehe zum Fenster (wo der Tisch sich befindet)
% transition((tür, unten, fenster, T), laufen, (fenster, unten, fenster, T)).
% % Schritt 2 - Schiebe den Tisch in die Mitte
% transition((fenster, unten, fenster, Q), schieben, (mitte, unten, mitte, Q)).
% % Schritt 3 - Klettere den Tisch
% transition((X, unten, X, hatnichts), klettern, (X, oben, X, hatnichts)).
% % Schritt 4 - Greife Banane
% transition((mitte, oben, mitte, hatnichts), greifen, (mitte, oben, mitte, hat)).

% bananaweg(START, [START|R], [START|R]).
% bananaweg(START, [ZW|R], WEG) :- transition(ZW1, _, ZW), write(ZW1), not(member(ZW1, R)), bananaweg(START, [ZW1, ZW|R], WEG).

% startbananaweg(WEG) :- bananaweg((tür, unten, fenster, hatnichts), [(mitte, oben, mitte, hat)], WEG).


% ================================= SOLUTION =================================
% Aufrufbeispiel: 
% startbananaweg((tür, unten, fenster, hatnichts), (mitte, oben, mitte, hat), WEG).
    
% Schritt 1 - Gehe zum Fenster (wo der Tisch sich befindet)
transition((X, unten, fenster, T), laufen, (Y, unten, fenster, T)).
% Schritt 2 - Schiebe den Tisch in die Mitte
transition((X, unten, X, Q), schieben, (Y, unten, Y, Q)).
% Schritt 3 - Klettere den Tisch
transition((X, unten, X, hatnichts), klettern, (X, oben, X, hatnichts)).
% Schritt 4 - Greife Banane
transition((X, oben, X, hatnichts), greifen, (X, oben, X, hat)).
% % Runter?
% transition((X, oben, X, Q), runter, (X, unten, X, Q)).

bananaweg(START, [START|R], [START|R]).
bananaweg(START, [ZW|R], WEG) :- transition(ZW1, _, ZW), not(member(ZW1, R)), bananaweg(START, [ZW1, ZW|R], WEG).

startbananaweg(START, ZIEL, WEG) :- bananaweg(START, [ZIEL], WEG).



