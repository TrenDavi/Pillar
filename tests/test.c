int sub (int a, int b) {
   return a - b;
}

int add (int a, int b) {
   return a + b;
}

int main () {
    int i = 0;
    i += 1;
    i *= 3;
    int y = i + 4;

    i = add(i, y);
    sub(i, 5);
}
