#include <unistd.h>

void main(void) {
    write(1, "Hello!\n", 7);
    pause();
}