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
	