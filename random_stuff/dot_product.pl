dot([H1|T1], [H2|T2], P) :- dot([H1|T1], [H2|T2], P, 0).

dot([H1|[]], [H2|[]], P, Ac) :- P is Ac + H1 * H2.

dot([H1|T1], [H2|T2], P, Ac) :-
	NAc is H1 * H2 + Ac,
	dot(T1, T2, P, NAc).