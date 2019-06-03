%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Fibonnaci - One recursive call
fib(1, 1).
fib(2, 1).
fib(X, F) :- fib(X, 1, 1, F, 3).
fib(X,F1,F2,F,X) :- F is F1 + F2.
fib(X, F1, F2, F, N) :-
	F3 is F2 + F1,
	N1 is N + 1,
	fib(X, F2, F3, F, N1).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Greatest Common Divider and Least Common Multiple
gcd(A,A,A).
gcd(A,B,GCD) :-
	A > B,
	A2 is A - B,
	gcd(A2,B,GCD).
gcd(A,B,GCD) :-
	A < B,
	B2 is B - A,
	gcd(A,B2,GCD).
gcd([H|[]],H).
gcd([H,NH|T],GCD) :-
	gcd(H,NH,GCD2),
	gcd([GCD2|T],GCD).
	
lcm(A,B,LCM) :-
	gcd(A,B,GCD),
	LCM is A * B / GCD.
lcm([H|T],LCM) :-
	gcd([H|T],GCD),
	product([H|T],P),
	LCM is P / GCD.

product([], 1).
product([H|T],P) :- 
	product(T, Rest),
	P is H*Rest.
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Delete n-th element
delete_nth(N, [H|T], Element, Rest) :- delete_nth(N, [H|T], Element, Rest, 1).
delete_nth(N, [H|T], Element, Rest, N) :-
	Element = H,
	Rest = T.
delete_nth(N, [H|T], Element, Rest, CN) :-
	CN1 is CN + 1,
	delete_nth(N, T, Element, R, CN1),
	Rest = [H|R].
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Dot product
dot([H1|T1], [H2|T2], P) :- dot([H1|T1], [H2|T2], P, 0).
dot([H1|[]], [H2|[]], P, Ac) :- P is Ac + H1 * H2.
dot([H1|T1], [H2|T2], P, Ac) :-
	NAc is H1 * H2 + Ac,
	dot(T1, T2, P, NAc).