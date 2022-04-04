
# Bem vindos e bem vindas!
E aí, pessoal da Dimensa/Mobile2You! Sejam muito bem vindos ao meu perfil do GitHub!
Aqui vocês podem encontrar os principais trabalhos que já realizei ao longo da minha trajetória como desenvolvedor Flutter.

Vamos ao desafio! 😁

# Movies-Mobile2You
O app Movies foi criado para demonstrar minha capacidade em cumprir o desafio técnico proposto pela Mobile2You. O desafio era replicar o layout de uma tela do app TodoMovies4 utilizando as APIs disponibilizadas pelo site "The Movie Database".

## O que foi feito?

- ✅ A tela proposta foi criada (inclusive o efeito de sombreamento na imagem);
- ✅ As informações que preenchem essa tela vem das APIs do site The Movie Database;
- ✅ O gerenciamento de estado foi feito através do Provider;
- ✅ O ícone de coração muda quando é clicado; 
- ✅ Ao marcar um filme como favorito, é armazenado em uma lista. Na tela inicial há uma seção que exibe os filmes marcados como favoritos. 
    O contrário também ocorre: se o coração estiver preenchido, ele fica vazio e o filme é removido da lista de favoritos;
- ✅ Há uma lista abaixo das informações do filme que exibe sugestão de filmes com gêneros parecidos com o do filme;
- ✅ Na lista de sugestão de filmes, se algum filme estiver marcado como favorito, ele terá um símbolo de "check" à sua direita;
- ✅ Foi criada uma tela inicial, que exibe filmes fixados por mim, os filmes que foram marcados como favoritos e uma barra de busca para buscar
    filmes através de seu ID;

## Como os códigos estão organizados?
Um guia rápido sobre como as pastas estão organizadas no projeto.
 - Models: armazena as classes usadas para modelar os dados; 
 - Modules: é onde estão guardados os arquivos que constroem as páginas;
 - Providers: armazena os providers (MovieProvider e SimilarMovieProvider);
 - Shared: guarda conteúdos que são compartilhados entre partes da aplicação (temas, estilos, métodos);

## Packages utilizados
  - Cupertino Icons;
  - Http;
  - Provider;
  - Google Fonts;
  - Dio;
 
 OBS: as requisições HTTP foram realizadas tanto com o pacote HTTP quanto com o DIO a fim de demonstrar minhas habilidades com ambos.
 
 ## Observações sobre o projeto
 - Para que a construção e demonstração da página ficassem mais completas, construí a tela inicial e suas funcionalidades;
 - A requisição da lista de gêneros é feita logo no início da execução e mantida em uma variável "final" para que a execução das outras requisições fossem executadas mais rapidamente. Levando em conta que estes valores são fixos ou algo bem próximo a isso, julguei ser uma estratégia mais interessante não fazer com que sejam requisitados mais de uma vez ao longo da execução do app;
 - Devido às limitações técnicas (não disponibilidade de um iPhone e de um Mac), os testes não foram realizados na plataforma da Apple (iOS).

## Há um problema (RESOLVIDO) 
 Não sei dizer se é por limitação da minha conexão ou do meu equipamento utilizado no desenvolvimento deste app, mas o único problema conhecido encontrado no app até o presente momento, é que rodando em modo depuração (debug) as imagens utilizadas nas miniaturas da lista de sugestão (utilizando Image.network) apresentam erro de carregamento pelo que parece ser o tempo de carregamento/download das imagens. Problema que não ocorre com o app rodando em release mode.
 ### ATUALIZAÇÃO SOBRE O PROBLEMA
 O problema é causado por um dos filmes na lista de filmes sugeridos relacionados ao filme "A HORA DO PESADELO". O filme é chamado bodybag e não está retornando corretamente sua imagem de capa.
 
 ![screens](https://user-images.githubusercontent.com/84111045/161465312-547c7ce6-1db2-48bd-892c-a9ea197ae06a.png)


