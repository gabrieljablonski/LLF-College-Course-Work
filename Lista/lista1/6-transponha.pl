transponha([], [], []).

transponha(Lista1, Lista2, ListaResultado) :-
	[H1|T1] = Lista1,
	[H2|T2] = Lista2,
	transponha(T1, T2, L1),
	ListaResultado = [[H1,H2]|L1].