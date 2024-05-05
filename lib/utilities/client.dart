import 'dart:convert';
import 'dart:io';
import 'package:cuestionarioapp/utilities/exam.dart';
import 'package:cuestionarioapp/utilities/questions.dart';

class clientS {
  void initClient() async {
    List<questions> prueba = Exam();
    try {
      Socket socket = await Socket.connect('127.0.0.1', 4040);
      print('Conectado al servidor');

      // Enviar datos al servidor
      Map<String, dynamic> datos = {prueba[0].getQuestion(): prueba};

      String mensaje = jsonEncode(datos);
      socket.write(mensaje);

      // Leer datos del servidor
      socket.listen(
        (List<int> data) {
          String respuesta = utf8.decode(data);
          print('Respuesta del servidor: $respuesta');
          socket.close();
        },
        onError: (error) {
          print('Error de conexión: $error');
          socket.close();
        },
        onDone: () {
          print('Servidor cerró la conexión');
        },
      );
    } catch (e) {
      print('Error al conectar con el servidor: $e');
    }
  }

  List<questions> Exam() {
    List<questions> aux = [];
    int numPreguntas = 2, i = 0;
    exam test = exam();
    var pregunta1 = "Cual es la masa del sol";
    var pregunta2 = "En que lenguaje esta escrito el siguiente programa";

    questions auxQ;
    List<String> answers1 = ['1', '2', '3', '1989X10^8'];
    List<String> answers2 = ['Java', 'Dart', 'Kotlin', 'Go'];

    auxQ = questions(pregunta1, answers1, '', '');
    test.addQuestion(auxQ);
    auxQ = questions(pregunta2, answers2, '', '');
    test.addQuestion(auxQ);
    aux = test.getExam();

    return aux;
  }
}
