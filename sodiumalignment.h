#ifndef SODIUMALIGNMENT_H_
#define SODIUMALIGNMENT_H_

typedef struct __attribute__ ((aligned(64))) state {
    unsigned char opaque[384];
} state;

int sizeof_state();
int alignof_state();

#endif // SODIUMALIGNMENT_H_
