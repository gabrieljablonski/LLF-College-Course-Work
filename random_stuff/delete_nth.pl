delete_nth(N, [H|T], Element, Rest) :- delete_nth(N, [H|T], Element, Rest, 1).

delete_nth(N, [H|T], Element, Rest, N) :-
	Element = H,
	Rest = T.
	
delete_nth(N, [H|T], Element, Rest, CN) :-
	CN1 is CN + 1,
	delete_nth(N, T, Element, R, CN1),
	Rest = [H|R].