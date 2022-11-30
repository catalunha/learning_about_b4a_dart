# learning_about_b4a_dart

Este texto a seguir é melhor detalhado neste video: 

Este repositório é um pequeno projeto para eu aprender um pouco mais sobre b4a com puro dart. E também compartilhar com vocês.


## Como té-lo localmente
Abra seu VSCode
Clone este repositorio, https://github.com/catalunha/learning_about_b4a_dart.git, para uma pasta local em seu computador
Atualize o pubspec.yaml
Execute em modo Debug para pegar as saídas dos log().

Ou simplesmente digite:
`dart bin/learning_about_b4a_dart.dart`
Mas as saídas em log() ficarão ocultas.

## issues
As seguintes issues foram geradas ao longo dos estudos.

### open
https://github.com/parse-community/Parse-SDK-Flutter/issues/799
https://github.com/parse-community/Parse-SDK-Flutter/issues/803

### closed
https://github.com/parse-community/Parse-SDK-Flutter/issues/801

## b4a Support
Os seguintes tickets foram geradas ao longo dos estudos.
https://help.back4app.com/hc/en-us/requests
https://help.back4app.com/hc/en-us/requests/new

### open
https://help.back4app.com/hc/en-us/requests/31976
https://help.back4app.com/hc/en-us/requests/31978
https://help.back4app.com/hc/en-us/requests/31980
https://help.back4app.com/hc/en-us/requests/31983
https://help.back4app.com/hc/en-us/requests/31985

### closed

---

# Os Artigos
Os artigos serão escritos em markdown, salvos aqui e compartilhados no tabnews https://www.tabnews.com.br/catalunha

# Sumário dos artigos

* [Apresentação do projeto Dart/Flutter deste tutorial](/readmes/apresentacao.md)
* [As tabelas, seus campos, e suas relações.](readmes/tabelas.md)
* [Criando o database no back4app.com](readmes/database.md)
  * tabelas
  * campos
  * edições
* [Criando o app Dart e Conexão do app com a b4a](readmes/app.md)
  * lib/data/b4a/connect_b4a.dart
* [Add dados em Genre via App Dart](readmes/genre_dados.md)
  * lib/data/b4a/tables/genre/genre_repository.dart
  * lib/core/models/genre_model.dart
  * lib/data/b4a/entity/genre_entity.dart
* [Buscas em Genre via App Dart](readmes/genre_buscas.md)
  * lib/presentation/genre/genre_view.dart
  * lib/presentation/genre/genre_controller.dart
* [Add dados em Author via App Dart](readmes/author_dados.md)
  * add Pointer to Genre
* [Buscas em Author via App Dart](readmes/author_buscas.md)
* [Add dados em Shape via App Dart](readmes/shape_dados.md)
  * add Files
  * add Object
* [Buscas em Shape via App Dart](readmes/shape_buscas.md)
* [Add dados em Publisher via App Dart](readmes/publisher_dados.md)
  * add Pointer to Shape
* [Buscas em Publisher via App Dart](readmes/publisher_buscas.md)
* [Add dados em Book via App Dart](readmes/book_dados.md)
  * Pointer to Publisher
  * Relations to Author
* [Buscas em Book via App Dart](readmes/book_buscas.md)
