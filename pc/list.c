#include "stdio.h"
int main()
{
    int time = 0;
    printf("time %dns | clock init\n", time);
    time += 116;
    printf("time %dns | test 0 | pc=x\n", time);
    time += 116;
    for (int test = 1; test <= 17; test++) {
        printf("time %dns | test %d | pc=%d\n", time, test, test-1);
        time += 116;
    }
    printf("time %dns | end\n", time);
    printf("range %dns\n", time-(58*6));
    return 0;
}
