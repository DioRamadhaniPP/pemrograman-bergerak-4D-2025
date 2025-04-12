dynamic studentInfo() {
  // TODO 1

  String name = 'Dio Ramadhani Pratama Purwono';
  int favNumber = 0;
  bool isPraktikan = true;

  // End of TODO 1
  return [name, favNumber, isPraktikan];
}

dynamic circleArea(num r) {
  if (r < 0) {
    return 0.0;
  } else {
    const double pi = 3.1415926535897932;

    // TODO 2

    return pi * r * r;

    // End of TODO 2
  }
}

int? parseAndAddOne(String? input) {
  // TODO 3

  if (input == null) return null;
  int? number = int.tryParse(input);
  return number != null ? number + 1 : null;

  // End of TODO 3
}
