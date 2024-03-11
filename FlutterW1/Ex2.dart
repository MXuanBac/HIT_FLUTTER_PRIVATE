int countDigits(int num) {
  int count = 0;
  while(num != 0) {
    count++;
    num ~/= 10;
  }

  return count;
}

void main () {
  print(countDigits(1234));
}