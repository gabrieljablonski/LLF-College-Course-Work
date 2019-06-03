maior_posicao(Lista, Maior, Posicao) :- [H|_] = Lista, maior_posicao(Lista, H, 0, 0, Maior, Posicao).
maior_posicao([], Maior, Posicao, _, Maior, Posicao).
maior_posicao([H|T], M, MP, N, Maior, Posicao) :-
	H < M,
	N1 is N + 1,
	maior_posicao(T, M, MP, N1, Maior, Posicao).
maior_posicao([H|T], M, _, N, Maior, Posicao) :-
	H >= M,
	N1 is N + 1,
	maior_posicao(T, H, N, N1, Maior, Posicao).
