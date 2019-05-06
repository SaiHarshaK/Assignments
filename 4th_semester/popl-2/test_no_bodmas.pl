findit([X], X, _).
findit([X | Z], Y, [+ | B]) :- Ynew is Y + X, findit(Z, Ynew, B).
findit([X | Z], Y, [- | B]) :- Ynew is Y - X, findit(Z, Ynew, B).
findit([X | Z], Y, [* | B]) :- Ynew is Y * X, findit(Z, Ynew, B).
findit([X | Z], Y, [/ | B]) :- X =\= 0, Ynew is Y / X, findit(Z, Ynew, B).

findd([X], _) :- findit([X], X, _).
findd([X | Y], L) :- findit(Y, X, L), !.
findd(_, _) :- print("IMPOSSIBLE").
