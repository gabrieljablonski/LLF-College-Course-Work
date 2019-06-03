reverso([], []).
reverso(Lista, Atsil) :-
	[H|T] = Lista,
	reverso(T, L1),
	append(L1, [H], Atsil).