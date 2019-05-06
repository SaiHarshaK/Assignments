findit([X], X).
findit([X | Z], Y) :- Ynew is X + Y, findit(Z, Ynew), print("+"), print(X).
findit([X | Z], Y) :- Ynew is X - Y, findit(Z, Ynew), print("-"), print(X).
findit([X | Z], Y) :- Ynew is X * Y, findit(Z, Ynew), print("*"), print(X).
findit([X | Z], Y) :- Y =\= 0, Ynew is X / Y, findit(Z, Ynew), print("/"), print(X).

findd([X]) :- findit([X], X), print(X).
findd([X | Y]) :-  print(X), findit(Y, X).
findd(_) :- print("IMPOSSIBLE").


downto(Low,High,_Step,High) :- Low =< High.
downto(Low,High,Step,Var) :-
    Dec is High-Step,
    Dec >= Low,
    downto(Low, Dec, Step, Var).

testIt(Str) :-
  read(Str, CS),
  findd(CS).

main :-
  open('input.txt', read, Str),
  read(Str, TestCase),
  forall(downto(1, TestCase, 1, _), testIt(Str)),
  close(Str).
