meio(Lista, Meio) :-
	append(A, [Meio1, Meio2|B], Lista),
	length(A, N),
	length(B, N),
	Meio is (Meio1 + Meio2)/2.