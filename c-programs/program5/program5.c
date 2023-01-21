#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 100

int stack[MAX_SIZE];
int top = -1;

void push(int x) {
    if (top == MAX_SIZE - 1) {
        printf("Error: Stack overflow\n");
        return;
    }
    stack[++top] = x;
    printf("%d pushed to stack\n", x);
}

int pop() {
    if (top == -1) {
        printf("Error: Stack underflow\n");
        return -1;
    }
    printf("%d popped from stack\n", stack[top]);
    return stack[top--];
}

void print_stack() {
    printf("Stack: ");
    for (int i = 0; i <= top; i++) {
        printf("%d ", stack[i]);
    }
    printf("\n");
}

int main() {
    push(3);
    push(5);
    push(7);
    print_stack();
    pop();
    print_stack();
    return 0;
}
