// Hàm kiểm tra số nguyên tố
import 'dart:math';

bool isPrime(int num) {
  if (num <= 1) return false;
  if (num == 2) return true;
  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}

// Hàm đọc số trong tiếng Việt
String readInVietnamese(int num) {
  List<String> units = ['', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín'];
  List<String> tens = ['', 'mười', 'hai mươi', 'ba mươi', 'bốn mươi', 'năm mươi', 'sáu mươi', 'bảy mươi', 'tám mươi', 'chín mươi'];
  List<String> hundreds = ['', 'một trăm', 'hai trăm', 'ba trăm', 'bốn trăm', 'năm trăm', 'sáu trăm', 'bảy trăm', 'tám trăm', 'chín trăm'];

  if (num < 10) {
    return units[num];
  } else if (num < 100) {
    int ten = num ~/ 10;
    int unit = num % 10;
    return (unit == 0) ? tens[ten] : '${tens[ten]} ${units[unit]}';
  } else {
    int hundred = num ~/ 100;
    int ten = (num % 100) ~/ 10;
    int unit = num % 10;
    if (ten == 0 && unit == 0) {
      return hundreds[hundred];
    } else if (ten == 0) {
      return '${hundreds[hundred]} linh ${units[unit]}';
    } else if (unit == 0) {
      return '${hundreds[hundred]} ${tens[ten]}';
    } else {
      return '${hundreds[hundred]} ${tens[ten]} ${units[unit]}';
    }
  }
}

void main() {
  // Bước A: Tạo List gồm các số nguyên < 1000, nhỏ hơn 100 phần tử
  List<int> listA = [];
  int lenght = Random().nextInt(99) + 1;
  for (int i=1; i< lenght; i++) { 
    listA.add(Random().nextInt(1000));
  }

  // Bước B: Cho các số trong List(A) vào một Set khác để lọc các số trùng
  Set<int> setB = {};
  for (int num in listA) {
    setB.add(num);
  }

  // Bước C: Tạo List mới bao gồm các số nguyên tố có trong Set(B)
  List<int> listC = [];
  for (int num in setB) {
    if (isPrime(num)) {
      listC.add(num);
    }
  }

  // Bước D: Tạo Map có key là các số có trong List(C) và value là cách đọc của nó trong tiếng việt
  Map<int, String> mapD = {};
  for (int primeNum in listC) {
    mapD[primeNum] = readInVietnamese(primeNum);
  }

  // In các bước ra để kiểm tra tính chính xác
  print('Bước A: List các số nguyên < 1000:');
  print(listA);
  print('-------------------------------------');
  print('Bước B: Set sau khi loại bỏ các số trùng:');
  print(setB);
  print('-------------------------------------');
  print('Bước C: List các số nguyên tố:');
  print(listC);
  print('-------------------------------------');
  print('Bước D: Map các số nguyên tố và cách đọc của chúng trong tiếng Việt:');
  print(mapD);
}

