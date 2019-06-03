intercala([], [], []).
intercala(L, [], L).
intercala([], L, L).

intercala(Lista1, Lista2, ListaResultado) :-
	[H1|T1] = Lista1,
	[H2|T2] = Lista2,
	intercala(T1, T2, L1),
	ListaResultado = [H1,H2|L1].