
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
