
# Criando o app Dart e Conexão do app com a b4a

Este texto é melhor detalhado neste vídeo: https://youtu.be/IqQ2nke4Ot0

Bora codar...

Para criar passo a passo nosso App em puro Dart e ir desenvolvendo conforme cada video. Faça assim:
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

Crie o arquivo .env na raiz do projeto e adicione as credenciais de acesso ao database.

Estas informações podem ser obtidas em seu projeto b4a no dashboard -> App Settings -> Security & Keys 

```
appId = 'your appId'
clientKey = 'your clientKey'
```

Existem outros recursos do liveQuery que é tipo uma stream do database. Mas não iremos abordar sobre ela neste momento.

Maiores comentários sobre cada parte eu farei nos videos.

Iremos construir cada arquivo a medida de sua necessidade

Mas a seguir apresento a estrutura completa para nosso acompanhamento.

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
    │   ├── author_page.dart
    │   └── author_view.dart
    ├── book
    │   ├── book_controller.dart
    │   ├── book_page.dart
    │   └── book_view.dart
    ├── genre
    │   ├── genre_page.dart
    │   └── genre_search.dart
    ├── publisher
    │   ├── publisher_page.dart
    │   └── publisher_search.dart
    └── shape
        ├── shape_page.dart
        └── shape_search.dart
```

Execute o app em modo Debug para pegar as saídas dos log().

Não esqueça de enviar este projeto ao seu github como privado enquanto vc desenvolve. Depois pode colocar publica pois as credenciais já vão estar salvas pelo dotenv. 