// nested loop
#include <stdio.h>
int main() {
  for(int i = 1; i <= 30; i += 2) {
    for(int j = 1; j <= 64; j *= 2) {
      printf("%d\n", j);
    }
  }
}
