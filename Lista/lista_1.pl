%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 1 - Soma positiva e negativa

somap_np([], 0, 0).

somap_np(Lista, SomaP, SomaNP) :- 
	[H|T] = Lista,
	H > 0,
	somap_np(T, SomaP1, SomaNP),
	SomaP is SomaP1 + H.
	
somap_np(Lista, SomaP, SomaNP) :- 
	[H|T] = Lista,
	H =< 0,
	somap_np(T, SomaP, SomaNP1),
	SomaNP is SomaNP1 + H.
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 2 - Média recursiva

media1(Lista, Media) :- media1(Lista, 0, 0, Media).
media1([], N, Ac, Media) :- Media is Ac / N.
media1([H|T], N, Ac, Media) :-
	NAc is Ac + H,
	N1 is N + 1,
	media1(T, N1, NAc, Media).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 3 - Média soma / length

media2(Lista, Media) :- 
	length(Lista, N),
	sum_list(Lista, S),
	Media is S / N.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 4 - Maior posição

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 5 - Intercala

intercala([], [], []).
intercala(L, [], L).
intercala([], L, L).

intercala(Lista1, Lista2, ListaResultado) :-
	[H1|T1] = Lista1,
	[H2|T2] = Lista2,
	intercala(T1, T2, L1),
	ListaResultado = [H1,H2|L1].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 6 - Transponha

transponha([], [], []).

transponha(Lista1, Lista2, ListaResultado) :-
	[H1|T1] = Lista1,
	[H2|T2] = Lista2,
	transponha(T1, T2, L1),
	ListaResultado = [[H1,H2]|L1].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 7 - Valor por extenso

to_word(0, "").
to_word(1, "um ").
to_word(2, "dois ").
to_word(3, "tres ").
to_word(4, "quatro ").
to_word(5, "cinco ").
to_word(6, "seis ").
to_word(7, "sete ").
to_word(8, "oito ").
to_word(9, "nove ").
to_word(10, "dez ").
to_word(11, "onze ").
to_word(12, "doze ").
to_word(13, "treze ").
to_word(14, "quatorze ").
to_word(15, "quinze ").
to_word(16, "dezesseis ").
to_word(17, "dezessete ").
to_word(18, "dezoito ").
to_word(19, "dezenove ").
to_word(20, "vinte ").
to_word(30, "trinta ").
to_word(40, "quarenta ").
to_word(50, "cinquenta ").
to_word(60, "sessenta ").
to_word(70, "setenta ").
to_word(80, "oitenta ").
to_word(90, "noventa ").
to_word(100, "cento ").
to_word(200, "duzentos ").
to_word(300, "trezentos ").
to_word(400, "quatrocentos ").
to_word(500, "quinhentos ").
to_word(600, "seiscentos ").
to_word(700, "setecentos ").
to_word(800, "oitocentos ").
to_word(900, "novecentos ").

extenso_(N, L1, L2) :-
    N > 0,
    N < 21,
    to_word(N, R),
    string_concat(L1, R, L2).

extenso_(N, L1, L2) :-
    N > 20,
    N < 30,
    ND is 10 * (N div 10),
    NU is N - ND,
    to_word(ND, Dezena),
    string_concat(L1, Dezena, LE),
    extenso_(NU, LE, L2).

extenso_(N, L1, L2) :-
    N > 29,
    N < 100,
    ND is 10 * (N div 10),
    NU is N - ND,
    NU > 0,
    to_word(ND, Dezena),
    string_concat(L1, Dezena, LE),
    string_concat(LE, "e ", LEE),
    extenso_(NU, LEE, L2).

extenso_(N, L1, L2) :-
    N > 29,
    N < 100,
    ND is 10 * (N div 10),
    NU is N - ND,
    NU = 0,
    to_word(ND, Dezena),
    string_concat(L1, Dezena, L2).

extenso_(100, L1, L2) :-
    string_concat(L1, "cem ", L2).

extenso_(N, L1, L2) :-
    N > 100,
    N < 1000,
    NC is 100 * (N div 100),
    ND is (N - NC) div 10,
    NU is N - NC - ND,
    NU = 0,
    ND = 0,
    to_word(NC, Centena),
    string_concat(L1, Centena, L2).

extenso_(N, L1, L2) :-
    N > 100,
    N < 1000,
    NC is 100 * (N div 100),
    ND is (N - NC) div 10,
    NU is N - NC - ND,
    NU > 0,
    ND = 0,
    to_word(NC, Centena),
    to_word(NU, Unidade),
    string_concat(L1, Centena, LE),
    string_concat(LE, "e ", LEE),
    string_concat(LEE, Unidade, L2).

extenso_(N, L1, L2) :-
    N > 100,
    N < 1000,
    NC is 100 * (N div 100),
    ND is (N - NC) div 10,
    NU is N - NC - ND,
    NU = 0,
    ND > 0,
    to_word(NC, Centena),
    to_word(ND, Dezena),
    string_concat(L1, Centena, LE),
    string_concat(LE, "e ", LEE),
    string_concat(LEE, Dezena, L2).

extenso_(N, L1, L2) :-
    N > 100,
    N < 1000,
    NC is 100 * (N div 100),
    ND is (N - NC) div 10,
    NU is N - NC - ND,
    NU > 0,
    ND > 0,
    to_word(NC, Centena),
    NDU is ND + NU,
    string_concat(L1, Centena, LE),
    string_concat(LE, "e ", LEE),
    extenso_(NDU, LEE, L2).

milhao(N, R) :-
    N = 0,
    R = "".
milhao(N, R) :-
    N = 1,
    R = "um milhao ".
milhao(N, R) :-
    N > 1,
    extenso_(N, "", S),
    string_concat(S, "milhoes ", R).

milhar(0, R, R).
milhar(N, S, R) :-
    N = 1,
    string_concat(S, "mil ", R).
milhar(N, S, R) :-
    N > 1,
    extenso_(N, "", A),
    string_concat(S, A, R1),
    string_concat(R1, "mil ", R).

unidade(N, S, R, Mi, M) :-
    N = 0,
	Mi = 0,
	M = 0,
    string_concat(S, "", R).
unidade(N, S, R, _, M) :-
    N = 0,
	M = 0,
    string_concat(S, "de reais ", R).
unidade(N, S, R, _, M) :-
    N = 0,
	M > 0,
    string_concat(S, "reais ", R).
unidade(N, S, R, _, _) :-
    N = 1,	
    string_concat(S, "um real ", R).
unidade(N, S, R, _, _) :-
    N > 1,
    extenso_(N, "", A),
    string_concat(S, A, R1),
    string_concat(R1, "reais ", R).

centavos(0, R, R, _, _, _).
centavos(N, S, R, Mi, M, U) :-
	N = 1,
	Mi = 0,
	M = 0,
	U = 0,
	extenso_(N, S, A),
	string_concat(A, "centavo", R).
centavos(N, S, R, Mi, M, U) :-
	N > 1,
	Mi = 0,
	M = 0,
	U = 0,
	extenso_(N, S, A),
	string_concat(A, "centavos", R).
centavos(N, S, R, _, _, _) :-
    N = 1,
    string_concat(S, "e um centavo", R).
centavos(N, S, R, _, _, _) :-
    N > 1,
    extenso_(N, "", A),
    string_concat(S, "e ", R1),
    string_concat(R1, A, R2),
    string_concat(R2, "centavos", R).

extenso(Valor, Resposta) :-
    Milhao is floor(Valor) // 1000000,
    milhao(Milhao, Res1),
    R1 is round((Valor - Milhao * 1000000)*100)/100,

    Milhar is floor(R1) // 1000,
    milhar(Milhar, Res1, Res2),
    R2 is round((R1 - Milhar * 1000)*100)/100,

    Unidade is floor(R2) // 1,
    unidade(Unidade, Res2, Res3, Milhao, Milhar),
    R3 is round((R2 - Unidade)*100)/100,

    Centavos is floor(R3*100),
    centavos(Centavos, Res3, Resposta, Milhao, Milhar, Unidade).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 8 - Lista reversa

reverso([], []).
reverso(Lista, Atsil) :-
	[H|T] = Lista,
	reverso(T, L1),
	append(L1, [H], Atsil).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 9 - Palíndromo

palindrome(Lista) :-
	reverso(Lista, Lista).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 10 - Elemento do meio

meio(Lista, Meio) :-
	append(A, [Meio|B], Lista),
	length(A, N),
	length(B, N).