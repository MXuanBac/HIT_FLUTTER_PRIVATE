late int val =1;
void pascalTriangle(int n, [List<int>? list]) {
  if (val > n) return;
  else {
    List<int> a = [];
    if (val==1) a.add(1);
    else if (val==2) {
      a.add(1);
      a.insert(0, 1);
    }
    else {
      for(int i=0; i<list!.length-1; i++) {
        a.add(list[i] + list[i+1]);
      }
      a.add(1);
      a.insert(0, 1);
    }
    print('$a\n');
    val ++;
    pascalTriangle(n, a); 
  }
}
void main() {
  pascalTriangle(5);
}
