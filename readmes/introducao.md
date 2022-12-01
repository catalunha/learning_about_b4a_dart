# learning_about_b4a_dart

Este repositório é um pequeno projeto para eu aprender um pouco mais sobre back4app usando puro Dart. Outro motivador em construir este repostorio é meu desejo de compartilhar com vocês o que venho aprendendo.

Este texto é apenas um roteiro, detalhamento, ou correção do que vou compartilhando nesta playlist: 

Antes de começar talvez vc se pergunte. Porque back4app ? Ou ate mesmo. O que é back4app ?

Em rapidas palavras foi assim... 

Eu estava muito feliz com o Firebase. Mas comecei a crescer e bater nos limites. Então analisando melhor a documentação vi que o Firebase é open card, ou seja, vc cadastra seu cartão de crédito e se sua aplicação crescer, ou for atacado ou cometer um erro de loop o Firebase não quer saber. Vai te cobrar e pronto. 

Ai buscando outras alternativas, meu grande amigo Paulo Roberto Cruz, me indicou esta solução completa para um backend que outrora foi iniciativa do Facebook mas agora esta nas boas mãos da comunidade.

E aqui esto eu. Após várias cabeçadas compartilhando com vcs o que aprendi. E espero ajudar alguns.

# Posts
Os artigos serão escritos em markdown, salvos aqui e compartilhados no tabnews https://www.tabnews.com.br/catalunha

## Sumário dos Posts
1. [Apresentação do projeto Dart/Flutter deste tutorial](readmes/apresentacao.md)
    1. Dart (ok)
    0. Flutter (em construção)
0. [As tabelas, seus campos, e suas relações.](readmes/tabelas.md)
    1. Relações num DataBase b4a
    0. Tipos comuns em b4a
    0. json objects
0. [Criando o database no back4app.com](readmes/database.md)
    1. Genre
    0. Author
    0. Shape
    0. Publisher
    0. Book
0. [Criando o app Dart e Conexão do app com a b4a](readmes/app.md)
    1. app console dart
0. [Dados em Genre via App Dart](readmes/genre_dados.md)
    1. typeString
    0. typeBoolean
    0. typeNumber
    0. typeDateTime
    0. typeArray
    0. lib/data/b4a/tables/genre/genre_repository.dart
    0. lib/core/models/genre_model.dart
    0. lib/data/b4a/entity/genre_entity.dart
0. [Buscas em Genre via App Dart](readmes/genre_buscas.md)
    1. count
    2. getObject
    3. getAll
    4. queryBuilder
    5. queryBuilder_OrderByAscending
    6. queryBuilder_OrderByDescending
    7. queryBuilder_ExcludeKeys
    8. queryBuilder_KeysToReturn
    9. queryBuilder_Pagination
    10. queryBuilder_WhereEqualToSimpleColumn
    11. queryBuilder_WhereNotEqualToSimpleColumn
    12. queryBuilder_WhereGreaterThan
    13. queryBuilder_WhereGreaterThanOrEqualsTo
    14. queryBuilder_WhereLessThan
    15. queryBuilder_WhereLessThanOrEqualTo
    16. queryBuilder_WhereValueExists
    17. queryBuilder_WhereStartsWith
    18. queryBuilder_WhereEndsWith
    19. queryBuilder_WhereContains
    20. queryBuilder_WhereContainedIn
    21. queryBuilder_WhereArrayContainsAll
    22. queryBuilder_Or
0. [Dados em Author via App Dart](readmes/author_dados.md)
    1. typePointer to Genre
0. [Buscas em Author via App Dart](readmes/author_buscas.md)
    1. queryBuilder_IncludeObject
    2. queryBuilder_WhereEqualToPointer
    3. queryBuilder_WhereMatchesQuery
    4. queryBuilder_WhereDoesNotMatchQuery
    5. queryBuilder_WhereMatchesKeyInQuery
    6. queryBuilder_WhereDoesNotMatchKeyInQuery
0. [Dados em Shape via App Dart](readmes/shape_dados.md)
    1. typeFile
    0. typeObject
0. [Buscas em Shape via App Dart](readmes/shape_buscas.md)
0. [Dados em Publisher via App Dart](readmes/publisher_dados.md)
    1. typePointer to Shape
0. [Buscas em Publisher via App Dart](readmes/publisher_buscas.md)
0. [Dados em Book via App Dart](readmes/book_dados.md)
    1. typePointer to Publisher
    1. typeRelation to Author
0. [Buscas em Book via App Dart](readmes/book_buscas.md)
    1. queryBuilder_IncludeObject
    2. queryBuilder_WhereEqualToRelation
    3. queryBuilder_WhereMatchesQuery
    4. queryBuilder_WhereDoesNotMatchQuery
0. [issues, tickets, etc](readmes/issues.md)