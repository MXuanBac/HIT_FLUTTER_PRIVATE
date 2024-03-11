bool isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0 || (year % 400 == 0)) ? true : false;
}

void main() {
  print(isLeapYear(2000));
}