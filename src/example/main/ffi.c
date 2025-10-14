
#include "moonbit.h"

// Test function that returns a pointer to a string "hello"
MOONBIT_FFI_EXPORT
const void*
moonbit_main_hello_pointer(void)
{
  return "hello";
}