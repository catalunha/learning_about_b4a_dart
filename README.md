<a id="introducao"></a>
# learning_about_b4a_dart

Este repositório é um pequeno projeto para eu aprender um pouco mais sobre back4app usando puro Dart. Outro motivador em construir este repostorio é meu desejo de compartilhar com vocês o que venho aprendendo.

Este texto é apenas um roteiro, detalhamento, ou correção do que vou compartilhando nesta playlist: 

Antes de começar talvez vc se pergunte. Porque back4app ? Ou ate mesmo. O que é back4app ?

Em rapidas palavras foi assim... 

Eu estava muito feliz com o Firebase. Mas comecei a crescer e bater nos limites. Então analisando melhor a documentação vi que o Firebase é open card, ou seja, vc cadastra seu cartão de crédito e se sua aplicação crescer, ou for atacado ou cometer um erro de loop o Firebase não quer saber. Vai te cobrar e pronto. 

Ai buscando outras alternativas, meu grande amigo Paulo Roberto Cruz, me indicou esta solução completa para um backend que outrora foi iniciativa do Facebook mas agora esta nas boas mãos da comunidade.

E aqui esto eu. Após várias cabeçadas compartilhando com vcs o que aprendi. E espero ajudar alguns.

# Posts e Forum
Os artigos serão escritos em markdown, salvos aqui e compartilhados no tabnews https://www.tabnews.com.br/catalunha

No restante do tutorial tentarei manter o maximo de coisas que eu já fiz com as que vou refazendo pra compartilhar com vc. Se algo estiver a frente ou a trás do que falo ou faço tentarei explicar no video ou atualizar via texto aqui. 
E sobre tudo isto vamos conversar no chat do tabnews ou neste discord https://discord.com/channels/766282533292998691/766282694967296030
<a id="sumario"></a>
## Sumário dos Posts
1. [Apresentação do projeto Dart/Flutter](#apresentacao)
    1. Dart (ok)
    2. Flutter (em construção)
2. [As tabelas, seus campos, e suas relações.](#tabelas)
    1. Relações num DataBase b4a
    2. Tipos comuns em b4a
    3. json objects
3. [Criando o database no back4app.com](#database)
    1. Genre
    2. Author
    3. Shape
    4. Publisher
    5. Book
4. [Criando o app Dart e Conexão do app com a b4a](#app)
    1. app console dart
5. [Dados em Genre via App Dart](#genre_dados)
    1. typeString
    2. typeBoolean
    3. typeNumber
    4. typeDateTime
    5. typeArray
    6. addAll
    7. add
    8. update
    9. unset
    10. delete
    11. removeAll
    12. typeArraySetAdd
    13. typeArraySetAddUnique
    14. typeArraySetAddAll
    15. typeArraySetAddAllUnique
    16. typeNumberIncrement
    17. typeNumberDecrement
    18. lib/data/b4a/tables/genre/genre_repository.dart
    19. lib/core/models/genre_model.dart
    20. lib/data/b4a/entity/genre_entity.dart
    21. lib/app/presentation/genre/genre_page.dart
    22. lib/app/presentation/genre/genre_view.dart
    23. lib/app/presentation/genre/genre_controller.dart
6. [Buscas em Genre via App Dart](#genre_buscas)
    1. count
    2. getObject
    3. getAll
    4. queryBuilder
    5. queryBuilder_OrderByAscending
    6. queryBuilder_OrderByDescending
    7. queryBuilder_ExcludeKeys
    8. queryBuilder_KeysToReturn
    9.  queryBuilder_Pagination
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
7. [Dados em Author via App Dart](#author_dados)
    1. typePointer to Genre
8. [Buscas em Author via App Dart](#author_buscas)
    1. queryBuilder_IncludeObject
    2. queryBuilder_WhereEqualToPointer
    3. queryBuilder_WhereMatchesQuery
    4. queryBuilder_WhereDoesNotMatchQuery
    5. queryBuilder_WhereMatchesKeyInQuery
    6. queryBuilder_WhereDoesNotMatchKeyInQuery
9. [Dados em Shape via App Dart](#shape_dados)
    1. typeFile
    2. typeObject
10. [Buscas em Shape via App Dart](#shape_buscas)
11. [Dados em Publisher via App Dart](#publisher_dados)
    1. typePointer to Shape
12. [Buscas em Publisher via App Dart](#publisher_buscas)
13. [Dados em Book via App Dart](#book_dados)
    1. typePointer to Publisher
    2. typeRelation to Author
14. [Buscas em Book via App Dart](#book_buscas)
    1. queryBuilder_IncludeObject
    2. queryBuilder_WhereEqualToRelation
    3. queryBuilder_WhereMatchesQuery
    4. queryBuilder_WhereDoesNotMatchQuery
15. [issues, tickets, etc](#issues)

[Voltar ao sumário](#sumario)

---
---
<a id="apresentacao"></a>

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

[Voltar ao sumário](#sumario)

---
---
<a id="tabelas"></a>

# As tabelas, seus campos, e suas relações.

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

Criei uma estrutura teórica de relacionamento apenas para facilitar nosso cadastro e busca de dados:

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

[Voltar ao sumário](#sumario)

---
---
<a id="database"></a>
# Criando o database no back4app.com

Este texto a seguir é melhor detalhado neste video: 

Veremos sobre:
  * criação das tabelas
  * criação das colunas
  * exemplos de edição dentro do database do b4a

Bora codar...

Acesse o site https://www.back4app.com/

Realize seu cadastro.

Sua tela após cadastro deve se parecer com a minha.
![](/readmes/files/database/f1.png)

Clique então em NEW APP.

Para padronizar informe

App name: learning_about_b4a_2

Database: mongoDB

![](/readmes/files/database/f2.png)

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

[Voltar ao sumário](#sumario)

---
---
<a id="app"></a>

# Criando o app Dart e Conexão do app com a b4a

Este texto a seguir é melhor detalhado neste video: 

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

Execute o app em modo Debug para pegar as saídas dos log().

[Voltar ao sumário](#sumario)

---
---
<a id="genre_dados"></a>
# Dados em Genre via App Dart

Este texto a seguir é melhor detalhado neste video: 

Trataremos apenas dos seguintes campos
1. typeString
2. typeBoolean
3. typeNumber
4. typeDateTime
5. typeArray

A manipulação de dados nesta tabela envolverá:
1. addAll
2. add
3. update
4. unset
5. delete
6. removeAll
7.  typeArraySetAdd
8.  typeArraySetAddUnique
9.  typeArraySetAddAll
10. typeArraySetAddAllUnique
11. typeNumberIncrement
12. typeNumberDecrement


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

[Voltar ao sumário](#sumario)

---
---
<a id="genre_buscas"></a>
# Buscas em Genre via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

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

[Voltar ao sumário](#sumario)

---
---
<a id="author_dados"></a>
# Dados em Author via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

A manipulação de dados nesta tabela envolverá:
* addAll
* add
* update
* unset
* delete
* removeAll

[Voltar ao sumário](#sumario)

---
---
<a id="author_buscas"></a>
# Buscas em Author via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

As buscas na tabela Author serão:
1. queryBuilderIncludeObject
2. queryBuilderWhereEqualToPointer
3. queryBuilderWhereMatchesQuery
4. queryBuilderWhereDoesNotMatchQuery
5. queryBuilderWhereMatchesKeyInQuery
6. queryBuilderWhereDoesNotMatchKeyInQuery

[Voltar ao sumário](#sumario)

---
---
<a id="shape_dados"></a>
# Dados em Shape via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

A manipulação de dados nesta tabela envolverá:
* addAll
* add
* update
* unset
* delete
* removeAll

[Voltar ao sumário](#sumario)

---
---
<a id="shape_buscas"></a>
# Buscas em Shape via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

As buscas na tabela Shape serão:
1. getObject

[Voltar ao sumário](#sumario)

---
---
<a id="publisher_dados"></a>
# Dados em Publisher via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar...

A manipulação de dados nesta tabela envolverá:
* addAll
* add
* update
* unset
* delete
* removeAll

[Voltar ao sumário](#sumario)

---
---
<a id="publisher_buscas"></a>
# Buscas em Publisher via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar... 

As buscas na tabela Publisher serão:
1. getObject

[Voltar ao sumário](#sumario)

---
---
<a id="book_dados"></a>
# Dados em Book via App Dart

Este texto a seguir é melhor detalhado neste video: 

Bora codar... 

A manipulação de dados nesta tabela envolverá:
* addAll
* add
* update
* unset
* delete
* removeAll

[Voltar ao sumário](#sumario)

---
---
<a id="book_buscas"></a>
# Buscas em Book via App Dart


Este texto a seguir é melhor detalhado neste video: 

Veremos sobre:
* buscas

Bora codar...

As buscas na tabela Book serão:
1. queryBuilderIncludeObject
2. queryBuilderWhereEqualToRelation
3. queryBuilderWhereMatchesQuery
4. queryBuilderWhereDoesNotMatchQuery

[Voltar ao sumário](#sumario)

---
---
<a id="issues"></a>

# issues, tickets, etc

## issues
As seguintes issues foram geradas ao longo dos estudos.

* https://github.com/parse-community/Parse-SDK-Flutter/issues/799
* https://github.com/parse-community/Parse-SDK-Flutter/issues/803
* https://github.com/parse-community/Parse-SDK-Flutter/issues/801

## b4a Support
Os seguintes tickets no suport da b4a foram geradas ao longo dos estudos.

* https://help.back4app.com/hc/en-us/requests/31976
* https://help.back4app.com/hc/en-us/requests/31978
* https://help.back4app.com/hc/en-us/requests/31980
* https://help.back4app.com/hc/en-us/requests/31983
* https://help.back4app.com/hc/en-us/requests/31985

Acessar meus tickets:
* https://help.back4app.com/hc/en-us/requests
* https://help.back4app.com/hc/en-us/requests/new

[Voltar ao sumário](#sumario)

---
---
