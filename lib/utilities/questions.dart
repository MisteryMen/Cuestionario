
class questions {
  var ask;
  List<String> answers = [];
  String? correctAnswer;
  String? answer;
  Map<String, String?> toJson() => {
        'question': ask,
        'answers':
            "${answers[0]} ${answers[1]} ${answers[2]} ${answers[3]}",
        'correctAnswer': correctAnswer,
        'answer': answer,
      };

  questions(this.ask, this.answers, this.answer, this.correctAnswer);

  factory questions.fromJson(Map<String, String> json) {
    return questions(
      json['question'] as String,
      json['answers'] as List<String>,
      json['corrrectAnswer'] as String,
      json['answer'] as String,
    );
  }

  String getQuestion() {
    return ask;
  }

  List getAnswers() {
    return answers;
  }

  String? getcAnswers() {
    return correctAnswer;
  }

  void setCorrectAnswer(var res) {
    correctAnswer = res;
  }

  String? getAnswer() {
    return answer;
  }

  void setAnswer(String answerO) {
    answer = answerO;
  }
}
