media2(Lista, Media) :- 
	length(Lista, N),
	sum_list(Lista, S),
	Media is S / N.