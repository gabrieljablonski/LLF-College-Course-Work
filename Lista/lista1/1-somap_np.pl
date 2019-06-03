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