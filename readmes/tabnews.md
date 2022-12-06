
Parabéns Felipe Deschamps, e demais devs, pela história que vocês estão contruindo no Brasil.

Gostaria de compartilhar o que tenho aprendido ao usar o back4app.com como meu backend para alguns projetos. Ele tem recursos interessante para várias linguagens e cenários. Com um SDK bacana para Dart e Flutter.

No back4app.com encontramos:
1. Banco de dados
2. Autenticação
3. Hospedagem
4. Funções em nuvem
5. E outras coisas...

Neste [repositório](https://github.com/catalunha/learning_about_b4a_dart) apresento todos os detalhes do Database do back4app.com em uma aplicação em Dart, que manterei atualizado lá, com a ajuda de vocês é claro, sobre o que vou aprendendo com back4app.com e banco de dados. 

Assim que terminar os outros repositórios sobre back4app vou compartilhando. Estes repos também servirão para alguns testes em nossos batepapos aqui e neste [discord]( https://discord.com/channels/766282533292998691/766282694967296030).

Para cada item do sumário, a seguir, produzi um vídeo que esta nesta [playlist](https://www.youtube.com/playlist?list=PL-rdGqWQhUzjox1WRqMOLiPE9njvgZbuZ).

## Sumário do repositório
1. [Introdução](https://github.com/catalunha/learning_about_b4a_dart#introducao)
   1. Vídeo: https://youtu.be/btNzdAqjcHc
2. [Apresentação do projeto Dart/Flutter](https://github.com/catalunha/learning_about_b4a_dart#apresentacao)
   1. Vídeo: https://youtu.be/RM3gYIrJjrY
   2. Dart (ok)
   3. Flutter (em construção)
3. [As tabelas, seus campos, e suas relações.](https://github.com/catalunha/learning_about_b4a_dart#tabelas)
   1. Vídeo: https://youtu.be/pkNyrW2Xg58
   2. Relações num DataBase b4a
   3. Tipos comuns em b4a
   4. json objects
   5. DateTime e UTC
4. [Criando o database no back4app.com](https://github.com/catalunha/learning_about_b4a_dart#database)
   1. Vídeo: https://youtu.be/SQ5sUlg8wgU
   2. Genre
   3. Author
   4. Shape
   5. Publisher
   6. Book
5.  [Criando o app Dart e Conexão do app com a b4a](https://github.com/catalunha/learning_about_b4a_dart#app)
    1. Vídeo: https://youtu.be/IqQ2nke4Ot0
    2.  app console dart
6.  [Dados em Genre via App Dart](https://github.com/catalunha/learning_about_b4a_dart#genre_dados)
    1. Vídeo: https://youtu.be/joj68zuxlgE
    2. typeString
    3. typeBoolean
    4.  typeNumber
    5.  typeDateTime
    6.  typeArray
    7.  add
    8.  addAll
    9.  update
    10. unset
    11. delete
    12. removeAll
    13. typeNumberIncrement
    14. typeNumberDecrement
    15. typeArraySetAdd
    16. typeArraySetAddUnique
    17. typeArraySetAddAll
    18. typeArraySetAddAllUnique
    19. typeArraySetRemove
    20. typeArraySetRemoveAll
    21. lib/data/b4a/tables/genre/genre_repository.dart
    22. lib/core/models/genre_model.dart
    23. lib/data/b4a/entity/genre_entity.dart
    24. lib/app/presentation/genre/genre_page.dart
    25. lib/app/presentation/genre/genre_view.dart
    26. lib/app/presentation/genre/genre_controller.dart
7.  [Buscas em Genre via App Dart](https://github.com/catalunha/learning_about_b4a_dart#genre_buscas)
    1. Vídeo: https://youtu.be/n52yn52uavQ
    2. count
    3. getObject
    4. getAll
    5. queryBuilder
    6. queryBuilder_OrderByAscending
    7. queryBuilder_OrderByDescending
    8. queryBuilder_ExcludeKeys
    9. queryBuilder_KeysToReturn
    10. queryBuilder_Pagination
    11. queryBuilder_WhereEqualToSimpleColumn
    12. queryBuilder_WhereNotEqualToSimpleColumn
    13. queryBuilder_WhereGreaterThan
    14. queryBuilder_WhereGreaterThanOrEqualsTo
    15. queryBuilder_WhereLessThan
    16. queryBuilder_WhereLessThanOrEqualTo
    17. queryBuilder_WhereValueExists
    18. queryBuilder_WhereStartsWith
    19. queryBuilder_WhereEndsWith
    20. queryBuilder_WhereContains
    21. queryBuilder_WhereContainedIn
    22. queryBuilder_WhereArrayContainsAll
    23. queryBuilder_Or
8.  [Dados em Author via App Dart](https://github.com/catalunha/learning_about_b4a_dart#author_dados)
    1. Vídeo: https://youtu.be/4bcg90pIoGo
    2. typePointer to Genre
9.  [Buscas em Author via App Dart](https://github.com/catalunha/learning_about_b4a_dart#author_buscas)
    1. Vídeo: https://youtu.be/0vf6yp_2lWs
    2. queryBuilder_IncludeObject
    3. queryBuilder_WhereEqualToPointer
    4. queryBuilder_WhereMatchesQuery
    5. queryBuilder_WhereDoesNotMatchQuery
    6. queryBuilder_WhereMatchesKeyInQuery
    7. queryBuilder_WhereDoesNotMatchKeyInQuery
10. [Dados em Shape via App Dart](https://github.com/catalunha/learning_about_b4a_dart#shape_dados)
    1. Vídeo: https://youtu.be/oRga5HqokXc
    2. typeFile
    3. typeObject
11. [Buscas em Shape via App Dart](https://github.com/catalunha/learning_about_b4a_dart#shape_buscas)
    1. Vídeo: https://youtu.be/dgOddus97PQ
12. [Dados em Publisher via App Dart](https://github.com/catalunha/learning_about_b4a_dart#publisher_dados)
    1. Vídeo: https://youtu.be/qtd7MRriJbs
    2. typePointer to Shape
13. [Buscas em Publisher via App Dart](https://github.com/catalunha/learning_about_b4a_dart#publisher_buscas)
    1. Vídeo: https://youtu.be/8kGgIJc8p9Q
14. [Dados em Book via App Dart](https://github.com/catalunha/learning_about_b4a_dart#book_dados)
    1. Vídeo: https://youtu.be/Ha8ffU5bxP4
    2. typePointer to Publisher
    3. typeRelation to Author
15. [Buscas em Book via App Dart](https://github.com/catalunha/learning_about_b4a_dart#book_buscas)
    1. Vídeo: https://youtu.be/97g5ZL51thA
    2. queryBuilder_IncludeObject
    3. queryBuilder_WhereEqualToRelation
    4. queryBuilder_WhereMatchesQuery
    5. queryBuilder_WhereDoesNotMatchQuery

Bora codar e depois compartilhar...

Um abraço a todos.

