# Dados em Genre via App Dart

Este texto é melhor detalhado neste vídeo: https://youtu.be/joj68zuxlgE

Trataremos apenas dos seguintes campos
1. typeString
2. typeBoolean
3. typeNumber
4. typeDateTime
5. typeArray

A manipulação de dados nesta tabela envolverá:
1. add
2. addAll
3. update
4. unset
5. delete
6. removeAll
7.  typeNumberIncrement
8.  typeNumberDecrement
9.  typeArraySetAdd
10. typeArraySetAddUnique
11. typeArraySetAddAll
12. typeArraySetAddAllUnique
12. typeArraySetRemove
13. typeArraySetRemoveAll


Bora codar...

Procurei criar uma certa estrutura no app para tentar organizar algumas coisa mais proximo de um app real.

Então a seguencia de criação dos arquivos será

1. lib/core/models/genre_model.dart
2. lib/data/b4a/entity/genre_entity.dart
3. lib/data/b4a/tables/genre/genre_repository.dart
4. lib/app/presentation/genre/genre_page.dart
5. lib/app/presentation/genre/genre_view.dart
6. lib/app/presentation/genre/genre_controller.dart

Esta será a etapa mais trabalhosa, pois será a referencia para todas as outras. Então preste a atenção que nas demais não repetirei o processo.
