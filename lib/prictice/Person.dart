class Person {
  final List<int> _score = [];

  String? name;
  int? age;
  String? _sex;

  String? get sex => _sex;

  set setSex(String value) {
    if (value.isNotEmpty) {
      _sex = value;
    }
  }

  void addScore(int value) {
    _score.add(value);
  }

  int get getScoreLength {
    return _score.length;
  }
}
