// addition loops
#include <stdio.h>
int main() {
  printf("first loop\n");
  for(int i = -50; i <= 245; i+= 8) {
    printf("%d\n", i);
  }
  printf("second loop\n");
  for(int i = 238; i >= -50; i += -8) {
    printf("%d\n", i);
  }
  printf("third loop\n");
  for(int i = -50; i < 238; i+= 8) {
    printf("%d\n", i);
  }
  printf("fourth loop\n");
  for(int i = 230; i > -47; i += -8) {
    printf("%d\n", i);
  }
}
