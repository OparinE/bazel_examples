#include "lowlevel.h"

int highlevel(){
    return (lowlevel() == 0) ? 0 : 1;
}