resolve(Sol) :- Sol = laboratorio(menino(_,_,_,_,_,_),menino(_,_,_,_,_,_),menino(_,_,_,_,_,_),menino(_,_,_,_,_,_),menino(_,_,_,_,_,_)),
              lado(A,B,Sol),
              mes(A, setembro),
              suco(B, laranja),

              membro(C,Sol),
              materia(C, historia),
              nome(C, joao),

              esquerda(D,E,Sol),
              mochila(D, azul),
              mes(E,maio),

              lado(F,G,Sol),
              nome(F, will),
              jogo(G, logica),
              suco(G, uva),

              exatamente_esquerda(H,I,Sol),
              mochila(H,branca),
              nome(I, will),

              terceiro(J,Sol),
              suco(J, morango),

              lado(K,L,Sol),
              jogo(K,forca),
              jogo(L,tresMais),

              direita(M,N,Sol),
              suco(M,uva),
              mochila(N,azul),

              uma_das_pontas(O,Sol),
              jogo(O,cubo),

              lado(P,Q,Sol),
              jogo(P,forca),
              mochila(Q,vermelha),

              membro(R,Sol),
              materia(R,biologia),
              suco(R,morango),

              lado(S,T,Sol),
              mes(S,janeiro),
              mes(T,setembro),

              exatamente_esquerda(U,V,Sol),
              suco(U,uva),
              materia(V,portugues),

              membro(W,Sol),
              materia(W,matematica),
              mes(W,dezembro),

              lado(X,Y,Sol),
              jogo(X,logica),
              mochila(Y,amarela),

              membro(Z,Sol),
              mochila(Z,azul),
              mes(Z,janeiro),

              lado(A1,A2,Sol),
              mes(A1,setembro),
              jogo(A2,cubo),

              primeiro(A3,Sol),
              suco(A3,limao),

              membro(A4,Sol),
              suco(A4,maracuja),
              materia(A4,matematica),

              quinto(A5,Sol),
              nome(A5,lenin),

              uma_das_pontas(A6,Sol),
              nome(A6,otavio),

              terceiro(A7,Sol),
              jogo(A7,forca),

              membro(A8,Sol),
              mochila(A8,verde),

              membro(A9,Sol),
              nome(A9,denis),

              membro(B1,Sol),
              mes(B1,agosto),

              membro(B2,Sol),
              jogo(B2,cacaPalavras),

              membro(B3,Sol),
              materia(B3,geografia).


membro(A,laboratorio(A,_,_,_,_)).
membro(A,laboratorio(_,A,_,_,_)).
membro(A,laboratorio(_,_,A,_,_)).
membro(A,laboratorio(_,_,_,A,_)).
membro(A,laboratorio(_,_,_,_,A)).

esquerda(X,Y,laboratorio(X,Y,_,_,_)).
esquerda(X,Y,laboratorio(X,_,Y,_,_)).
esquerda(X,Y,laboratorio(X,_,_,Y,_)).
esquerda(X,Y,laboratorio(X,_,_,_,Y)).
esquerda(X,Y,laboratorio(_,X,Y,_,_)).
esquerda(X,Y,laboratorio(_,X,_,Y,_)).
esquerda(X,Y,laboratorio(_,X,_,_,Y)).
esquerda(X,Y,laboratorio(_,_,X,Y,_)).
esquerda(X,Y,laboratorio(_,_,X,_,Y)).
esquerda(X,Y,laboratorio(_,_,_,X,Y)).

direita(X,Y,Sol) :- esquerda(Y,X,Sol).

exatamente_esquerda(X,Y,laboratorio(X,Y,_,_,_)).
exatamente_esquerda(X,Y,laboratorio(_,X,Y,_,_)).
exatamente_esquerda(X,Y,laboratorio(_,_,X,Y,_)).
exatamente_esquerda(X,Y,laboratorio(_,_,_,X,Y)).

exatamente_direita(X,Y,Sol) :- exatamente_esquerda(Y,X,Sol).

lado(X,Y,Sol) :-
              exatamente_esquerda(X,Y,Sol);
              exatamente_direita(X,Y,Sol).

primeiro(X,laboratorio(X,_,_,_,_)).
terceiro(X,laboratorio(_,_,X,_,_)).
quinto(X,laboratorio(_,_,_,_,X)).

uma_das_pontas(X,laboratorio(X,_,_,_,_)).
uma_das_pontas(X,laboratorio(_,_,_,_,X)).

mochila(menino(Mo,_,_,_,_,_),Mo).
nome(menino(_,N,_,_,_,_),N).
mes(menino(_,_,Me,_,_,_),Me).
jogo(menino(_,_,_,J,_,_),J).
materia(menino(_,_,_,_,Ma,_),Ma).
suco(menino(_,_,_,_,_,S),S).