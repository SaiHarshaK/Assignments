% findExprStack will have the final expression which evaluates to the answer
% NumList is the list of numbers in which we have to insert the operations
% 2 * NumListLen - 3 iterations because for the n numbers and n-1 operators,
% we can either push number to stack or push operator
% Fst is first and Snd is second
findExpr(NumList, Exp) :-
    length(NumList, NumListLen),
    Iter is 2 * NumListLen - 3,
    [Fst, Snd| Tail] = NumList,
    findExprStack(Iter, Tail, [Snd, Fst], Exp).

% For Iter iterations we try to add the number to the expression or evaluate with an operator
% When we complete all iterations the stack would then contain the expression
findExprStack(Iter, NumList, Stack, Exp) :-
    NextIter is Iter - 1,
    (
      NextIter >= 0 ->
        addNumOrEval(NextIter, NumList, Stack, Exp)
    ;   [Exp] = Stack
    ).

% Try to add the operator and try to get the value if it fails fall backs and tries to evaluate
addNumOrEval(Iter, NumList, Stack, Exp) :-
    addToStack(NumList, NewNumList, Stack, NewStack),
    findExprStack(Iter, NewNumList, NewStack, Exp).
% for evaluation, we try with each of the operator
addNumOrEval(Iter, NumList, Stack, Exp) :-
    member(GetOP, [+, -, *, /]),
    (
      member(GetOP, [/]) ->
        [Fst| _] = Stack,
        Eval is Fst,
        not(Eval = 0),
        evaluate(GetOP, Stack, NewStack),
        findExprStack(Iter, NumList, NewStack, Exp)
      ; evaluate(GetOP, Stack, NewStack),
        findExprStack(Iter, NumList, NewStack, Exp)
    ).

% Add the Fst number from the current NumList and add it to the stack
addToStack([Fst| NumList], NumList, Stack, [Fst| Stack]).

% here we use the "univ" operator to evaluate from the Stack
% CurrOP is the current operator passed
evaluate(CurrOP, [Fst, Snd| Stack], [Evaluated | Stack]) :-
    Evaluated =.. [CurrOP, Snd, Fst].

% Final answer is the last element
getReqdAns([X], Ans) :- Ans = X.
getReqdAns([_| Tail], Ans) :-
  getReqdAns(Tail, Ans).

% Remove last element
getNumList([_], []).
getNumList([X| Tail], [X| RmLast]) :-
    getNumList(Tail, RmLast).

% checks if the required condition is satisfiable else print IMPOSSIBLE, first three are base cases
checkCond([]) :- write("IMPOSSIBLE"), nl.
checkCond([_]) :- write("IMPOSSIBLE"), nl.
checkCond([X, Y]) :-
  (
    X =:= Y ->
      write(X), write("="), write(Y), nl
    ; write("IMPOSSIBLE"), nl
  ).
checkCond(GivList) :-
  getNumList(GivList, NumList),
  getReqdAns(GivList, Ans),
  findExpr(NumList, Exp), Exp =:= Ans, print(Exp), write("="), print(Ans), nl.
checkCond(_) :- write("IMPOSSIBLE"), nl.

% to loop from High to Low using Step
downto(Low,High,_Step) :- Low =< High.
downto(Low,High,Step) :-
    Dec is High-Step,
    Dec >= Low,
    downto(Low, Dec, Step).

% Parse txt File
readList(Str) :-
  read(Str, Case),
  checkCond(Case).

main :-
  open('input.txt', read, Str),
  read(Str, TestCase),
  forall(downto(1, TestCase, 1), readList(Str)),
  close(Str).
