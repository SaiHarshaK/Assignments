// division loops
#include <stdio.h>
int main() {
  printf("first loop\n");
  for(int i = 67; i >= 1; i /= 2) {
    printf("%d\n", i);
  }
  printf("second loop\n");
  for(int i = 67; i > 1; i /= 2) {
    printf("%d\n", i);
  }
  printf("third loop\n");
  for(int i = -1000; i <= -250; i /= 2) {
    printf("%d\n", i);
  }
  printf("fourth loop\n");
  for(int i = -1000; i < -250; i /= 2) {
    printf("%d\n", i);
  }
}
