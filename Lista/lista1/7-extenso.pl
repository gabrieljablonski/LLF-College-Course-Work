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