import 'dart:convert';
import 'dart:io';
import 'questions.dart';

class exam {
  List<questions> question = [];

  void addQuestion(questions q) {
    question.add(q);
  }

  List<questions> getExam() {
    return question;
  }

  Future<void> writeFile(String name) async {
    try {
      int i = 0;
      String directory = "Exams";
      Directory carpeta = Directory(directory);
      if (!await carpeta.exists()) {
        await carpeta.create();
        print('Se creo correctamente');
      }

      File f = File('$directory/$name.txt');
      IOSink sink = f.openWrite();

      if (await f.exists()) {
        while (i < question.length) {
          sink.writeln(question[i].getQuestion());
          List aux = question[i].getAnswers();
          sink.writeln(aux[0] + " " + aux[1] + " " + aux[2] + " " + aux[3]);

          i++;
        }
      } else {
        f.create();
        i = 0;
        while (i < question.length) {
          sink.writeln(question[i].getQuestion());
          List aux = question[i].getAnswers();
          sink.writeln('$aux');
          i++;
        }
      }
      writeFileJson(name);
      await sink.flush();
      await sink.close();
    } catch (e) {
      print(e);
    }
  }

  Future<List<questions>> readFile(String name) async {
    var i = 0;
    List<questions> aux = [];
    try {
      var directory = Directory.current.path;
      File f = File('$directory/Exams/$name.txt');
      String pregunta = '';
      if (await f.exists()) {
        Stream<List<int>> inputStream = f.openRead();
        await for (var line in inputStream
            .transform(utf8.decoder)
            .transform(const LineSplitter())) {
          if (i % 2 == 0) {
            pregunta = line;
          } else {
            List<String> separador = line.split(" ");
            questions agr = questions(pregunta, separador, '', '');
            aux.add(agr);
          }
          i++;
        }
      } else {
        print("El archivo no existe");
      }
    } catch (e) {
      print(e);
    }
    return aux;
  }

  Future<void> writeFileJson(String name) async {
    try {
      String path = Directory.current.path;
      File f = File('$path/Exams/$name.json');
      IOSink sink = f.openWrite();
      if (await f.exists()) {
        List<Map<String, dynamic>> examJson =
            question.map((test) => test.toJson()).toList();
        String mensaje = jsonEncode(examJson);
        sink.writeln(mensaje);
      } else {
        f.create();
        for (var i = 0; i < question.length; i++) {
          String mensaje = jsonEncode(question[i]);
          sink.writeln(mensaje);
        }
      }
      await sink.flush();
      await sink.close();
    } catch (e) {
      print(e);
    }
  }

  Future<void> readFileJson(String name) async {
    try {
      String path = Directory.current.path;
      File archivo = File('$path/Exams/$name.json');
      String content = archivo.readAsStringSync();
      List<dynamic> data = jsonDecode(content);
      print(data[1]);
    } catch (e) {
      print(e);
    }
  }
}
