#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main()
{
    long long int it = 0;
    while (1) {
        int *ptr = (int*) malloc(100 * 1024 * 1024);
        memset(ptr, 100, 100 * 1024 * 1024);
        it++;
        printf("%lld\n", it);
        sleep(1);
    }
    return 0;
}
