#include <stdio.h>

int many_add(int n1, int n2, int n3, int n4, int n5, int n6, int n7)
{
    int result = n1 + n2 + n3 + n4 + n5 + n6 + n7;
    return result;
}

void main()
{
    int result;
    result = many_add(1, 2, 3, 4, 5, 6, 7);
    printf("%d\n", result);
}