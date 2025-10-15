#include <stdlib.h>
#include <string.h>

#include "moonbit.h"

// Test function that returns a pointer to a string "hello"
MOONBIT_FFI_EXPORT
const void*
moonbit_main_hello_pointer(void)
{
  const char* s = "hello";
  size_t len = strlen(s);
  char* buf = (char*)malloc(len + 1);
  if (buf == NULL)
    return NULL;
  memcpy(buf, s, len + 1); // copy includeing NUL
  return (const void*)buf;
}
