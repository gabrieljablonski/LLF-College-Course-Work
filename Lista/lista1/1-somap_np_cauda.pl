somap_np(Lista, SomaP, SomaNP) :- somap_np(Lista, 0, 0, SomaP, SomaNP).

somap_np([], SomaP, SomaNP, SomaP, SomaNP).

somap_np([H|T], Ac1, Ac2, SomaP, SomaNP) :-
	H > 0,
	NAc1 is Ac1 + H, 
	somap_np(T, NAc1, Ac2, SomaP, SomaNP).
	
somap_np([H|T], Ac1, Ac2, SomaP, SomaNP) :-
	H =< 0,
	NAc2 is Ac2 + H,
	somap_np(T, Ac1, NAc2, SomaP, SomaNP).