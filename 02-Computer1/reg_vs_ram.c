#include <stdio.h>
#include <time.h>

#define MILLION 1000 * 1000
#define BILLION 1000 * 1000 * 1000

void loop_with_reg(int count){
    register int i;
    for (i = 0; i < count; i++);
}

void loop_with_ram(int count){
    int i;
    for (i = 0; i < count; i++);
}

int digits_count(int n){
    int r;
    for(r = 0; n != 0; r++)
        n /= 10;
    return r;
}

int performance_test(int loop_count, void (*target_func)(int)){
    clock_t start = clock();
    target_func(loop_count);
    double microsecs = ((double)clock() - start);
    if (digits_count(microsecs) >= 6) 
        printf("(%d loops)\t%.1f secs\n", loop_count, microsecs / CLOCKS_PER_SEC);
    else 
        printf("(%d loops)\t%.1f msec\n", loop_count, microsecs / 1000.0f);
}

int main() {
    printf("Performance test ram variables\n");
    performance_test(MILLION * 10, loop_with_ram);
    performance_test(BILLION, loop_with_ram);
    printf("Performance test registers variables\n");
    performance_test(MILLION * 10, loop_with_reg);
    performance_test(BILLION, loop_with_reg);
    return 0;
}