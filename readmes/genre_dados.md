# Dados em Genre via App Dart

Este texto a seguir é melhor detalhado neste video: 

A manipulação de dados nesta tabela envolverá:
* addAll
* add
* update
* unset
* delete
* removeAll

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