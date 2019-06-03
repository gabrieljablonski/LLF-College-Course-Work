media1(Lista, Media) :- media1(Lista, 0, 0, Media).
media1([], N, Ac, Media) :- Media is Ac / N.
media1([H|T], N, Ac, Media) :-
	NAc is Ac + H,
	N1 is N + 1,
	media1(T, N1, NAc, Media).
	