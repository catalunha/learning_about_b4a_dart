<a id="introducao"></a>
# learning_about_b4a_dart

Meu maior motivador em construir este repositório é meu desejo em compartilhar com vocês o que venho aprendendo sobre tudo isto. Este pequeno projeto, usando puro Dart, servirá também para alguns testes com back4app.com no que envolve database. 

Este texto é um roteiro para os vídeos desta playlist ??. E com a ajuda de vocês vou acrescentando o que for necessário neste texto e atualizando nos vídeos.

Antes de começar talvez voĉe se pergunte. Porque back4app ? Ou ate mesmo. O que é back4app ?

Em rápidas palavras foi assim... 

Ao iniciar meus estudos em Dart/Flutter fui logo para o Firebase. Então analisando melhor a documentação vi que o Firebase é openCredCard, ou seja, você cadastra seu cartão de crédito e se sua aplicação crescer, ou for atacado ou cometer um erro de loop o Firebase não quer saber. Vai te cobrar e pronto. 

Ai buscando outras alternativas, meu grande amigo Paulo Roberto Cruz, me indicou esta solução completa para um backend que outrora foi iniciativa do Facebook mas agora esta nas boas mãos da comunidade.

E aqui estou eu. Após várias cabeçadas compartilhando com vocês o que aprendi. E espero ajudar alguns. E aceito ajuda de todos. Neste repo trato apenas de banco de dados os demais tópicos deixarei indicado meus repos de aprendizado no referido assunto.

No back4app.com encontramos:
1. Autenticação
2. Banco de dados
3. Hospedagem
4. Funções em nuvem
5. E outras coisas ...

Este conteúdo será compartilhado no tabnews https://www.tabnews.com.br/catalunha

E sobre tudo isto vamos conversando no chat do tabnews ou neste discord https://discord.com/channels/766282533292998691/766282694967296030

Este texto é melhor detalhado neste vídeo: https://youtu.be/btNzdAqjcHc

Você pode assiste aos vídeos do sumário nesta [playlist](https://www.youtube.com/playlist?list=PL-rdGqWQhUzjox1WRqMOLiPE9njvgZbuZ)

<a id="sumario"></a>
## Sumário dos Posts
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


[Voltar ao sumário](#sumario)

---
---
<a id="apresentacao"></a>

# Apresentação do projeto Dart/Flutter deste tutorial

Este texto é melhor detalhado neste vídeo: https://youtu.be/RM3gYIrJjrY

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/pkNyrW2Xg58 

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/SQ5sUlg8wgU

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
[Voltar ao sumário](#sumario)

---
---
<a id="genre_dados"></a>
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

[Voltar ao sumário](#sumario)

---
---
<a id="genre_buscas"></a>
# Buscas em Genre via App Dart

Este texto é melhor detalhado neste vídeo: https://youtu.be/n52yn52uavQ

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/4bcg90pIoGo

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/0vf6yp_2lWs

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/oRga5HqokXc

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/dgOddus97PQ

Bora codar...

As buscas na tabela Shape serão:
1. getObject

[Voltar ao sumário](#sumario)

---
---
<a id="publisher_dados"></a>
# Dados em Publisher via App Dart

Este texto é melhor detalhado neste vídeo: https://youtu.be/qtd7MRriJbs

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/8kGgIJc8p9Q

Bora codar... 

As buscas na tabela Publisher serão:
1. getObject

[Voltar ao sumário](#sumario)

---
---
<a id="book_dados"></a>
# Dados em Book via App Dart

Este texto é melhor detalhado neste vídeo: https://youtu.be/Ha8ffU5bxP4

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

Este texto é melhor detalhado neste vídeo: https://youtu.be/97g5ZL51thA

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
