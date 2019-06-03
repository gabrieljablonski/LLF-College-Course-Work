fib(1, 1).
fib(2, 1).

fib(X, F) :- fib(X, 1, 1, F, 3).

fib(X,F1,F2,F,X) :- F is F1 + F2.

fib(X, F1, F2, F, N) :-
	F3 is F2 + F1,
	N1 is N + 1,
	fib(X, F2, F3, F, N1).
	