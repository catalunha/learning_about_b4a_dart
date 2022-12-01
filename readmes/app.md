# Criando o app Dart e Conexão do app com a b4a

Você pode clonar este repositorio em https://github.com/catalunha/learning_about_b4a_dart

Ou, para criar passo a passo nosso App em puro Dart faça assim:
* Abra seu VSCode
* tecle **F1**
* selecione o busque **Dart: New project**
* selecione **Console application**
* selectione a pasta onde salvar este projeto
* informe este nome para o projeto: learning_about_b4a_2_dart
* espere o VSCode criar o projeto

Edite o arquivo pubspec.yaml desta forma. Atualize-o.

```yaml
dependencies:
  path: ^1.8.0
  dotenv: ^4.0.1
  parse_server_sdk: ^3.1.3
```
A estrutura de nosso projeto será:
```
app/
├── app.dart
├── core
│   └── models
│       ├── author_model.dart
│       ├── book_model.dart
│       ├── genre_model.dart
│       ├── publisher_model.dart
│       └── shape_model.dart
├── data
│   └── b4a
│       ├── connect_b4a.dart
│       ├── entity
│       │   ├── author_entity.dart
│       │   ├── book_entity.dart
│       │   ├── genre_entity.dart
│       │   ├── publisher_entity.dart
│       │   └── shape_entity.dart
│       └── tables
│           ├── author
│           │   └── author_repository.dart
│           ├── book
│           │   └── book_repository.dart
│           ├── genre
│           │   └── genre_repository.dart
│           ├── publisher
│           │   └── publisher_repository.dart
│           └── shape
│               └── shape_repository.dart
└── presentation
    ├── author
    │   ├── author_controller.dart
    │   ├── author_page.dart
    │   └── author_view.dart
    ├── book
    │   ├── book_controller.dart
    │   ├── book_page.dart
    │   └── book_view.dart
    ├── genre
    │   ├── genre_controller.dart
    │   ├── genre_page.dart
    │   └── genre_view.dart
    ├── publisher
    │   ├── publisher_controller.dart
    │   ├── publisher_page.dart
    │   └── publisher_view.dart
    └── shape
        ├── shape_controller.dart
        ├── shape_page.dart
        └── shape_view.dart

```
Maiores comentários sobre cada parte eu farei nos videos.

Iremos construir cada arquivo a medida de sua necessidade

