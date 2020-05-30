// multiplication loops
#include <stdio.h>
int main() {
  printf("first loop\n");
  for(int i = 1; i <= 100; i*= 2) {
    printf("%d\n", i);
  }
  printf("second loop\n");
  for(int i = 1; i < 64; i *= 2) {
    printf("%d\n", i);
  }
  printf("third loop\n");
  for(int i = -5; i >= -200; i *= 2) {
    printf("%d\n", i);
  }
  printf("fourth loop\n");
  for(int i = -5; i > -160; i *= 2) {
    printf("%d\n", i);
  }
}
