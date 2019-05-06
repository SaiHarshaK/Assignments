push1([X|Xs], S0, Xs, [X|S0]).

reduce([A,B|Stack], Op, [X|Stack]) :-
    X =.. [Op, B, A].

next(Steps, Operands, Stack, Operators, E) :-
    push1(Operands, Stack, Operands_next, Stack_next),
    expr(Steps, Operands_next, Stack_next, Operators, E).
next(Steps, Operands, Stack, Operators, E) :-
    member(Op, Operators),
    reduce(Stack, Op, Stack_next),
    expr(Steps, Operands, Stack_next, Operators, E).

expr(Steps, Operands, Stack, Operators, E) :-
    (   succ(Steps0, Steps) ->
        next(Steps0, Operands, Stack, Operators, E)
    ;   Stack = [E]
    ).

expr(Operands, Operators, E) :-
    Operands = [A, B|Rest],
    length(Operands, N),
    Steps is 2*N - 3,
    expr(Steps, Rest, [B, A], Operators, E).
