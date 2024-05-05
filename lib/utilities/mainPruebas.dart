import 'package:cuestionarioapp/utilities/exam.dart';
import 'package:cuestionarioapp/utilities/questions.dart';

Future<void> main(List<String> args) async {
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

  test.writeFile('PruebaPrimerExamen');

  List<questions> prueba = await test.readFile('PruebaPrimerExamen');

  test.readFileJson('PruebaPrimerExamen');
}
