#include "moonbit.h"
#include <stdlib.h>
#include <string.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_cffi_is_null(const void* ptr)
{
  return ptr == NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_cffi_length(const void* ptr)
{
  if (ptr == NULL) {
    return 0;
  }
  return (int32_t)strlen((const char*)ptr);
}

MOONBIT_FFI_EXPORT
const void*
moonbit_cffi_null(void)
{
  return NULL;
}

MOONBIT_FFI_EXPORT
void
moonbit_cffi_free(void* ptr)
{
  if (ptr != NULL) {
    free(ptr);
  }
}

MOONBIT_FFI_EXPORT
void
moonbit_cffi_memcpy(const void* src, moonbit_bytes_t dest, int32_t n)
{
  if (src == NULL || dest == NULL || n <= 0) {
    return;
  }
  size_t to_copy = (size_t)n;
  size_t src_len = strlen((const char*)src);
  if (src_len < n) {
    to_copy = src_len;
  }
  memcpy((void*)dest, (const char*)src, to_copy);
}

// Test function that returns a pointer to a string "hello"
MOONBIT_FFI_EXPORT
const void*
moonbit_cffi_test_pointer(void)
{
  const char* s = "hello";
  size_t len = strlen(s);
  char* buf = (char*)malloc(len + 1);
  if (buf == NULL)
    return NULL;
  memcpy(buf, s, len + 1); // copy includeing NUL
  return (const void*)buf;
}