dynamic oddOrEven(int number) {
  // TODO 1:
  if (number % 2 == 0) {
    return 'even';
  } else {
    return 'odd';
  }
  // End of TODO 1
}

dynamic createListOneToX(int x) {
  final List<int> list = [];

  for (int i = 1; i <= x; i++) {
    list.add(i);
  }
  // End of TODO 2

  return list;
}

void main() {
  // Cetak true
  print(true);

  // Cetak pola bintang
  print(getStars(4));
}

String getStars(int n) {
  var result = '';
  // TODO 3
  for (int i = n; i > 0; i--) {
    result += '*' * i + '\n';
  }
  // End of TODO 3

  return result;
}
