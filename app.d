import std;
import mir.ndslice;

void main() {
  writeln("Hello, D!");

  auto matrix = slice!double(3, 4);
  matrix[] = 0;
  matrix.diagonal[] = 1;

  auto row = matrix[2];
  row[3] = 6;
  assert(matrix[2, 3] == 6); // D & C index order
  matrix.writeln;
}
