#include <stdio.h>

int main() {
    int x = 5;
    int* ptr = &x;  // ptr is a pointer to the address of x
    printf("Value of x: %d\n", x);
    printf("Address of x: %p\n", &x);
    printf("Value of ptr: %p\n", ptr);
    printf("Value at the address pointed by ptr: %d\n", *ptr);

    *ptr = 10;  // changing the value of x through the pointer
    printf("Value of x after changing through the pointer: %d\n", x);

    int y = 15;
    ptr = &y;  // Changing the value of pointer to point to y
    printf("Value at the address pointed by ptr: %d\n", *ptr);

    return 0;
}
