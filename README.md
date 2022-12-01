# learning_about_b4a_dart

Este texto a seguir é melhor detalhado neste video: 

Este repositório é um pequeno projeto para eu aprender um pouco mais sobre b4a com puro dart. E também compartilhar com vocês.


## Como té-lo localmente
Abra seu VSCode.

Clone este repositorio, https://github.com/catalunha/learning_about_b4a_dart.git, para uma pasta local em seu computador

Crie o arquivo .env na raiz do projeto e adicione estes linhas. Estas informações podem ser obtidas em seu projeto b4a no dashboard -> App Settings -> Security & Keys 
```
appId = 'your appId'
clientKey = 'your clientKey'
```
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
  * criação das tabelas
  * criação das colunas
  * exemplos de edição dentro do database
* [Criando o app Dart e Conexão do app com a b4a](readmes/app.md)
  * lib/data/b4a/connect_b4a.dart
* [Dados em Genre via App Dart](readmes/genre_dados.md)
  * lib/data/b4a/tables/genre/genre_repository.dart
  * lib/core/models/genre_model.dart
  * lib/data/b4a/entity/genre_entity.dart
* [Buscas em Genre via App Dart](readmes/genre_buscas.md)
  * lib/presentation/genre/genre_view.dart
  * lib/presentation/genre/genre_controller.dart
* [Dados em Author via App Dart](readmes/author_dados.md)
  * add Pointer to Genre
* [Buscas em Author via App Dart](readmes/author_buscas.md)
* [Dados em Shape via App Dart](readmes/shape_dados.md)
  * add Files
  * add Object
* [Buscas em Shape via App Dart](readmes/shape_buscas.md)
* [Dados em Publisher via App Dart](readmes/publisher_dados.md)
  * add Pointer to Shape
* [Buscas em Publisher via App Dart](readmes/publisher_buscas.md)
* [Dados em Book via App Dart](readmes/book_dados.md)
  * Pointer to Publisher
  * Relations to Author
* [Buscas em Book via App Dart](readmes/book_buscas.md)

---
---
# Apresentação do projeto Dart/Flutter deste tutorial

Este texto a seguir é melhor detalhado neste video: 

## Dart 

Neste momento como nosso foco é entender back4app como um database escolher o Dart puro é mais produtivo e não afeta em nada a aplicação destes conhecimentos em Flutter.

O projeto em Dart nos permite entender o b4a de uma forma mais completa e simples no que se refere ao database. Sem as interferencias provocadas por uma interface como é o Flutter.

Depois de vencida a etapa de entender o b4a aplicar isto ao Flutter é simples. Para quem entende de Flutter.

## Flutter

Em construção...

Neste segundo momento iremos desenvolver uma aplicação Flutter para abranger também a parte de login com cadastro de usuarios, emails de verificação e recuperação de senhas.

E trataremos também um pouco sobre cloud functions no cadastro do usuario.

Colocaremos também todos estes conhecimentos de cadastro, atualização e busca de dados vistos no Dart de uma forma visual com Flutter.

Faremos o deploy da aplicação em Flutter Web no b4a. 



---
---

# As tabelas, seus campos, e suas relações.

As relações são:

![](/readmes/files/tabelas/db_relation.jpg)

Adotei coloca o tipo da coluna como nome da coluna pra facilitar o entendimento e no caso de Pointer e Relation informar a tabela relacionada.

Como o nome da coluna informa se tipo você pode imaginar qualquer dado para exemplo e buscas.

As tabelas e os seus campos serão:

1. Book
   1. objectId
   2. typeString
   3. typeBoolean
   4. typeNumber
   5. typeDateTime
   6. typeArray
   7. **typePointerPublisher**
   8. **typeRelationAuthor**
2. Publisher
   1. objectId
   2. typeString
   3. typeBoolean
   4. typeNumber
   5. typeDateTime
   6. typeArray
   7. **typePointerShape**
3. Author
   1. objectId
   2. typeString
   3. typeBoolean
   4. typeNumber
   5. typeDateTime
   6. typeArray
   7. **typePointerGenre**
4. Genre
   1. objectId
   2. typeString
   3. typeBoolean
   4. typeNumber
   5. typeDateTime
   6. typeArray
5. Shape
   1. objectId
   2. typeString
   3. typeBoolean
   4. typeNumber
   5. typeDateTime
   6. typeArray
   7. typeFile
   8. typeObject

Os tipos padroes do b4a são
* String
* Boolean
* Number (que pode ser int ou double)
* DateTime
* Array (normalmente pode ser de)
  * String
  * Boolean
  * Number
* Object (que é um json livre)
* File
* Pointer (uma associação com outra tabela do tipo 1:n)
* Relation (uma associação com outra tabela do tipo m:n)
* GeoPoint (não abordaremos este recurso desta vez)

## observações sobre o typeObject
Pra não deixar duvidas segue uma revisao de estrutura de um json.

Os objetos json, simples sem lista, podem ser do tipo typeString, typeBoolean (true ou false), typeNumber (int ou doble), typeArray (de qualquer tipo), typeObject (um outro json)

Veja que datas e tempos, ou seja DateTime, não são json padroes e são usados em formato de texto.

```json
{
    "typeString": "example",
    "typeBoolean1": true,
    "typeBoolean2": false,
    "typeNumber1": 1,
    "typeNumber2": 3.14,
    "typeNull": null,
    "typeArray": [
        "example",
        true,
        false,
        1,
        3.14,
        null,
        {}
    ],
    "typeObject": {}
}
```
Mas os objetos json também pode vir em formato de lista desta forma. 

```json
[
    {},
    {}
]
```
## observações sobre o typeDateTime
Este sempre é salvo em UTC no b4a. No caso do Brasil em +3h 

Ou seja. 

DateTime em sua aplicação | DateTime no b4a
---|---
2022-01-01 00:00:00 | 2022-01-01 03:00:00 
---
---
# Criando o database no back4app.com

Este texto a seguir é melhor detalhado neste video: 

Acesse o site https://www.back4app.com/

Realize seu cadastro.

Sua tela após cadastro deve se parecer com a minha.
![](/readmes/files/database/f1.png)

Clique então em NEW APP.

Para padronizar informe

App name: learning_about_b4a_2
Database: mongoDB

![](/readmes/files/database/f22.png)

No restante do tutorial tentarei manter o maximo de coisas que eu já fiz com as que vou refazendo pra compartilhar com vc. Se algo estiver a frente ou a trás do que falo ou faço tentarei explicar no video. Mas se ainda nao ficar claro pode lançar suas dúvidas neste discord https://discord.com/channels/766282533292998691/766282694967296030

Então o projeto que já fiz e esta testado se chama learning_about_b4a e este que faço junto com vc se chama learning_about_b4a_2.

Este é o processo de criação e configuração do seu database e demais capacidades de backend que o b4a fornece.

![](/readmes/files/database/f3.png)

Ao final do processo teremos esta tela:

![](/readmes/files/database/f4.png)

O b4a chama as tabelas de Class, os campos de Column e as linhas de linhas Objetos.

Vamos então criar as tabelas/classes e seus campos clicando em **Create a class**

## Genre

Criando a tabela **Genre** conforme esta imagem. Não abordaremos permissões de acesso e outras restrições nesta verão Dart do projeto. Então marque Public Read and Write enabled. Clique em **Create class & add columns**

![](/readmes/files/database/f5.png)

Criaremos agora as colunas desta tabela. Conforme as imagens a seguir. Após cada preenchimento clique em **Add columns & continue**

### typeString
![](/readmes/files/database/f6.png)

### typeBoolean
![](/readmes/files/database/f7.png)

### typeNumber
![](/readmes/files/database/f8.png)

### typeDateTime
![](/readmes/files/database/f9.png)

### typeArray

Este campo aceita qq coisa. Conforme ja comentamos. Basta tratar o tipo no seu código.

![](/readmes/files/database/f10.png)

A lista final de colunas ficou assim:

![](/readmes/files/database/f11.png)

As colunas objectId, updatedAt, createdAt e ACL são criadas automaticamente.

Agora vamos a proxima tabela

## Author

Crie as colunas typeString, typeBoolean, typeNumber, typeDateTime e typeArray igual vc criou na tabela Genre. Acrescentando agora a coluna typePointerGenre que é um ponteiro, 1:n, para a tabela Genre. Desta forma

### typePointerGenre
![](/readmes/files/database/f12.png)

A lista final de colunas ficou assim:

![](/readmes/files/database/f13.png)

Agora vamos a proxima tabela

## Shape

Crie as colunas typeString, typeBoolean, typeNumber, typeDateTime e typeArray igual vc criou na tabela Genre. Acrescentando agora a coluna typeFile e typeObject. Desta forma

### typeFile
![](/readmes/files/database/f14.png)

### typeObject
![](/readmes/files/database/f15.png)

A lista final de colunas ficou assim:

![](/readmes/files/database/f16.png)

## Publisher

Crie as colunas typeString, typeBoolean, typeNumber, typeDateTime e typeArray igual vc criou na tabela Genre. Acrescentando agora a coluna typePointerShape que é um ponteiro, 1:n, para a tabela Shape. Desta forma

### typePointerShape
![](/readmes/files/database/f17.png)

A lista final de colunas ficou assim:

![](/readmes/files/database/f18.png)

Agora vamos a proxima tabela

## Book

Crie as colunas typeString, typeBoolean, typeNumber, typeDateTime e typeArray igual vc criou na tabela Genre. Acrescentando agora a coluna typePointerPublisher que é um ponteiro, 1:n, para a tabela Publisher. E acrescentando agora a coluna typeRelationAuthor que é um relacionamento, m:n, para a tabela Author. Desta forma

### typePointerPublisher
![](/readmes/files/database/f19.png)

### typeRelationAuthor
![](/readmes/files/database/f20.png)

A lista final de colunas ficou assim:

![](/readmes/files/database/f21.png)

## Database final
O esquema completo com todas as tabela ficou assim 
![](/readmes/files/database/f22.png)

reveja o post/video sobre as relações entre elas para que apartir dagora você tenha uma clareza nas adição e busca dos dados.

---
---
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
lib/app/
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
    │   └── author_view.dart
    ├── book
    │   ├── book_controller.dart
    │   └── book_view.dart
    ├── genre
    │   ├── genre_controller.dart
    │   └── genre_view.dart
    ├── publisher
    │   ├── publisher_controller.dart
    │   └── publisher_view.dart
    └── shape
        ├── shape_controller.dart
        └── shape_view.dart
```
Maiores comentários sobre cada parte eu farei nos videos.

Iremos construir cada arquivo a medida de sua necessidade


---
---
# Dados em Genre via App Dart

A maior parte dos comentários desta parte estão neste video:

---
---
# Buscas em Genre via App Dart

A maior parte dos comentários desta parte estão neste video: 

As buscas na tabela Genre serão:
1. count
2. getObject
3. getAll
4. queryBuilder
5. queryBuilderOrderByAscending
6. queryBuilderOrderByDescending
7. queryBuilderExcludeKeys
8. queryBuilderKeysToReturn
9. queryBuilderPagination
10. queryBuilderWhereEqualToSimpleColumn
11. queryBuilderWhereNotEqualToSimpleColumn
12. queryBuilderWhereGreaterThan
13. queryBuilderWhereGreaterThanOrEqualsTo
14. queryBuilderWhereLessThan
15. queryBuilderWhereLessThanOrEqualTo
16. queryBuilderWhereValueExists
17. queryBuilderWhereStartsWith
18. queryBuilderWhereEndsWith
19. queryBuilderWhereContains
20. queryBuilderWhereContainedIn
21. queryBuilderWhereArrayContainsAll
22. queryBuilderOr

---
---
# Dados em Author via App Dart

A maior parte dos comentários desta parte estão neste video: 

---
---
# Buscas em Author via App Dart

A maior parte dos comentários desta parte estão neste video: 

As buscas na tabela Author serão:
1. queryBuilderIncludeObject
2. queryBuilderWhereEqualToPointer
3. queryBuilderWhereMatchesQuery
4. queryBuilderWhereDoesNotMatchQuery
5. queryBuilderWhereMatchesKeyInQuery
6. queryBuilderWhereDoesNotMatchKeyInQuery

---
---
# Dados em Shape via App Dart

A maior parte dos comentários desta parte estão neste video: 

---
---
# Buscas em Shape via App Dart

A maior parte dos comentários desta parte estão neste video: 

As buscas na tabela Shape serão:
1. getObject

---
---
# Dados em Publisher via App Dart

A maior parte dos comentários desta parte estão neste video: 

---
---
# Buscas em Publisher via App Dart

A maior parte dos comentários desta parte estão neste video: 

As buscas na tabela Publisher serão:
1. getObject

---
---
# Dados em Book via App Dart

A maior parte dos comentários desta parte estão neste video: 

---
---
# Buscas em Book via App Dart

A maior parte dos comentários desta parte estão neste video: 

As buscas na tabela Book serão:
1. queryBuilderIncludeObject
2. queryBuilderWhereEqualToRelation
3. queryBuilderWhereMatchesQuery
4. queryBuilderWhereDoesNotMatchQuery
---
---
