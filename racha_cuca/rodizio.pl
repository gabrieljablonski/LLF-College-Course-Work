resolve(Solucao) :- Solucao = rodizio(amigo(_,_,_,_,_,_),amigo(_,_,_,_,_,_),amigo(_,_,_,_,_,_),amigo(_,_,_,_,_,_),amigo(_,_,_,_,_,_)),
              uma_das_pontas(A,Solucao),
              carro(A,sedan),

              exatamente_direita(B,C,Solucao),
              idade(B,19),
              pedacos(C,9),

              exatamente_esquerda(D,E,Solucao),
              carro(D,suv),
              carro(E,sedan),

              segundo(F,Solucao),
              carro(F,pickup),

              terceiro(G,Solucao),
              carro(G,crossover),

              exatamente_direita(H,I,Solucao),
              camisa(H,azul),
              carro(I,hatch),

              quinto(J,Solucao),
              pedacos(J,6),

              direita(K,L,Solucao),
              pedacos(K,9),
              camisa(L,verde),

              exatamente_esquerda(M,N,Solucao),
              pizza(M,calabresa),
              pedacos(N,5),

              esquerda(O,P,Solucao),
              pedacos(O,7),
              pedacos(P,5),

              exatamente_direita(Q,R,Solucao),
              idade(Q,27),
              pizza(R,quatroQueijos),

              quinto(S,Solucao),
              pizza(S,portuguesa),

              exatamente_direita(T,U,Solucao),
              nome(T,leandro),
              pizza(U,frango),

              entre(V,W,X,Solucao),
              pizza(W,brigadeiro),
              pizza(V,frango),
              pizza(X,quatroQueijos),

              entre(Y,Z,AA,Solucao),
              idade(Z,22),
              nome(Y,gabriel),
              idade(AA,19),

              segundo(AB,Solucao),
              idade(AB,29),

              quarto(AC,Solucao),
              nome(AC,vinicius),

              lado(AD,AE,Solucao),
              carro(AD,pickup),
              idade(AE,22),

              entre(AF,AG,AH,Solucao),
              camisa(AG,azul),
              idade(AF,34),
              pedacos(AH,9),

              direita(AI,AJ,Solucao),
              nome(AI,mauricio),
              camisa(AJ,azul),

              exatamente_esquerda(AK,AL,Solucao),
              nome(AK,renato),
              nome(AL,leandro),

              exatamente_direita(AM,AN, Solucao),
              camisa(AM,branca),
              pedacos(AN,9),

              esquerda(AO,AP,Solucao),
              camisa(AO,vermelha),
              camisa(AP,amarela),

              na_mesa(AQ,Solucao),
              pedacos(AQ,8).


na_mesa(Pos,rodizio(Pos,_,_,_,_)).
na_mesa(Pos,rodizio(_,Pos,_,_,_)).
na_mesa(Pos,rodizio(_,_,Pos,_,_)).
na_mesa(Pos,rodizio(_,_,_,Pos,_)).
na_mesa(Pos,rodizio(_,_,_,_,Pos)).

esquerda(Pos1,Pos2,rodizio(Pos1,Pos2,_,_,_)).
esquerda(Pos1,Pos2,rodizio(Pos1,_,Pos2,_,_)).
esquerda(Pos1,Pos2,rodizio(Pos1,_,_,Pos2,_)).
esquerda(Pos1,Pos2,rodizio(Pos1,_,_,_,Pos2)).
esquerda(Pos1,Pos2,rodizio(_,Pos1,Pos2,_,_)).
esquerda(Pos1,Pos2,rodizio(_,Pos1,_,Pos2,_)).
esquerda(Pos1,Pos2,rodizio(_,Pos1,_,_,Pos2)).
esquerda(Pos1,Pos2,rodizio(_,_,Pos1,Pos2,_)).
esquerda(Pos1,Pos2,rodizio(_,_,Pos1,_,Pos2)).
esquerda(Pos1,Pos2,rodizio(_,_,_,Pos1,Pos2)).

direita(Pos1,Pos2,Solucao) :- esquerda(Pos2,Pos1,Solucao).

exatamente_esquerda(Pos1,Pos2,rodizio(Pos1,Pos2,_,_,_)).
exatamente_esquerda(Pos1,Pos2,rodizio(_,Pos1,Pos2,_,_)).
exatamente_esquerda(Pos1,Pos2,rodizio(_,_,Pos1,Pos2,_)).
exatamente_esquerda(Pos1,Pos2,rodizio(_,_,_,Pos1,Pos2)).

exatamente_direita(Pos1,Pos2,Solucao) :- exatamente_esquerda(Pos2,Pos1,Solucao).

entre(Pos1,Pos2,Pos3,rozidio(Pos1,Pos2,Pos3,_,_)).
entre(Pos1,Pos2,Pos3,rozidio(Pos1,Pos2,_,Pos3,_)).
entre(Pos1,Pos2,Pos3,rozidio(Pos1,Pos2,_,_,Pos3)).
entre(Pos1,Pos2,Pos3,rozidio(Pos1,_,Pos2,Pos3,_)).
entre(Pos1,Pos2,Pos3,rozidio(Pos1,_,Pos2,_,Pos3)).
entre(Pos1,Pos2,Pos3,rozidio(Pos1,_,_,Pos2,Pos3)).
entre(Pos1,Pos2,Pos3,rozidio(_,Pos1,Pos2,Pos3,_)).
entre(Pos1,Pos2,Pos3,rozidio(_,Pos1,Pos2,_,Pos3)).
entre(Pos1,Pos2,Pos3,rozidio(_,Pos1,_,Pos2,Pos3)).
entre(Pos1,Pos2,Pos3,rozidio(_,_,Pos1,Pos2,Pos3)).

lado(Pos1,Pos2,Solucao) :-
              exatamente_esquerda(Pos1,Pos2,Solucao);
              exatamente_direita(Pos1,Pos2,Solucao).

segundo(Pos,rodizio(_,Pos,_,_,_)).
terceiro(Pos,rodizio(_,_,Pos,_,_)).
quarto(Pos,rodizio(_,_,_,Pos,_)).
quinto(Pos,rodizio(_,_,_,_,Pos)).

uma_das_pontas(Pos,rodizio(Pos,_,_,_,_)).
uma_das_pontas(Pos,rodizio(_,_,_,_,Pos)).

camisa(amigo(Cor,_,_,_,_,_),Cor).
nome(amigo(_,Nome,_,_,_,_),Nome).
idade(amigo(_,_,Idade,_,_,_),Idade).
pizza(amigo(_,_,_,Pizza,_,_),Pizza).
pedacos(amigo(_,_,_,_,Pedacos,_),Pedacos).
carro(amigo(_,_,_,_,_,Carro),Carro).
