// crenças iniciais
posicao(1).
sentido(direita).

// objetivo inicial
!iniciar.

// plano principal
+!iniciar <-
    !mover.

// mover para frente
+!mover : sentido(direita) & posicao(X) & X < 30 <-
    Novo = X + 1;
    -posicao(X);
    +posicao(Novo);
    .print("Indo para sala ", Novo);
    !verificar;
    !mover.

// chegou no fim → volta
+!mover : sentido(direita) & posicao(30) <-
    -sentido(direita);
    +sentido(esquerda);
    .print("Mudando direção → esquerda");
    !mover.

// mover para trás
+!mover : sentido(esquerda) & posicao(X) & X > 1 <-
    Novo = X - 1;
    -posicao(X);
    +posicao(Novo);
    .print("Voltando para sala ", Novo);
    !verificar;
    !mover.

// chegou no início → volta
+!mover : sentido(esquerda) & posicao(1) <-
    -sentido(esquerda);
    +sentido(direita);
    .print("Mudando direção → direita");
    !mover.

// verificar sujeira
+!verificar : sujeira(X) & posicao(X) <-
    .print("Limpando sala ", X);
    -sujeira(X).
