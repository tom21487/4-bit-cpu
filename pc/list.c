#include "stdio.h"
const int HALF_PERIOD = 136;
int main()
{
    int time = 0;
    printf("time %dns | clock init\n", time);
    time += HALF_PERIOD*2;
    printf("time %dns | test 0 | pc=x\n", time);
    time += HALF_PERIOD*2;
    printf("time %dns | test 1 | pc=0\n", time);
    time += HALF_PERIOD*2;
    int range = 0;
    for (int test = 2; test <= 16; test++) {
        printf("time %dns | test %d | pc=%d\n", time, test, test-1);
        time += HALF_PERIOD*2;
        range += HALF_PERIOD*2;
    }
    printf("time %dns | test 17 | pc=0\n", time);
    time += HALF_PERIOD*2;
    range += HALF_PERIOD*2;
    printf("range %dns\n", range);
    return 0;
}
