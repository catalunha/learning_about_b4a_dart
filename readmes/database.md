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
