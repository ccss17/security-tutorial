#include <stdio.h>

int add(int n1, int n2)
{
    puts("Hello World!");
    return n1 + n2;
}

int main(void)
{
    int a = 8;
    int b = 1024;
    int result = add(a, b);
    printf("a + b = %d\n", result);
    return 0;
}