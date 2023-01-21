#include <stdio.h>

struct MyClass {
    int x;
    int y;
    void (*myMethod)(struct MyClass*);
};

void myMethod(struct MyClass* this) {
    printf("x: %d, y: %d\n", this->x, this->y);
}

int main() {
    struct MyClass myObj;
    myObj.x = 5;
    myObj.y = 10;
    myObj.myMethod = &myMethod;
    myObj.myMethod(&myObj);
    return 0;
}
