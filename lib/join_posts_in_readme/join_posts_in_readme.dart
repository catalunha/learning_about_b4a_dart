import 'dart:io';

void joinPostsInReadme() {
  String pathREADME = 'README.md';
  var fileREADME = File(pathREADME).openWrite(mode: FileMode.write);
  List<String> parts = [
    'introducao',
    'apresentacao',
    'tabelas',
    'database',
    'app',
    'genre_dados',
    'genre_buscas',
    'author_dados',
    'author_buscas',
    'shape_dados',
    'shape_buscas',
    'publisher_dados',
    'publisher_buscas',
    'book_dados',
    'book_buscas',
  ];
  for (var part in parts) {
    String pathPart = 'readmes/$part.md';
    var dataPart = File(pathPart).readAsStringSync();
    fileREADME.writeln('<a id="$part"></a>');
    fileREADME.writeln(dataPart);
    fileREADME.writeln('[Voltar ao sumário](#sumario)');
    fileREADME.writeln();
    fileREADME.writeln('---');
    fileREADME.writeln('---');
  }
  fileREADME.close();
}
